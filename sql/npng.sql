--
-- File generated with SQLiteStudio v3.2.1 on Wed Jul 28 16:40:38 2021
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: days
CREATE TABLE days (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, ord INTEGER, en_name STRING, ru_name STRING, en_description STRING, ru_description STRING, routines_id INT REFERENCES routines (id));
INSERT INTO days (id, ord, en_name, ru_name, en_description, ru_description, routines_id) VALUES (1, 0, 'Chiest Train', 'Грудь', 'Monday', 'Понедельник', 1);
INSERT INTO days (id, ord, en_name, ru_name, en_description, ru_description, routines_id) VALUES (3, 1, 'Biceps Train', 'Бицепс', 'Tuesday', 'Вторник', 1);
INSERT INTO days (id, ord, en_name, ru_name, en_description, ru_description, routines_id) VALUES (4, 2, 'Back Train', 'Спина', 'Wensday', 'Среда', 1);

-- Table: equipment
CREATE TABLE equipment (id INTEGER PRIMARY KEY UNIQUE, en_name STRING, ru_name STRING);
INSERT INTO equipment (id, en_name, ru_name) VALUES (1, 'Bodyweight', 'Собственный вес');
INSERT INTO equipment (id, en_name, ru_name) VALUES (2, 'Rubber band', 'Резиновый жгут');
INSERT INTO equipment (id, en_name, ru_name) VALUES (3, 'Barbell', 'Штанга');
INSERT INTO equipment (id, en_name, ru_name) VALUES (4, 'Dumbbels', 'Гантели');
INSERT INTO equipment (id, en_name, ru_name) VALUES (5, 'Kettlebells', 'Гири');
INSERT INTO equipment (id, en_name, ru_name) VALUES (6, 'Training apparatus', 'Тренажёр');

-- Table: exercises
CREATE TABLE exercises (id INTEGER PRIMARY KEY NOT NULL UNIQUE, en_name STRING, ru_name STRING, en_description STRING, ru_description STRING, equipment_id INTEGER REFERENCES equipment (id));
INSERT INTO exercises (id, en_name, ru_name, en_description, ru_description, equipment_id) VALUES (1, 'Push Up', 'Отжимания', NULL, NULL, 1);
INSERT INTO exercises (id, en_name, ru_name, en_description, ru_description, equipment_id) VALUES (2, 'Shrugs', 'Шраги', 'DB', NULL, 1);
INSERT INTO exercises (id, en_name, ru_name, en_description, ru_description, equipment_id) VALUES (3, 'Push up with Rubber band', 'Отжимания с резиновой лентой', 'Take rubber band in hands.', NULL, 1);

-- Table: load
CREATE TABLE load (exercises_id INTEGER REFERENCES exercises (id), muscles_id INTEGER REFERENCES musсles (id));
INSERT INTO load (exercises_id, muscles_id) VALUES (1, 3);
INSERT INTO load (exercises_id, muscles_id) VALUES (2, 1);
INSERT INTO load (exercises_id, muscles_id) VALUES (3, 3);

-- Table: log_days
CREATE TABLE log_days (id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE NOT NULL, start STRING NOT NULL, finish STRING, days_id INTEGER REFERENCES days (id));
INSERT INTO log_days (id, start, finish, days_id) VALUES (1, '2021-07-27 15:54:53.116898', '2021-07-27 15:55:04.455392', 1);
INSERT INTO log_days (id, start, finish, days_id) VALUES (2, '2021-07-27 15:59:18.963580', '2021-07-27 15:59:29.824631', 3);
INSERT INTO log_days (id, start, finish, days_id) VALUES (3, '2021-07-27 16:00:34.968918', '2021-07-27 16:00:40.504243', 3);
INSERT INTO log_days (id, start, finish, days_id) VALUES (4, '2021-07-28 12:34:50.691637', '2021-07-28 12:35:01.142602', 1);
INSERT INTO log_days (id, start, finish, days_id) VALUES (5, '2021-07-28 12:34:50.691637', '2021-07-28 12:35:01.142602', 1);
INSERT INTO log_days (id, start, finish, days_id) VALUES (6, '2021-07-28 12:34:50.691637', '2021-07-28 12:35:01.142602', 1);
INSERT INTO log_days (id, start, finish, days_id) VALUES (7, '2021-07-28 12:34:50.691637', '2021-07-28 12:35:01.142602', 1);
INSERT INTO log_days (id, start, finish, days_id) VALUES (8, '2021-07-28 12:49:15.739246', '2021-07-28 12:49:26.102693', 1);
INSERT INTO log_days (id, start, finish, days_id) VALUES (9, '2021-07-28 12:54:44.406298', '2021-07-28 12:54:55.150618', 1);
INSERT INTO log_days (id, start, finish, days_id) VALUES (10, '2021-07-28 16:39:52.043972', '2021-07-28 16:40:08.244348', 1);

-- Table: log_ex
CREATE TABLE log_ex (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, log_days_id INT, exercises_id integer, repeat integer, weight REAL, FOREIGN KEY (log_days_id) REFERENCES log_days (id), FOREIGN KEY (exercises_id) REFERENCES exercises (id));
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (1, 1, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (2, 1, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (3, 1, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (4, 1, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (5, 1, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (6, 1, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (7, 1, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (8, 1, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (9, 1, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (10, 1, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (11, 1, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (12, 2, 10, 11, 22.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (13, 3, 10, 9, 10.25);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (14, 0, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (15, 0, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (16, 0, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (17, 0, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (18, 0, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (19, 0, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (20, 0, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (21, 0, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (22, 0, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (23, 0, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (24, 0, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (25, 6, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (26, 6, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (27, 6, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (28, 6, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (29, 6, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (30, 6, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (31, 6, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (32, 6, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (33, 6, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (34, 6, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (35, 6, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (36, 7, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (37, 7, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (38, 7, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (39, 7, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (40, 7, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (41, 7, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (42, 7, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (43, 7, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (44, 7, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (45, 7, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (46, 7, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (47, 8, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (48, 8, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (49, 8, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (50, 8, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (51, 8, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (52, 8, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (53, 8, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (54, 8, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (55, 8, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (56, 8, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (57, 8, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (58, 9, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (59, 9, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (60, 9, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (61, 9, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (62, 9, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (63, 9, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (64, 9, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (65, 9, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (66, 9, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (67, 9, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (68, 9, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (69, 10, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (70, 10, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (71, 10, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (72, 10, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (73, 10, 3, 6, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (74, 10, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (75, 10, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (76, 10, 4, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (77, 10, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (78, 10, 5, 8, 10.0);
INSERT INTO log_ex (id, log_days_id, exercises_id, repeat, weight) VALUES (79, 10, 5, 8, 10.0);

-- Table: musсles
CREATE TABLE musсles (id INTEGER PRIMARY KEY NOT NULL UNIQUE, en_name STRING, ru_name STRING);
INSERT INTO musсles (id, en_name, ru_name) VALUES (1, 'Traps', 'Трапеция');
INSERT INTO musсles (id, en_name, ru_name) VALUES (2, 'Shoulders', 'Плечи');
INSERT INTO musсles (id, en_name, ru_name) VALUES (3, 'Chest', 'Грудь');
INSERT INTO musсles (id, en_name, ru_name) VALUES (4, 'Mid-back (Traps)', 'Середина спины');
INSERT INTO musсles (id, en_name, ru_name) VALUES (5, 'Biceps', 'Бицепсы');
INSERT INTO musсles (id, en_name, ru_name) VALUES (6, 'Triceps', 'Трицепсы');
INSERT INTO musсles (id, en_name, ru_name) VALUES (7, 'Forearms', 'Предплечья');
INSERT INTO musсles (id, en_name, ru_name) VALUES (8, 'Abdominals', 'Брюшной пресс');
INSERT INTO musсles (id, en_name, ru_name) VALUES (9, 'Lats', 'Широчайшие мышцы спины');
INSERT INTO musсles (id, en_name, ru_name) VALUES (10, 'Lowerback', 'Нижняя часть спины');
INSERT INTO musсles (id, en_name, ru_name) VALUES (11, 'Glutes', 'Ягодицы');
INSERT INTO musсles (id, en_name, ru_name) VALUES (12, 'Quards', 'Квадрицепсы');
INSERT INTO musсles (id, en_name, ru_name) VALUES (13, 'Hamstrings', 'Бицепс бедра');
INSERT INTO musсles (id, en_name, ru_name) VALUES (14, 'Calves', 'Икры');

-- Table: routines
CREATE TABLE routines (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, en_name STRING, ru_name STRING, en_description STRING, ru_descriprion STRING);
INSERT INTO routines (id, en_name, ru_name, en_description, ru_descriprion) VALUES (1, 'Rubber Band', 'Резиновая лента', '7 days a week', '7 дней в неделю');
INSERT INTO routines (id, en_name, ru_name, en_description, ru_descriprion) VALUES (2, 'Bodyweight', 'Собственный вес', '2 days a week', '2 дня в неделю');
INSERT INTO routines (id, en_name, ru_name, en_description, ru_descriprion) VALUES (3, '5x5', '5 на 5', 'Base powerlifting program.', 'Базовая программа пауэрлифтинга.');

-- Table: user
CREATE TABLE user (id integer NOT NULL PRIMARY KEY, birthday date, sex integer, routines_id INTEGER);
INSERT INTO user (id, birthday, sex, routines_id) VALUES (1, NULL, NULL, 1);

-- Table: workouts
CREATE TABLE workouts (id INTEGER PRIMARY KEY UNIQUE, ord INTEGER DEFAULT (0) NOT NULL, days_id INTEGER REFERENCES days (id), exerscises_id INTEGER REFERENCES exercises (id), sets INTEGER DEFAULT (3) NOT NULL, repeats INTEGER DEFAULT (8) NOT NULL, rest INTEGER DEFAULT (90) NOT NULL, weight DOUBLE NOT NULL DEFAULT (10));
INSERT INTO workouts (id, ord, days_id, exerscises_id, sets, repeats, rest, weight) VALUES (3, 0, 1, 3, 5, 6, 70, 10.0);
INSERT INTO workouts (id, ord, days_id, exerscises_id, sets, repeats, rest, weight) VALUES (4, 1, 1, 1, 3, 8, 90, 10.0);
INSERT INTO workouts (id, ord, days_id, exerscises_id, sets, repeats, rest, weight) VALUES (5, 3, 1, 2, 3, 8, 90, 10.0);
INSERT INTO workouts (id, ord, days_id, exerscises_id, sets, repeats, rest, weight) VALUES (10, 7, 3, 2, 1, 8, 90, 10.0);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
