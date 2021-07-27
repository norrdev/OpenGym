--
-- File generated with SQLiteStudio v3.2.1 on Tue Jul 27 15:50:46 2021
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: days
CREATE TABLE days (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, ord INTEGER, name STRING, description STRING, routines_id INT REFERENCES routines (id));
INSERT INTO days (id, ord, name, description, routines_id) VALUES (1, 0, 'Chiest Train', 'Monday', 1);
INSERT INTO days (id, ord, name, description, routines_id) VALUES (3, 1, 'Biceps Train', 'Tuesday', 1);
INSERT INTO days (id, ord, name, description, routines_id) VALUES (4, 2, 'Back Train', '', 1);
INSERT INTO days (id, ord, name, description, routines_id) VALUES (5, NULL, 'Monday', '', 3);

-- Table: equipment
CREATE TABLE equipment (id INTEGER PRIMARY KEY UNIQUE, name STRING);
INSERT INTO equipment (id, name) VALUES (1, 'Bodyweight');
INSERT INTO equipment (id, name) VALUES (2, 'Rubber band');
INSERT INTO equipment (id, name) VALUES (3, 'Barbell');
INSERT INTO equipment (id, name) VALUES (4, 'Dumbbels');
INSERT INTO equipment (id, name) VALUES (5, 'Kettlebells');

-- Table: exercises
CREATE TABLE exercises (id INTEGER PRIMARY KEY NOT NULL UNIQUE, name STRING, description STRING, equipment_id INTEGER REFERENCES equipment (id));
INSERT INTO exercises (id, name, description, equipment_id) VALUES (1, 'Push Up', NULL, 1);
INSERT INTO exercises (id, name, description, equipment_id) VALUES (2, 'Shrugs', 'DB', 1);
INSERT INTO exercises (id, name, description, equipment_id) VALUES (3, 'Push up with Rubber band', 'Take rubber band in hands.', 1);

-- Table: load
CREATE TABLE load (exercises_id INTEGER REFERENCES exercises (id), muscles_id INTEGER REFERENCES musсles (id));
INSERT INTO load (exercises_id, muscles_id) VALUES (1, 3);
INSERT INTO load (exercises_id, muscles_id) VALUES (2, 1);
INSERT INTO load (exercises_id, muscles_id) VALUES (3, 3);

-- Table: log_days
CREATE TABLE log_days (id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, start STRING NOT NULL, finish STRING, days_id INTEGER REFERENCES days (id));

-- Table: log_ex
CREATE TABLE log_ex (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, log_days_id INT, exercises_id integer, repeat integer, weight integer, FOREIGN KEY (log_days_id) REFERENCES log_days (id), FOREIGN KEY (exercises_id) REFERENCES exercises (id));

-- Table: musсles
CREATE TABLE musсles (id INTEGER PRIMARY KEY NOT NULL UNIQUE, name STRING);
INSERT INTO musсles (id, name) VALUES (1, 'Traps');
INSERT INTO musсles (id, name) VALUES (2, 'Shoulders');
INSERT INTO musсles (id, name) VALUES (3, 'Chest');
INSERT INTO musсles (id, name) VALUES (4, 'Mid-back (Traps)');
INSERT INTO musсles (id, name) VALUES (5, 'Biceps');
INSERT INTO musсles (id, name) VALUES (6, 'Triceps');
INSERT INTO musсles (id, name) VALUES (7, 'Forearms');
INSERT INTO musсles (id, name) VALUES (8, 'Abdominals');
INSERT INTO musсles (id, name) VALUES (9, 'Lats');
INSERT INTO musсles (id, name) VALUES (10, 'Lowerback');
INSERT INTO musсles (id, name) VALUES (11, 'Glutes');
INSERT INTO musсles (id, name) VALUES (12, 'Quards');
INSERT INTO musсles (id, name) VALUES (13, 'Hamstrings');
INSERT INTO musсles (id, name) VALUES (14, 'Calves');

-- Table: routines
CREATE TABLE routines (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, name STRING, description STRING);
INSERT INTO routines (id, name, description) VALUES (1, 'Rubber Band', '7 days a week');
INSERT INTO routines (id, name, description) VALUES (2, 'Bodyweight', '2 days a week');
INSERT INTO routines (id, name, description) VALUES (3, '5x5', 'Base powerlifting program.');

-- Table: user
CREATE TABLE user (id integer NOT NULL PRIMARY KEY, birthday date, sex integer, routines_id INTEGER);
INSERT INTO user (id, birthday, sex, routines_id) VALUES (1, NULL, NULL, 1);

-- Table: workouts
CREATE TABLE workouts (id INTEGER PRIMARY KEY UNIQUE, ord INTEGER DEFAULT (0) NOT NULL, days_id INTEGER REFERENCES days (id), exerscises_id INTEGER REFERENCES exercises (id), sets INTEGER DEFAULT (3) NOT NULL, repeats INTEGER DEFAULT (8) NOT NULL, rest INTEGER DEFAULT (90) NOT NULL, weight DOUBLE NOT NULL DEFAULT (10));
INSERT INTO workouts (id, ord, days_id, exerscises_id, sets, repeats, rest, weight) VALUES (3, 0, 1, 3, 5, 6, 70, 10.0);
INSERT INTO workouts (id, ord, days_id, exerscises_id, sets, repeats, rest, weight) VALUES (4, 1, 1, 1, 3, 8, 90, 10.0);
INSERT INTO workouts (id, ord, days_id, exerscises_id, sets, repeats, rest, weight) VALUES (5, 3, 1, 2, 3, 8, 90, 10.0);
INSERT INTO workouts (id, ord, days_id, exerscises_id, sets, repeats, rest, weight) VALUES (9, 6, 5, 1, 3, 8, 90, 10.0);
INSERT INTO workouts (id, ord, days_id, exerscises_id, sets, repeats, rest, weight) VALUES (10, 7, 3, 2, 1, 8, 90, 10.0);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
