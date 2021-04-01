--
-- File generated with SQLiteStudio v3.2.1 on Thu Apr 1 11:36:59 2021
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: days
CREATE TABLE days (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, ord INTEGER, name STRING, description STRING, routines_id INT REFERENCES routines (id));
INSERT INTO days (id, ord, name, description, routines_id) VALUES (1, NULL, 'Chiest', 'Monday', 1);

-- Table: equipment
CREATE TABLE equipment (id INTEGER PRIMARY KEY, name STRING);
INSERT INTO equipment (id, name) VALUES (1, 'Bodyweight');
INSERT INTO equipment (id, name) VALUES (2, 'Rubber band');
INSERT INTO equipment (id, name) VALUES (3, 'Barbell');
INSERT INTO equipment (id, name) VALUES (4, 'Dumbbels');
INSERT INTO equipment (id, name) VALUES (5, 'Kettlebells');

-- Table: exercises
CREATE TABLE exercises (id INTEGER PRIMARY KEY NOT NULL, name STRING, description STRING, equipment_id INTEGER REFERENCES equipment (id));
INSERT INTO exercises (id, name, description, equipment_id) VALUES (1, 'Push Up', NULL, 1);
INSERT INTO exercises (id, name, description, equipment_id) VALUES (2, 'Shrugs', 'DB', 1);
INSERT INTO exercises (id, name, description, equipment_id) VALUES (3, 'Push up with Rubber band', 'Take rubber band in hands.', 1);

-- Table: load
CREATE TABLE load (exercises_id INTEGER REFERENCES exercises (id), muscles_id INTEGER REFERENCES musсles (id));
INSERT INTO load (exercises_id, muscles_id) VALUES (1, 3);
INSERT INTO load (exercises_id, muscles_id) VALUES (2, 1);
INSERT INTO load (exercises_id, muscles_id) VALUES (3, 3);

-- Table: musсles
CREATE TABLE musсles (id INTEGER PRIMARY KEY NOT NULL, name STRING);
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
CREATE TABLE routines (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name STRING, description STRING);
INSERT INTO routines (id, name, description) VALUES (1, 'Rubber Band', '3 days a week');
INSERT INTO routines (id, name, description) VALUES (2, 'Bodyweight', '2 days a week');
INSERT INTO routines (id, name, description) VALUES (3, '5x5', 'Powerlifting program.');

-- Table: workouts
CREATE TABLE workouts (id INTEGER PRIMARY KEY, ord INTEGER, days_id INTEGER REFERENCES days (id), exerscises_id INTEGER REFERENCES exercises (id));

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
