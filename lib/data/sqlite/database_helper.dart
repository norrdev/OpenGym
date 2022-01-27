import 'dart:io';
import 'package:flutter/services.dart';
import 'package:npng/config.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:npng/data/models/models.dart';

class DatabaseHelper {
  static const _databaseName = 'npng.db';
  static const _databaseVersion = 1;

// FIXME Change letter in migration!!!
  static const muscleTable = 'musсles';
  static const exerciseTable = 'exercises';
  static const programsTable = 'programs';
  static const loadTable = 'load';
  static const userTable = 'user';
  static const daysTable = 'days';

  static late BriteDatabase _streamDatabase;

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static var lock = Lock();

  // only have a single app-wide reference to the database
  static Database? _database;

  // this opens the database (and creates it if it doesn't exist)
  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, _databaseName);
    // Check if the database exists
    final bool exists = await databaseExists(path);
    if (!exists) {
      // Should happen only the first time you launch your application
      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}
      // Copy from asset
      ByteData data = await rootBundle.load(join('assets/db', 'npng.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    }

    // FIXME: Set to OFF in production.
    Sqflite.setDebugModeOn(true);
    return openDatabase(
      path,
      version: _databaseVersion, /*onCreate: _onCreate*/
    );
  }

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

  Stream<List<Exercise>> findExcersisesByMuscle(int id) async* {
    final db = await instance.streamDatabase;
    String sql =
        '''SELECT exercises.id AS id, exercises.${kLocale}_name AS name, 
           ${kLocale}_description AS description, equipment_id
           FROM $loadTable  
           JOIN $exerciseTable ON exercises_id = exercises.id 
           WHERE muscles_id = $id''';

    yield* db.createRawQuery(
        [loadTable], sql).mapToList((row) => Exercise.fromJson(row));
  }

  Future<Exercise> findExerciseById(id) async {
    final db = await instance.streamDatabase;
    final exeList = await db.query(
      exerciseTable,
      columns: [
        'id',
        '${kLocale}_name as name',
        '${kLocale}_description as description',
      ],
      where: 'id = $id',
      limit: 1,
    );
    final Exercise exe = Exercise.fromJson(exeList.first);
    return exe;
  }

  Future<int> updateExercise(Exercise exe) async {
    final db = await instance.streamDatabase;
    return db.rawUpdate(
        'UPDATE $exerciseTable SET ${kLocale}_name = ?, ${kLocale}_description = ? WHERE id = ${exe.id}',
        [exe.name, exe.description, exe.id]);
  }

  Future<void> insertExercise(int muscleId, Exercise exercise) async {
    final db = await instance.streamDatabase;
    await db.transaction((txn) async {
      int id = await txn.insert(exerciseTable, {
        '${kLocale}_name': exercise.name,
        '${kLocale}_description': exercise.description,
      });
      await txn.insert(loadTable, {
        'exercises_id': id,
        'muscles_id': muscleId,
      });
    });
    return Future.value();
  }

  Future<void> deleteExercise(Exercise exercise) async {
    final db = await instance.streamDatabase;
    await db.transaction((txn) async {
      await txn
          .delete(exerciseTable, where: 'id = ?', whereArgs: [exercise.id]);
      await txn.delete(loadTable,
          where: 'exercises_id = ?', whereArgs: [exercise.id]);
    });
    return Future.value();
  }

  Future<int> getCurrentProgram() async {
    final db = await instance.streamDatabase;
    final userList = await db.query(userTable, where: 'id = 1');
    return userList.first['programs_id'] as int;
  }

  Future<void> setCurrentProgram(int id) async {
    final db = await instance.streamDatabase;
    await db.update(userTable, {'programs_id': id}, where: 'id = 1');
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

  Future<int> updateProgram(Program program) async {
    final db = await instance.streamDatabase;
    return db.rawUpdate(
        'UPDATE $programsTable SET ${kLocale}_name = ?, ${kLocale}_description = ? WHERE id = ${program.id}',
        [program.name, program.description, program.id]);
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

  void close() {
    _streamDatabase.close();
  }
}
