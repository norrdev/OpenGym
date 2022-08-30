part of 'sqlite_helper.dart';

/// Migration script v2 (PRAGMA user_version = 2).
/// Version 1 comes from assets.
void _upgradeV1toV2(Batch batch) {
  batch.execute('PRAGMA foreign_keys = 0');
  batch.execute(''' 
    CREATE TABLE muscles (
      id      INTEGER NOT NULL,
      en_name STRING,
      ru_name STRING,
      icon    BLOB
    )''');
  batch.execute('''
    INSERT INTO muscles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    SELECT id,
                           en_name,
                           ru_name,
                           icon
                      FROM musсles''');
  batch.execute('DROP TABLE musсles');

  batch.execute('CREATE TABLE sqlitestudio_temp_table AS SELECT * FROM days');
  batch.execute('UPDATE sqlitestudio_temp_table SET ord = 0 WHERE ord IS NULL');
  batch.execute('DROP TABLE days');
  batch.execute('''
  CREATE TABLE days (
      id             INTEGER PRIMARY KEY AUTOINCREMENT
                            NOT NULL
                            UNIQUE,
      ord            INTEGER NOT NULL
                            DEFAULT (0),
      en_name        STRING,
      ru_name        STRING,
      en_description STRING,
      ru_description STRING,
      programs_id    INT
  )''');
  batch.execute(''' 
  INSERT INTO days (
                     id,
                     ord,
                     en_name,
                     ru_name,
                     en_description,
                     ru_description,
                     programs_id
                 )
                 SELECT id,
                        ord,
                        en_name,
                        ru_name,
                        en_description,
                        ru_description,
                        programs_id
                   FROM sqlitestudio_temp_table''');
  batch.execute('DROP TABLE sqlitestudio_temp_table');

  batch.execute('CREATE TABLE sqlitestudio_temp_table AS SELECT * FROM user');
  batch.execute('DROP TABLE user');
  batch.execute('''
  CREATE TABLE user (
      id          INTEGER NOT NULL
                          PRIMARY KEY,
      birthday    DATE,
      sex         INTEGER,
      programs_id INTEGER NOT NULL
                          DEFAULT (1) 
  )''');
  batch.execute('''
  INSERT INTO user (
                      id,
                      birthday,
                      sex,
                      programs_id
                  )
                  SELECT id,
                          birthday,
                          sex,
                          programs_id
                    FROM sqlitestudio_temp_table''');
  batch.execute('DROP TABLE sqlitestudio_temp_table');
  batch.execute('PRAGMA foreign_keys = 1');
}

/// Migration script v3 (PRAGMA user_version = 3).
void _updateV2toV3(Batch batch) {
  batch.execute('PRAGMA foreign_keys = 0');
  batch.execute('ALTER TABLE load RENAME TO exercises_muscles');
  batch.execute(
      'ALTER TABLE exercises_muscles RENAME COLUMN muscles_id TO muscleId');
  batch.execute(
      'ALTER TABLE exercises_muscles RENAME COLUMN exercises_id TO exerciseId');

  // Exercises
  batch.execute(
      'ALTER TABLE exercises RENAME COLUMN equipment_id TO equipmentId');
  batch.execute('ALTER TABLE exercises ADD preinstalled INTEGER');
  batch.execute('ALTER TABLE exercises ADD loadId INTEGER');
  batch.execute('ALTER TABLE exercises ADD limbs INTEGER');

  // Preload flag.
  batch.execute('UPDATE exercises SET preinstalled = id WHERE id <= 60');

  // Typo fixes.
  batch.execute(
      'UPDATE exercises SET en_name = "Barbell Shrug" WHERE preinstalled = 3');
  batch.execute(
      'UPDATE exercises SET en_name = "Pull-Ups" WHERE preinstalled = 19');
  batch.execute(
      'UPDATE exercises SET en_name = "Squats" WHERE preinstalled = 51');
  batch.execute(
      'UPDATE exercises SET en_name = "Rubber Band Squats" WHERE preinstalled = 50');
  batch.execute(
      'UPDATE exercises SET en_name = "Barbell Squats" WHERE preinstalled = 49');
  batch.execute(
      'UPDATE exercises SET en_name = "Hyperextension" WHERE preinstalled = 48');
  batch.execute(
      'UPDATE exercises SET en_name = "Diamond Push-Ups" WHERE preinstalled = 33');
  batch.execute(
      'UPDATE exercises SET en_name = "Hummer Curl With Rubber Band" WHERE preinstalled = 24');
  batch.execute(
      'UPDATE exercises SET en_name = "Triceps Extensions With Dumbbell" WHERE preinstalled = 28');

  // Update limbs.
  batch.execute('''
    UPDATE exercises SET limbs = 1 WHERE preinstalled in 
    ( 1, 2, 3, 5, 6, 7, 9, 10, 11, 13, 14, 15, 16, 18, 19, 20, 23, 25, 26, 27, 28, 
    29, 32, 33, 34, 35, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 
    54, 55, 57, 58, 60)''');
  batch.execute('''
    UPDATE exercises SET limbs = 2 WHERE preinstalled in 
    ( 4, 8, 12, 17, 21, 22, 24, 30, 31, 36, 37, 53, 56, 59)''');

  // Update load_id.
  // Weight = 1, Time = 2, Distance = 3
  batch.execute(
      'UPDATE exercises SET loadId = 1 WHERE preinstalled BETWEEN 1 AND 60');
  batch.execute(
      'UPDATE exercises SET loadId = 2 WHERE preinstalled in ( 42, 43, 44)');
  batch.execute(
      'UPDATE exercises SET loadId = 4 WHERE preinstalled in ( 1,2,6,10,14,15,19,25,32,33,40,41,48,51,58)');

  // Equipment_id update.
  batch.execute('''
    UPDATE exercises SET equipmentId = 1 WHERE preinstalled in ( 1, 2, 6, 10, 14, 15, 19, 25, 
    32, 33, 40, 41, 42, 43, 48, 51, 58 )''');
  batch.execute('''
    UPDATE exercises SET equipmentId = 2 WHERE preinstalled in ( 5, 9, 13, 18, 23, 24, 29, 
    31, 38, 39, 44, 46, 50, 57, 60)''');
  batch.execute('''
    UPDATE exercises SET equipmentId = 3 WHERE preinstalled in ( 3, 7, 11, 16, 20, 26, 27, 
    34, 35, 45, 47, 49, 52, 55 )''');
  batch.execute('''
    UPDATE exercises SET equipmentId = 4 WHERE preinstalled in ( 4, 8, 12, 17, 21, 22, 28, 
    30, 36, 37, 53, 56, 59 )''');
  batch.execute('UPDATE exercises SET equipmentId = 6 WHERE preinstalled = 54');

  // Equipment spellcheck.
  batch.execute('UPDATE equipment SET en_name = "Body weight" WHERE id = 1');
  batch.execute('UPDATE equipment SET en_name = "Dumbbells" WHERE id = 4');
  batch.execute('UPDATE equipment SET en_name = "Gym equipment" WHERE id = 6');
  batch.execute('ALTER TABLE equipment ADD preinstalled BOOLEAN');
  batch.execute('UPDATE equipment SET preinstalled = id WHERE id <= 6');

  // New load table.
  batch.execute('''
    CREATE TABLE load (
        id           INTEGER PRIMARY KEY AUTOINCREMENT
                            NOT NULL
                            UNIQUE,
        en_name      STRING,
        ru_name      STRING,
        preinstalled BOOLEAN
    )
    ''');
  batch.execute(
      'INSERT INTO load (en_name, ru_name, preinstalled) VALUES ("Weight", "Вес", 1)');
  batch.execute(
      'INSERT INTO load (en_name, ru_name, preinstalled) VALUES ("Time", "Время", 2)');
  batch.execute(
      'INSERT INTO load (en_name, ru_name, preinstalled) VALUES ("Distance", "Расстояние", 3)');
  batch.execute(
      'INSERT INTO load (en_name, ru_name, preinstalled) VALUES ("Repeats", "Повторы", 4)');

  // Log_days & Log_ex
  batch.execute('ALTER TABLE log_days RENAME COLUMN days_id TO dayId');
  batch.execute('ALTER TABLE log_ex RENAME COLUMN log_days_id TO logDayId');
  batch.execute('ALTER TABLE log_ex RENAME COLUMN exercises_id TO exerciseId');
  batch.execute('ALTER TABLE log_ex RENAME COLUMN repeat TO repeats');
  batch.execute('ALTER TABLE log_ex ADD repeatsLeft INTEGER');
  batch.execute('ALTER TABLE log_ex ADD weightLeft DOUBLE');
  batch.execute('ALTER TABLE log_ex ADD distance DOUBLE');
  batch.execute('ALTER TABLE log_ex ADD timeLoad INTEGER');
  batch.execute('ALTER TABLE log_ex RENAME TO log_sets');

  // Alter table workouts
  batch.execute('ALTER TABLE workouts RENAME COLUMN days_id TO dayId');
  batch
      .execute('ALTER TABLE workouts RENAME COLUMN exercises_id TO exerciseId');

  // Workout
  batch.execute('ALTER TABLE workouts ADD weightLeft DOUBLE');
  batch.execute('ALTER TABLE workouts ADD repeatsLeft INTEGER');
  batch.execute('ALTER TABLE workouts ADD distance DOUBLE');
  batch.execute('ALTER TABLE workouts ADD timeLoad INTEGER');

  // Remove default and not-nullable values.
  batch.execute(
      'CREATE TABLE sqlitestudio_temp_table AS SELECT * FROM workouts');
  batch.execute('DROP TABLE workouts');
  batch.execute('''
    CREATE TABLE workouts (
      id          INTEGER PRIMARY KEY
                          UNIQUE,
      ord         INTEGER DEFAULT (0) 
                          NOT NULL,
      dayId       INTEGER REFERENCES days (id),
      exerciseId  INTEGER REFERENCES exercises (id),
      sets        INTEGER NOT NULL
                          DEFAULT (1),
      repeats     INTEGER DEFAULT (8),
      rest        INTEGER DEFAULT (90),
      weight      DOUBLE  DEFAULT (10),
      weightLeft  DOUBLE  DEFAULT (8),
      repeatsLeft INTEGER DEFAULT (8),
      distance    DOUBLE  DEFAULT (100),
      timeLoad    INTEGER DEFAULT (60) 
    )''');
  batch.execute('''
    INSERT INTO workouts (
                            id,
                            ord,
                            dayId,
                            exerciseId,
                            sets,
                            repeats,
                            rest,
                            weight,
                            weightLeft,
                            repeatsLeft,
                            distance,
                            timeLoad
                        )
                        SELECT id,
                                ord,
                                dayId,
                                exerciseId,
                                sets,
                                repeats,
                                rest,
                                weight,
                                weight,
                                repeats,
                                100,
                                60
                          FROM sqlitestudio_temp_table''');
  batch.execute('DROP TABLE sqlitestudio_temp_table');

  batch.execute('PRAGMA foreign_keys = 1');
}
