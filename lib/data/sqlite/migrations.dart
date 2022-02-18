part of 'database_helper.dart';

///Migration script v2
void _upgradeTableMuscleV1toV2(Batch batch) {
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
  batch.execute('PRAGMA foreign_keys = 1');
}

void _upgradeTableDaysV1toV2(Batch batch) {
  batch.execute('PRAGMA foreign_keys = 0');
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
  batch.execute('PRAGMA foreign_keys = 1');
}

void _upgradeTableUserV1toV2(Batch batch) {
  batch.execute('PRAGMA foreign_keys = 0');
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
