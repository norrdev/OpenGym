PRAGMA foreign_keys = 0;

CREATE TABLE muscles (
    id      INTEGER NOT NULL,
    en_name STRING,
    ru_name STRING,
    icon    BLOB
);

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
                      FROM musсles;

DROP TABLE musсles;

PRAGMA foreign_keys = 1;

/*    DAYS      */

PRAGMA foreign_keys = 0;

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM days;

DROP TABLE days;

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
);

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
                   FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

PRAGMA foreign_keys = 1;

/* USER */

PRAGMA foreign_keys = 0;

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM user;

DROP TABLE user;

CREATE TABLE user (
    id          INTEGER NOT NULL
                        PRIMARY KEY,
    birthday    DATE,
    sex         INTEGER,
    programs_id INTEGER NOT NULL
                        DEFAULT (1) 
);

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
                   FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

PRAGMA foreign_keys = 1;

