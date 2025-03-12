import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' show databaseFactoryFfi;
import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';

import '../models/models.dart';

part 'sqlite_migrations.dart';

String kLocale = Intl.getCurrentLocale();

class SqliteHelper {
  static const _databaseName = 'npng.db';
  static const _databaseVersion = 3; // !

  static const String muscleTable = 'muscles';
  static const String exerciseTable = 'exercises';
  static const String programsTable = 'programs';
  static const String exercisesMusclesTable = 'exercises_muscles';
  static const String userTable = 'user';
  static const String daysTable = 'days';
  static const String workoutsTable = 'workouts';
  static const String logDaysTable = 'log_days';
  static const String logWorkoutsTable = 'log_sets';
  static const String equipmentTable = 'equipment';
  static const String loadTable = 'load';

  static late BriteDatabase _streamDatabase;

  static final SqliteHelper instance = SqliteHelper._privateConstructor();
  static var lock = Lock();

  // only have a single app-wide reference to the database
  static Database? _database;

  // make this a singleton class
  SqliteHelper._privateConstructor();

  /// Open the database or create it from asset.
  Future<Database> _initDatabase() async {
    if (Platform.isWindows || Platform.isLinux) {
      databaseFactory = databaseFactoryFfi;
    }
    final appDbDirectory = await getDatabasesPath();
    final String path = join(appDbDirectory, _databaseName);
    final bool exists = await databaseExists(path);

    // ! Here always created a new database from an asset with the current version.
    // ! If you want to upgrade the database, first you need to do it
    // ! manually in assets/db/npng.db then create the migration.
    // ! After modifying the database, you need to update the version number in the PRAGMA user_version = 5
    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      ByteData data = await rootBundle.load(join('assets', 'db', 'npng.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      log('New DB loaded from template.');
    }

    if (kDebugMode) {
      Sqflite.setDebugModeOn(true);
      log('Init DB, path to file: $path');
    } else {
      Sqflite.setDebugModeOn(false);
    }

    // Opening DB. Note: do not use onCreate, if db comes from asset.
    Database db = await openDatabase(
      path,
      version: _databaseVersion,
      onUpgrade: (db, oldVersion, newVersion) async {
        log('→ oldVersion: $oldVersion');
        log('→ newVersion: $newVersion');

        Batch batch = db.batch();
        if (oldVersion == 1) {
          _upgradeV1toV2(batch);

          log('→ Database migrated from v1 to v2.');
        }
        if (oldVersion == 2) {
          _updateV2toV3(batch);

          log('→ Database migrated from v2 to v3.');
        }
        await batch.commit();
      },
    );

    return db;
  }

  /// Stream database getter.
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Use this object to prevent concurrent access to data
    await lock.synchronized(() async {
      // lazily instantiate the db the first time it is accessed
      if (_database == null) {
        _database = await _initDatabase();
        _streamDatabase = BriteDatabase(_database!);
      }
    });
    return _database!;
  }

  Future<BriteDatabase> get streamDatabase async {
    await database;
    return _streamDatabase;
  }

  /// Close database.
  void close() {
    _streamDatabase.close();
  }

  /// Create backup file.
  Future<String> backupDatabase() async {
    final db = await instance.streamDatabase;
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'npng-backup.db');
    try {
      await deleteDbBackupFile(path);
      await db.rawQuery("VACUUM INTO '$path'");
      return path;
    } catch (e) {
      return '';
    }
  }

  /// Delete backup file.
  Future<void> deleteDbBackupFile(String filePath) async {
    String dbPath = await getDatabasesPath();
    if (filePath != join(dbPath, 'npng.db')) {
      File fileToDel = File(filePath);
      if (await fileToDel.exists()) {
        fileToDel.delete();
      }
    }
  }

  Future<void> deleteExercise(Exercise exercise) async {
    final db = await instance.streamDatabase;
    await db.transaction((txn) async {
      await txn
          .delete(exerciseTable, where: 'id = ?', whereArgs: [exercise.id]);
      await txn.delete(exercisesMusclesTable,
          where: 'exerciseId = ?', whereArgs: [exercise.id]);
    });
    return Future.value();
  }

  Future<void> deleteWorkout(Workout workout) async {
    final db = await instance.streamDatabase;
    await db.delete(
      workoutsTable,
      where: 'id = ?',
      whereArgs: [workout.id],
    );
    return Future.value();
  }

  Stream<List<Day>> findDaysByProgram(int id) async* {
    final db = await instance.streamDatabase;

    yield* db
        .createQuery(daysTable,
            columns: [
              'id',
              'ord',
              '${kLocale}_name AS name',
              '${kLocale}_description AS description',
              'programs_id',
            ],
            orderBy: 'ord',
            where: 'programs_id = ?',
            whereArgs: [id])
        .mapToList((row) => Day.fromJson(row));
  }

  /// Find equipment by id.
  Future<Equipment> findEquipmentById(int id) async {
    final db = await instance.streamDatabase;
    final queryResult = await db.query(
      equipmentTable,
      columns: [
        'id',
        '${kLocale}_name AS name',
        'preinstalled',
      ],
      where: 'id = ?',
      whereArgs: [id],
    );
    return Equipment.fromJson(queryResult.first);
  }

  Stream<List<Exercise>> findExcersisesByMuscle(int id) async* {
    final db = await instance.streamDatabase;
    String sql = '''SELECT 
            $exerciseTable.id AS id, 
            ${kLocale}_name AS name, 
            ${kLocale}_description AS description, 
            equipmentId,
            preinstalled,
            loadId,
            limbs
           FROM $exercisesMusclesTable  
           JOIN $exerciseTable ON exerciseId = exercises.id 
           WHERE muscleId = $id''';

    yield* db.createRawQuery([exercisesMusclesTable], sql).mapToList(
        (row) => Exercise.fromJson(row));
  }

  Future<Exercise> findExerciseById(id) async {
    final db = await instance.streamDatabase;
    final exeList = await db.query(
      exerciseTable,
      columns: [
        'id',
        '${kLocale}_name as name',
        '${kLocale}_description as description',
        'equipmentId',
        'preinstalled',
        'loadId',
        'limbs',
      ],
      where: 'id = $id',
      limit: 1,
    );
    final Exercise exe = Exercise.fromJson(exeList.first);
    return exe;
  }

  /// Find load by id.
  Future<Load> findLoadById(int id) async {
    final db = await instance.streamDatabase;
    final queryResult = await db.query(
      loadTable,
      columns: [
        'id',
        '${kLocale}_name AS name',
        'preinstalled',
      ],
      where: 'id = ?',
      whereArgs: [id],
    );
    return Load.fromJson(queryResult.first);
  }

  /// Get workout for day in log.
  Future<List<LogWorkout>> findLogWorkoutByDay(int logDayId) async {
    final db = await instance.streamDatabase;
    final String sql = '''
    SELECT $logWorkoutsTable.exerciseId AS id,
              repeats,
              repeatsLeft,
              weight,
              weightLeft,
              distance,
              timeLoad,
              $exerciseTable.${kLocale}_name AS name,
              $exerciseTable.limbs AS limbs,
              $exerciseTable.loadId AS loadId
        FROM $logWorkoutsTable
              JOIN
              $exerciseTable ON $logWorkoutsTable.exerciseId = $exerciseTable.id
        WHERE $logWorkoutsTable.logDayId = $logDayId
        ORDER BY $logWorkoutsTable.id;
    ''';
    final List<Map<String, dynamic>> list = await db.rawQuery(sql);
    List<LogWorkout> result = [];
    for (Map<String, dynamic> item in list) {
      result.add(LogWorkout.fromJson(item));
    }
    return result;
  }

  /// All log days.
  Future<List<LogDay>> findMounthLogDaysBetweenDates(
      DateTime start, DateTime finish) async {
    final db = await instance.streamDatabase;
    final String sql = '''
    select 
      $logDaysTable.id AS logDayId, 
      $logDaysTable.dayId AS dayId, 
      start, 
      finish,
      $daysTable.${kLocale}_name AS daysName,
      $programsTable.${kLocale}_name as programsName
    from $logDaysTable
    join $daysTable on $logDaysTable.dayId = $daysTable.id 
    join $programsTable on $daysTable.programs_id = $programsTable.id
    WHERE start > date('${start.toLocal()}') AND start < date('${finish.toLocal()}', '+1 day')
    ORDER BY start
    ''';
    final List<Map<String, dynamic>> list = await db.rawQuery(sql);
    List<LogDay> result = [];
    for (Map<String, dynamic> item in list) {
      result.add(LogDay.fromJson(item));
    }
    return result;
  }

  /// Return workout as a stream.
  Stream<List<Workout>> findWorkoutByDay(int dayId) async* {
    final db = await instance.streamDatabase;
    final String sql = '''
    SELECT 
      workouts.id AS id, 
      exercises.${kLocale}_name AS name, 
      exercises.${kLocale}_description as description, 
      sets, ord, repeats, rest, exerciseId, weight,  
      equipmentId, loadId, limbs, repeatsLeft,
      weightLeft, distance, timeLoad
    FROM workouts 
    JOIN exercises on workouts.exerciseId = exercises.id 
    WHERE dayId = $dayId ORDER BY ord;
      ''';
    yield* db.createRawQuery(
        [workoutsTable], sql).mapToList((row) => Workout.fromJson(row));
  }

  Future<int> getCurrentProgramId() async {
    final db = await instance.streamDatabase;
    final userList = await db.query(userTable, where: 'id = 1');
    return userList.first['programs_id'] as int;
  }

  Future<Program> findProgram(int id) async {
    final db = await instance.streamDatabase;
    final query = await db.query(
      programsTable,
      columns: [
        'id',
        '${kLocale}_name AS name',
        '${kLocale}_description as description',
      ],
      where: 'id = $id',
    );
    return Program.fromJson(query.first);
  }

  /// Import DB.
  Future<void> importDataBase(String filePath) async {
    if (filePath == '') return Future.value();

    final db = await instance.streamDatabase;
    await db.close();

    File file = File(filePath);

    String dbPath = await getDatabasesPath();
    String pathToDbFile = join(dbPath, 'npng.db');

    log('Import, path to DB: $pathToDbFile');

    final copiedFile = file.copySync(pathToDbFile);

    log('Import, copied file: ${copiedFile.path}');
    return Future.value();
  }

  Future<void> insertDay(int programId, Day day) async {
    final db = await instance.streamDatabase;

    final queryResult = await db.query(
      daysTable,
      columns: ['MAX(ord) AS maxOrd'],
      where: 'programs_id = ?',
      whereArgs: [programId],
    );
    int maxOrd = (queryResult.first['maxOrd'] != null)
        ? queryResult.first['maxOrd'] as int
        : -1;

    await db.insert(daysTable, {
      '${kLocale}_name': day.name,
      'ord': ++maxOrd,
      '${kLocale}_description': day.description,
      'programs_id': programId,
    });
    return Future.value();
  }

  Future<void> insertExercise(int muscleId, Exercise exercise) async {
    final db = await instance.streamDatabase;
    await db.transaction((txn) async {
      int id = await txn.insert(exerciseTable, {
        '${kLocale}_name': exercise.name,
        '${kLocale}_description': exercise.description,
        'equipmentId': exercise.equipmentId,
        'preinstalled': exercise.preinstalled,
        'loadId': exercise.loadId,
        'limbs': exercise.limbs,
      });
      await txn.insert(exercisesMusclesTable, {
        'exerciseId': id,
        'muscleId': muscleId,
      });
    });
    return Future.value();
  }

  Future<void> insertLog({
    required DateTime startTime,
    required DateTime finishTime,
    required int dayId,
    required List<WorkoutExercise> exercises,
  }) async {
    final db = await instance.streamDatabase;

    int logDayId = await db.insert(logDaysTable, {
      'start': startTime.toLocal().toString(),
      'finish': finishTime.toLocal().toString(),
      'dayId': dayId,
    });

    await db.transaction((txn) async {
      for (WorkoutExercise item in exercises) {
        for (int i = 0; i < item.sets.length; i++) {
          await txn.insert(logWorkoutsTable, {
            'logDayId': logDayId,
            'exerciseId': item.id,
            'repeats': item.sets[i].repeats,
            'weight': item.sets[i].weight,
            'repeatsLeft': item.sets[i].repeatsLeft,
            'weightLeft': item.sets[i].weightLeft,
            'distance': item.sets[i].distance,
            'timeload': item.sets[i].timeLoad,
          });
        }
      }
    });

    return Future.value();
  }

  Future<void> insertProgram(Exercise program) async {
    final db = await instance.streamDatabase;
    await db.insert(programsTable, {
      '${kLocale}_name': program.name,
      '${kLocale}_description': program.description,
    });
    return Future.value();
  }

  /// Create Workout exercise.
  /// Some values setted as default in the database file.
  /// If application will be moved to another backend
  /// may be need to set it here.
  Future<void> insertWorkout(int dayId, int exersiseId) async {
    final db = await instance.streamDatabase;
    final queryResult = await db.query(
      workoutsTable,
      columns: ['MAX(ord) AS maxOrd'],
      where: 'dayId = ?',
      whereArgs: [dayId],
    );
    int maxOrd = (queryResult.first['maxOrd'] != null)
        ? queryResult.first['maxOrd'] as int
        : -1;

    await db.insert(
      workoutsTable,
      {
        'ord': ++maxOrd,
        'exerciseId': exersiseId,
        'dayId': dayId,
      },
    );
    return Future.value();
  }

  Future<void> reorderDays(List<Day> days) async {
    final db = await instance.streamDatabase;
    await db.transaction((txn) async {
      for (int i = 0; i <= days.length - 1; i++) {
        await txn.update(
          daysTable,
          {'ord': i},
          where: 'id = ?',
          whereArgs: [days[i].id],
        );
      }
    });
    return Future.value();
  }

  Future<void> reorderWorkouts(List<Workout> workouts) async {
    final db = await instance.streamDatabase;
    await db.transaction((txn) async {
      for (int i = 0; i <= workouts.length - 1; i++) {
        await txn.update(
          workoutsTable,
          {'ord': i},
          where: 'id = ?',
          whereArgs: [workouts[i].id],
        );
      }
    });
    return Future.value();
  }

  Future<void> setCurrentProgramId(int id) async {
    final db = await instance.streamDatabase;
    await db.update(userTable, {'programs_id': id}, where: 'id = 1');
    return Future.value();
  }

  Future<int> updateDay(Day day) async {
    final db = await instance.streamDatabase;
    return db.rawUpdate(
        'UPDATE $daysTable SET ${kLocale}_name = ?, ${kLocale}_description = ? WHERE id = ?',
        [day.name, day.description, day.id]);
  }

  /// Update exercise.
  Future<int> updateExercise(Exercise exe) async {
    final db = await instance.streamDatabase;
    return db.rawUpdate('''
        UPDATE $exerciseTable SET 
          ${kLocale}_name = ?,
          ${kLocale}_description = ?, 
          equipmentId = ?,
          loadId = ?,
          limbs = ?
        WHERE id = ${exe.id}''', [
      exe.name,
      exe.description,
      exe.equipmentId,
      exe.loadId,
      exe.limbs,
      exe.id,
    ]);
  }

  Future<int> updateProgram(Program program) async {
    final db = await instance.streamDatabase;
    return db.rawUpdate(
        'UPDATE $programsTable SET ${kLocale}_name = ?, ${kLocale}_description = ? WHERE id = ?',
        [program.name, program.description, program.id]);
  }

  Future<void> updateWorkout(Workout workout) async {
    final db = await instance.streamDatabase;
    await db.update(
      workoutsTable,
      {
        'sets': workout.sets,
        'repeats': workout.repeats,
        'repeatsLeft': workout.repeatsLeft,
        'rest': workout.rest,
        'weight': workout.weight,
        'weightLeft': workout.weightLeft,
        'distance': workout.distance,
        'timeLoad': workout.timeLoad,
      },
      where: 'id = ?',
      whereArgs: [workout.id],
    );
    return Future.value();
  }

  /// Watch all equipment.
  /// Return equipment as a stream.
  Stream<List<Equipment>> watchAllEquipment() async* {
    final db = await instance.streamDatabase;
    yield* db.createQuery(
      equipmentTable,
      columns: [
        'id',
        '${kLocale}_name AS name',
        'preinstalled',
      ],
    ).mapToList((row) => Equipment.fromJson(row));
  }

  /// Watch all load.
  Stream<List<Load>> watchAllLoad() async* {
    final db = await instance.streamDatabase;
    yield* db.createQuery(
      loadTable,
      columns: [
        'id',
        '${kLocale}_name AS name',
        'preinstalled',
      ],
    ).mapToList((row) => Load.fromJson(row));
  }

  /// All log days.
  Future<List<LogDay>> watchAllLogDays() async {
    final db = await instance.streamDatabase;
    final String sql = '''
    select 
      $logDaysTable.id AS logDayId, 
      $logDaysTable.dayId AS dayId, 
      start, 
      finish,
      $daysTable.${kLocale}_name AS daysName,
      $programsTable.${kLocale}_name as programsName
    from $logDaysTable
    join $daysTable on $logDaysTable.dayId = $daysTable.id 
    join $programsTable on $daysTable.programs_id = $programsTable.id
    ORDER BY logDayId
    ''';
    final List<Map<String, dynamic>> list = await db.rawQuery(sql);
    List<LogDay> result = [];
    for (Map<String, dynamic> item in list) {
      result.add(LogDay.fromJson(item));
    }
    return result;
  }

  /// Get all muscles.
  Stream<List<Muscle>> watchAllMuscles() async* {
    final db = await instance.streamDatabase;
    yield* db.createQuery(
      muscleTable,
      columns: [
        'id',
        '${kLocale}_name as name',
        'icon',
      ],
    ).mapToList((row) => Muscle.fromJson(row));
  }

  /// Get all programs.
  Stream<List<Program>> watchAllPrograms() async* {
    final db = await instance.streamDatabase;
    yield* db.createQuery(
      programsTable,
      columns: [
        'id',
        '${kLocale}_name as name',
        '${kLocale}_description as description',
      ],
    ).mapToList((row) => Program.fromJson(row));
  }

  /// Deletes the day, if it was no used in Log table.
  /// Returns true on sucsess.
  Future<bool> deleteDay(int id) async {
    final db = await instance.streamDatabase;
    final isInLog = await db.query(logDaysTable, where: 'dayId = $id');
    if (isInLog.isNotEmpty) return false;
    db.delete(daysTable, where: 'id = $id');
    return true;
  }

  /// Delete program, only if it was not used (in log table)
  /// Return true on sucsess.
  Future<bool> deleteProgram(int id) async {
    final db = await instance.streamDatabase;

    // If no days in program
    final programDays =
        await db.query(daysTable, columns: ['id'], where: 'programs_id = $id');
    if (programDays.isEmpty) {
      await db.delete(programsTable, where: 'id = $id');
      // final programs = await db.query(programsTable, columns: ['id']);
      // setCurrentProgramId(programs.first['id'] as int);
      return true;
    }

    // If no program days in log_days
    final isInLog = await db.rawQuery('''
      SELECT * FROM $logDaysTable WHERE dayId IN (SELECT id FROM $daysTable WHERE programs_id = $id)
      ''');
    if (isInLog.isEmpty) {
      await db.transaction((txn) async {
        txn.rawDelete('DELETE FROM $daysTable WHERE programs_id = $id');
        txn.delete(programsTable, where: 'id = $id');
      });
      // final programs = await db.query(programsTable, columns: ['id']);
      // setCurrentProgramId(programs.first['id'] as int);
      return true;
    }
    return false;
  }
}
