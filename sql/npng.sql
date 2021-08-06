--
-- File generated with SQLiteStudio v3.3.3 on Fri Aug 6 16:00:41 2021
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: days
CREATE TABLE days (
    id             INTEGER PRIMARY KEY AUTOINCREMENT
                           NOT NULL
                           UNIQUE,
    ord            INTEGER,
    en_name        STRING,
    ru_name        STRING,
    en_description STRING,
    ru_description STRING,
    programs_id    INT
);


-- Table: equipment
CREATE TABLE equipment (
    id      INTEGER PRIMARY KEY
                    UNIQUE,
    en_name STRING,
    ru_name STRING
);

INSERT INTO equipment (
                          id,
                          en_name,
                          ru_name
                      )
                      VALUES (
                          1,
                          'Bodyweight',
                          'Собственный вес'
                      );

INSERT INTO equipment (
                          id,
                          en_name,
                          ru_name
                      )
                      VALUES (
                          2,
                          'Rubber band',
                          'Резиновый жгут'
                      );

INSERT INTO equipment (
                          id,
                          en_name,
                          ru_name
                      )
                      VALUES (
                          3,
                          'Barbell',
                          'Штанга'
                      );

INSERT INTO equipment (
                          id,
                          en_name,
                          ru_name
                      )
                      VALUES (
                          4,
                          'Dumbbels',
                          'Гантели'
                      );

INSERT INTO equipment (
                          id,
                          en_name,
                          ru_name
                      )
                      VALUES (
                          5,
                          'Kettlebells',
                          'Гири'
                      );

INSERT INTO equipment (
                          id,
                          en_name,
                          ru_name
                      )
                      VALUES (
                          6,
                          'Training apparatus',
                          'Тренажёр'
                      );


-- Table: exercises
CREATE TABLE exercises (
    id             INTEGER PRIMARY KEY
                           UNIQUE,
    en_name        STRING,
    ru_name        STRING,
    en_description STRING,
    ru_description STRING,
    equipment_id   INTEGER
);

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          1,
                          'Neck Flexion',
                          'Сгибание шеи',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          2,
                          'Neck Lateral Flexion',
                          'Боковые сгибания шеи',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          3,
                          'Barebell Shrag',
                          'Шраги со штангой',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          4,
                          'Dumbbell Shrug',
                          'Шраги с гантелями',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          5,
                          'Rubber Band Shrug',
                          'Шраги с резиновой лентой',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          6,
                          'Elevated Pike Shoulder Shrug',
                          'Шраги с собственным весом с ногами на стуле',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          7,
                          'Barbell Overhead Press',
                          'Армейский жим штанги',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          8,
                          'Dumbbell Shoulder Press',
                          'Армейский жим гантелей',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          9,
                          'Rubber Band Overhead Press',
                          'Армейский жим резиновой ленты',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          10,
                          'Elevated Pike Press',
                          'Отжимания стоя на руках с ногами на стуле',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          11,
                          'Barbell Bench Press',
                          'Жим штанги лёжа на скамье',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          12,
                          'Dumbbell Bench Press',
                          'Жим гантелей лёжа на скамье',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          13,
                          'Push Up With Rubber Band',
                          'Отжимания с резиновой лентой',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          14,
                          'Push Up',
                          'Отжимания',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          15,
                          'Dips',
                          'Отжимания на брусьях',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          16,
                          'Barbell Deadlift',
                          'Становая тяга штанги',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          17,
                          'Dumbbell Row',
                          'Тяга гантели в наклоне',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          18,
                          'Rubber Band Deadlift',
                          'Становая тяга с резиновой лентой',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          19,
                          'Pull Ups',
                          'Подтягивания',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          20,
                          'Barbell Curl',
                          'Подьём штанги на бицепс',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          21,
                          'Dumbbell Curl',
                          'Сгибания с гантелями',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          22,
                          'Hammer Curl',
                          'Молотки с гантелями',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          23,
                          'Rubber Band Curl',
                          'Сгибания с резиновой лентой',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          24,
                          'Humer Curl With Rubber Band',
                          'Молотки с резиновой лентой',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          25,
                          'Chin-Ups',
                          'Подтягивания ладонями к себе',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          26,
                          'Barbell French Press',
                          'Французский жим штанги лёжа',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          27,
                          'Close Grip Bench Press',
                          'Жим штанги лёжа узким хватом',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          28,
                          'Triceps Extensions With Bumbbell',
                          'Жим гантели из-за головы',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          29,
                          'Triceps Extensions With Rubber Band',
                          'Жим резиновой ленты из-за головы',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          30,
                          'Dumbbell Bent Over Kickback',
                          'Выпрямление руки с гантелей в наклоне',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          31,
                          'Rubber Band Bent Over Kickback',
                          'Выпрямление руки с резиновой лентой в наклоне',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          32,
                          'Bench Dips',
                          'Отжимания от скамьи сзади',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          33,
                          'Diamond Push Ups',
                          'Отжимания с узкой постановкой рук',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          34,
                          'Barbell Wrist Curl',
                          'Сгибания ладоней со штангой',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          35,
                          'Barbell Palms Down Wrist Curl',
                          'Разгибания ладоней со штангой',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          36,
                          'Dumbbell Wrist Curl',
                          'Сгибания ладоней с гантелей',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          37,
                          'Dumbbell Palms Down Wrist Curl',
                          'Разгибания ладоней с гантелей',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          38,
                          'Rubber Band Wrist Curl',
                          'Сгибания ладоней с резиновой лентой',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          39,
                          'Rubber Band Palms Down Wrist Curl',
                          'Разгибания ладоней с резиновой лентой ',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          40,
                          'Crunches',
                          'Сгибания на пресс',
                          '',
                          'Можно выполнять с грузом или без.',
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          41,
                          'Ab Roll',
                          'Упражнения с роллером',
                          'Need Ab Roller.',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          42,
                          'Plank',
                          'Планка',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          43,
                          'Bench Plank',
                          'Планка с ногами на скамье',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          44,
                          'Rubber Band Plank',
                          'Планка с резиновой лентой',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          45,
                          'Bent Over Row With Barbell',
                          'Тяга штанги к груди',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          46,
                          'Rubber Band Row',
                          'Тяга резиновой ленты к груди',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          47,
                          'Good Mornings',
                          'Добрый вечер (наклоны)',
                          '',
                          'Со штангой или без',
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          48,
                          'Hyperexension',
                          'Гиперэкстензия',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          49,
                          'Barbell Squarts',
                          'Приседания со штангой на плечах',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          50,
                          'Rubber Band Squarts',
                          'Приседания с резиновой лентой',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          51,
                          'Squarts',
                          'Приседания',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          52,
                          'Barbell Lunge',
                          'Выпады со штангой',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          53,
                          'Dumbbells Lunge',
                          'Выпады с гантелями',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          54,
                          'Hamstring Curl',
                          'Сгибания ног в тренажёре',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          55,
                          'Barbell Calf Raises',
                          'Подъёмы на носки со штангой',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          56,
                          'Dumbbells Calf Raises',
                          'Подъёмы на носки с гантелями',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          57,
                          'Rubber Band Calf Raises',
                          'Подъёмы на носки с резиновой лентой',
                          '',
                          NULL,
                          NULL
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          58,
                          'Calf Raises',
                          'Подъёмы на носки',
                          '',
                          NULL,
                          NULL
                      );


-- Table: load
CREATE TABLE load (
    exercises_id INTEGER,
    muscles_id   INTEGER
);

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     1,
                     0
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     2,
                     0
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     3,
                     1
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     4,
                     1
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     5,
                     1
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     6,
                     1
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     7,
                     2
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     8,
                     2
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     9,
                     2
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     10,
                     2
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     11,
                     3
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     12,
                     3
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     13,
                     3
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     14,
                     3
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     15,
                     3
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     15,
                     6
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     16,
                     4
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     16,
                     10
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     17,
                     4
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     18,
                     4
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     18,
                     10
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     19,
                     4
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     20,
                     5
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     21,
                     5
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     22,
                     5
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     23,
                     5
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     24,
                     5
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     25,
                     5
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     26,
                     6
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     27,
                     6
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     28,
                     6
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     29,
                     6
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     30,
                     6
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     31,
                     6
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     32,
                     6
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     33,
                     6
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     34,
                     7
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     35,
                     7
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     36,
                     7
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     37,
                     7
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     38,
                     7
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     39,
                     7
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     40,
                     8
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     41,
                     8
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     42,
                     8
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     43,
                     8
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     44,
                     8
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     16,
                     9
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     45,
                     9
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     17,
                     9
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     46,
                     9
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     19,
                     9
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     47,
                     10
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     48,
                     10
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     49,
                     11
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     50,
                     11
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     51,
                     11
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     49,
                     12
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     52,
                     12
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     50,
                     12
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     53,
                     12
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     49,
                     13
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     50,
                     13
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     51,
                     13
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     52,
                     13
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     54,
                     13
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     55,
                     14
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     56,
                     14
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     57,
                     14
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     58,
                     14
                 );


-- Table: log_days
CREATE TABLE log_days (
    id      INTEGER PRIMARY KEY AUTOINCREMENT
                    UNIQUE
                    NOT NULL,
    start   STRING  NOT NULL,
    finish  STRING,
    days_id INTEGER
);


-- Table: log_ex
CREATE TABLE log_ex (
    id           INTEGER NOT NULL
                         PRIMARY KEY AUTOINCREMENT,
    log_days_id  INT,
    exercises_id INTEGER,
    repeat       INTEGER,
    weight       REAL
);


-- Table: musсles
CREATE TABLE musсles (
    id      INTEGER NOT NULL,
    en_name STRING,
    ru_name STRING,
    icon    BLOB
);

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        0,
                        'Neck',
                        'Шея',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA793000005B949444154789CED9C4D6C545514C77FF7CD746A4B2D85188C1281C4A59A603446309A9050544025229D5634461792B84017EEED561313A20B3F766A908F6E8C4460A62146434025110851378A24C8476B81D2967ECCCCBBC7C56BA1A533ED68DFDCF3A4F79774D1F7DECCFFBCFB7FE7CEBDE7DE19F0783C1E8FC7E3F1783CF30DE35A50F2D941A0C9B56E5518064DEB9E669792814BB1712E2A685687B88F4DC100935C03CCBC30C026D7009F01CACC0B03447A9C6B564B80F3D8DC1B60129C01D67D6C0A1990E05150301FBAA0446740380F0C28A5926B407A3E64C092053D8075AE3B3BC2C245BDAE459D1B601EFEB4085C76AD5B057DE3B13945A31401C92C47A8C4A46340224742328F0C48E448482726A50C48603D48A110076A9F01C1591DDD1910CE69C82A7541E14915DD991039AE21AB640027805045BB3C2181A83C142A0698D6AEAB20DF686897C5B02F8AC93D5AF30008521FA9694F433ED6525633C0ACDD751038A0A57F03E966EDDEBC96BA5E060088D906A8A4FE38FD94EA5E3306D10A40D500F3E4EEB388598F615041FE1AD84D66FDCEBF14B4AFE37C5F503924DFF618450E53E7289CA240461E37AD5D87DD085626110600C83BCF0A2BEB61418D9372D8C289314CE7D789B877DDCF80C90C5BF871047A6B383DE82BC14F23702D39CB11C93100A2A9D9C951F8BD0036C6CF452BF047118E8F81F38AFFCC24C200F9E2F9BBA61CF8B308C746E152C89CC62742F4D41F1B85D385A9A7BEECB8730EEF1C1B69ED000028D895D38E0D58F879149A02589286C501341AA80B2A3F3616285A1816B86CA1B7044315BA9BD1C24A2017D72DFC579261402AB5014AE5CF0D59182AC0E99835D3AC270106A87741D2D91910F08C82F47322FAA340750358F55B1B43769973DD41BB9CEEEC0BCE756F42D500D9BFB519C3BBF42B0C0B072CC07BB27FABD32F64DC8C6E06A4C30FB02C63406169E06A089615A44B3BDC8BDF40CD00C9B56F0779854B259DA59910B81C02BC2AB9EC1B0A11004A0648AE6D1346DE07E06FC585B1DEF191976187E4B21B3542706E80E4B24F63CC6E208D95DA961E66A3379C9871D761E8927C769DEB109C1A20F9F697317C05D403D067A3CAA416458966DB11B701FB24DFF692CB109C1920F9EC9B209F0199EB072F54987CB9E4FC940CCC80F95C72ED9DAEE46B3E1191BD5B322C0A3E44787DCA8982C0F7C373ABF5C481019E6884CCB4A6F8847EBBDDB47515CABC2A366A9A0172E8C5E5B404DF4D6B7C889E7EEDC68728868B6533711B2DA92372287B6F2DE56B66801C6CDB8C0D7F011E2D7BC1F904743F139CAB148B3C84E5941CE8E8A89574EC5D90746F59086627623654BC68C8C2D191B8A5E7C6AA86A8F25A09638E12861BCD535DB17EB721D60C90EEEC5B48D03363E3035C4CD2A6B8717A66C948915504E682E4DADE8E5336960C90435B1E210CF602CBAB7AC191642D0B02D15AF4EA86EAAE359C87F466D3BAF387B9CA566D807CDB7107455901DC83911644EA215888910711B2552B5EB39101496475C3BFDB1420760F26751CA41F430131FDC059EACC19B366575F356F31AB0192CF9E025610D74FCC9C2BC1AF63B1BC55ECDC570F77C7B64635049C31EBF63C30D345D5D87D3F71FEBE4F7F02FBFF09AEC41A5B1351DBCD88FB625CD2FAFEC928C4E6DE80B124CCBE2A50701F9B7B03146EB26A141E0EF7BB22D6344655C8123024D18EB8C110AE5877E6640C2C0AA029054D061A53502738DB9B3A09F7060406EA4D54905E009002EAA27323365AA5BA62A37D3D6331F5C91903CD41D4E88BD3707B5066FCA7B3412219FB822668086069004BC7FF9F30E4928DEAF6A52A332405B4A4A2CD5C151B3C1924CB809B996C88251AC2F65B1808A37AD244A1384354C7690EA2866F49696F37A89A641B309900589C8AFE26BAAC5B80FFC97372EBE20D50C61BA08C3740196F8032DE0065BC01CA780394F10628E30D50C61BA08C3740196F8032DE0065BC01CA780394F10628E30D50C61BA08C3740196F80C7E3F1783C1E8FC7E3F1783C1E87FC034317C1D3A1A5BB5C0000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        1,
                        'Traps',
                        'Трапеция',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA793000007B649444154789CED9D5B8C5D5519C77FDFDAE7CCB5763A43072CF6426A2F86161210442A6AAA6DA77D68B1CA740A260A5A1B08260679213E0D4F3E99A85184268A119C76E60429D480BD601B298A2915057D681A4B14B52D6AE9057AA69D73F6E7C3198BD3CE65AD75F659FBD4B37FC9493AD3F5EDFFB7D77FAFCB5E7BED339091919191919191919191919191D14848DA095C8C0EDC7915C787BFC53BF11ACEC69D94B4BA1C73A2B4CB09DACCF3B4CA8372DFD36F25946A22D48D01FA68EFB59C19798413A54F50AA515E39942EF31A6DB9AFC8FD3F3B50130D475237407FB0FE4ADED121FE55FA2471205101BACD1F6893B572FF336F06529D309554D0FEFE1C9DBFFF3E6F9537715E4D2A49E450BAA3ED749EBA4BEED9379C460A3535405FD99CE7DF276F45CC6DC022D0C5A0B341DA3917CFE0C5A2A0B5CCC00223F0B156A5454E82BE0BF2379043687C0835FB693EF61B59BEAF542BF9C40DD0E7D634134D5F0F6CC4F02994F74D58F88FE7E068CDCECD8EAB73B0A479B212A7117E09BA95B775BB6C289C4F523E310374A8B7898EE85E247E08649655D099185E2E2695821FB7B4C0F4C8B6F43F10BE4967C76372D3969124E4133140F7F4DD4CCC8F80A5CEC10786E164398934DCE98AE0C32D3E91AFA3F13DD25338586D0A550F7EBABBEF0BC4BC884FE503CCCB559B823F73BDB5AF43CC7EDDD9F7F96A53A8CA00DDB9E18B288F039376A293D29D83F6142641EDA6A2ED4F0BC213BA73E397AB3988F799EBEEDEDB10F96135C7002A9DE082BC5FAC01ACBBEF8B58E8A9391641F451DDD37BABEF01BC2A4F77AC6D43CD13F89FFE58BA7330DD2395BC81BCC730D6616066625D5F8ED83CA97BEFF61A4CFCAEDEE6D6AF02D778C58E87001F6A729F123401390F031637273D019F4FA978AF4FA0B3013AD41BA1F2808FD8A4744430CBF1AA6C96CAC785AB7395169034AA0F6A7FBFF381DD33E992E508EF778EB36161935B97D2662A1F5B9A041635B9E76585CC66D99F3EEE1AE56E80CA2AE7185B9A04963A740F338CDBD57C6DB3DF98618B9AD5AE211E0670A3738C0B3323986D31433140570EAE88ECA60273F2D09DCC9C6142841B5C437C3AC3851E316E2CCA4F3D4B9993873C9556F381290C9B19C1E25A753D6358E41AE06E80D0E91CE38A11B8BEB972758FC70C33F6DE614153E577E3714504D7B7845A789FE11AE03E1956DA9C637C88801B5AE08D11787304CA0AAD06664530375F31E97FCBDED85A2977AC0467E3CAF4746E1EAE49E486CB9689577E27C0E76EA4084CF388734780F9F9CA672A222A951DB6C22FE65DD7009F31E094474CA370D23520332049D4BD6E3CA6A1FA57E7984641D4F901BFBB01465E778E6914D4BD6E7C5AC06BCE318D82C7C5E96E401CBDEA1CD328C4F23BD7108F41B874D43DA64130EE75E36E402EF711E79886413EEA1AE1D105C5C93F0BF87FC1E33989D30A89BED0F741CA1C768D6B2014A2C5B26AE0B06D805B0B28B399ACF22743D0F2975C025CBBA08D8EE51B0FE14E97E2D606E8F3BD8B81B9CE09351EF3744F9FF57301FB169033B778A5D38894B9D9B6A8BD01B15EE7954C2322F675656F8091055EC9549E1F5CAEF8BDB4A1F675656F8062B7E5FCD240E735F23AC26FE95DECEBCA6516E4B91748EAEAAD44477C73B7AE2B0703C4E7316409F8B3475CBD7018BC5E1DB47E36EC60807A6C3ED563A85EC6ABA7721038E61E86755DB97441EE0688BC82A12EDEC7F542E50082F312335A0B0354D703471C13D947590FE0D78CD326464B0751F63AC61D41F9AC6D616B03A4676807D3E2A5A83C8CDDF4AC8431DB6475E104F0B2AD4EDD20BC24AB0B2730E6A754C6B2A928A2F230F9D625D233F8735B19A7B5205956284ACFB67E4CB404617211919FC88AADC747FFFDB48B4E5DA06C0790155B8FA30C4C517A07265A2A3DDBFA65F98F9DEE1DBC36CACB8A8123B272702DAAEB18BF5B3A85C837DE5331052EAF6EA88C4AE1C24F9A7F08383D4EB923286B65D5E03A5931E0D63D8F52D59B0A13744B312A9B2E5CFD807C7AE02FA8EEAA462B30BBA467DB852D26B2FAC9A3A86CE6BD8B6818D17ED7EE663C927B517BCF5DF3D1F277801764E5E0B72FF9FF9D1BEF40B4304E68FD217A87AC1C7AEAE25FEBAEBEAF232C47A2AFF95EF197482571101B74EFDD2D8C148FE2B1833830A7C9B75EE5DA97FB12EC05DDD113DA1E4AAF0A0AA12A1F021A0080E8B6A07A3E98B0398635A05D7F0524FA6D2309739EA86D7F48C1A006C8B24211A8E7AD8DAF86EC7E20740BA850C777C5FADBD08A6918F0460A9A76A809BE741EDE0095BF07D7B4C5C4C1734BA105C83FC36B5A12133CB7145A4039EDAFE99B1835C1734BE7EB22EB15530E5E1FE10D107365704D5B34EA0E2D19DE00C39CE09AF604CF2D853120AE5F03446787964C631614FC241D68801650DF3BAC1BC100AD6303745E68C534BAA08EF09AB648EDBF8AE72252188439145CD39EE0B9A5310D7D3CB8A63DC1730B6F407BFC18681DBEECAD4799166F09AD1ADC80D187329B20F53FDD301691FB46730B4A2A6B41B26AE839D047D2D09E80EFC9CAC167D2104E6F31AE6BC603C0CED4F4FF8BEA2FC81F4FEDEDFFD40C909BB68C502CF602BF4E2B07E025868737D4F26FC44C45AACBD172FBB36738777625E8EE14E4F7512CAE91DB9F3D9382F605527F1E206B779C25DFB66ECADDD6C9B2837C6BEA950F7560008CEE9A7B3BFE0CE8776B2FC616BA3A3E177AFB49464646464646464646464646464606C07F001CABEB9724733F410000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        2,
                        'Shoulders',
                        'Плечи',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA793000007F449444154789CED9D6B8C555715C77F6B9F7BE7CDA30352E88BA42024D2AAD1B634F51329C35095571DA43ED08620516AD2B489C61863A6D12FC698404355888D6D9529309AD6D2D4823410637D04B0895F7C10300D96618A1D0AC8DC997BEF39CB0F77A0753A3067EF73669F8B737EC924F3386BFFD75DFFBDF7D9F79C7DEE404E4E4E4E4E4E4E4E4E4E4E4E4ECE6442B24E60347A706D1B15F339942E848F00ED099B1C003D8A9A5F4071A774FEEC621A79A645DD18A0FBD6CF82CA6684AF82CE982099F3A04F512D7E5F3EBEF35F13A46145E606E8BEF5AD50F91AA25F079A3DC996417F8CE8B7A5A3F79C27CD31C9CC00EDEE367CECAF9F27E27B08B3B3C942DE02FD0EC5FE2764C9A16A26194C64E3BA7D450BC3858D54F51394751EC35C4F396A26520322DCD9046D662253189F0B111C1902543112D1604A34D24F518E53302F12F6FD441EFD4369A2E45337401FBF6F2A61E37719D42E2E84B309AFA2D11EC0479BD24EC18E23437036BCF2DF0B285382D3B4CA1E0AC56FC943BDFF49533E3503F489B56D94AA4F73B6BA9AB2C6EBD606B8B735AD14DC38701134E6B10D2664863CC7CCA90FCA17D2594DA532FE75DB9A2F7266E80CFD95FB63171F204A433D014AFCE20394A380BEB08BE36FFF5BB7AE5E9F460A890DD02DAB7670B2F21417D57E2E2966BC0813C71C06B58953E133BA65CD8F92A690C800FDC19A2739157EC9B927B766BE0A76CF21523855F9B26E5DFD641279670374EBAA87E8AF6CB01AC2A3B92E48109C12ED097250E08DEA06DDB67A936B134EF6EBF6153339491FC35A701506E08EA6EC4D1808E1E850B2369AA4CA9C29B36473CF59DB50B7117031783A71F11B04A665FC1E006A1DA021E15438A4054A833F7509B5AE8076AF6DE0AD70B98BD8FF30A700A60ECE0102CC4ED6970018083FA99B36156DC3ECBBE0CCEAC3564BCD2B312785179D1637A4904B590316BDB9D936CCBE9083DA651D339AE906A6D4C1F4738929A696535286F501DB107BD5619D6F1D339AF90D899B489D5B53C8A9ACEFB70D7130209A6A1DF36EDA83EC573E63312348B6240518D269B621F60684B86729C07CEBF3943FE63524BB3A56B5AF8D8301EA9EE28D05985687BDFF12D30DDC90A08344F6B5B137401CDFFBB61858D0E814EA9505C55AAE2E18FBDAD82B15C4FECA4F007CB8910493973F0A52CBB5E030D003FBDAD81B1088DDAD3B23F0A12668ADA365E778B41AB8BDC1BE3A052AB652F65569E47CEC638391DE34E35AE8FAA39859A8751C9BD48B267E6D46B037A028AFC73AAEC5C05D4DD766F12F313380BB9AA13966991AF9A7AD848301FAE7ABB728704B1116D7C10DF7346833B0B8B9F69AC63B2D14CD6BB6CDDB57C8145E1EF3F701705301EE6E82850D6E27B17AA548ED35DDDD023716AF3C2D19F3926DD3F657A1C2CA3F68945A811B04A61A981ED4A69A6B78B689459BC0071A6A4BD58108CE85702E82B24255A15C3E66DBA4BD011F6CBB9928EBBBE91953109815D4BEDE8DE85CE06F364DD94F4151F48875CC6441C5BA365613B5BEB26E1E21C76CE326110AC14259D6137B2AB21B01219BC88B7F35040D37D804D84E41D6371C261DC2676C0E8F6D80FE7AED42E016EB84261F73F5C0BA05710F8E3F020A66B1533A9391903BE31E6AB18F536F774A663222F16B15DF0023AEF782276C6FBD07DC766C69FC5AC5374099E3940CFAB65B5C5DE0F6F892C4AF95CD2AC8F1312279D32DAE2E70CD3D76AD2C0C90368744AAC07187B87AE1186E4F314C897BA085010EFBFFD1D3A85A5FA2AD1FE42870DA3E8CD8B5B29982EC0D103982E1B0755CBDA07218E1EAF73FC68C9B080354D700272C133944A887C9FE61241722B47A14E5A065DC0994FBE31E1CDB00E9DCB397B6E836541E23DEF2AC8A31BB6479EF00F0C7B83A7583F0AA2CEF1DC0989DD4CE65E35142E5318ACD8BA473F78B7165ACAE05C93DBD25E9DCD58D0916215C5D44E41959FA6CFFC8F7CFD9E8D405CAF300B2F4D97E949E718EDE8B096E93CE5DDDB2E429ABF70E4E376D6569CF09E9D8BD02D5958C3D2D9D43E49BEFA8985EAEAD692844A5F7F24F5AFC068CB91BE404CA0A59B67BA52CEDB19B9E474874D7FC0AD35284CAC6CBBD1F907B7B5E47757F122DCFEC97CE5D272FFD20CB7FDE87CA26DEE944438876DB4E376391DE83DA073E7B2B1A6E055E918EDD5BDEF3F77D0F7421DA3B4668FD21DA251D7B7E39FAD7BA7FDDA3084B90E061D71EFF1EA9341A89831E7CB0894AA90F98EE4BD391F3149BAFB79DCB5DF1B67167E4053DEF4B2F01BDBE8A0F1E0D00407497573D178CDF1CFD1AD0AABF05CA5E35ED2813B4FCCEA7A05703E49EDE12F0179F9A96BCE673FA01DF23A0461DBF2BD63FF956CCC200EB1DC4DE50E3FDD2B97F0354DEF0AE19171379CF2D83112067FC6BC624C27B6E198C8030C907DC4C2C6ABCE7F67FF004458A98D07B3DFC1B20669677CDB868F03EDF92FE0D30DCEC5D333EDE73CBE01C10D5AF01A237F996CC6215E4FD455A300946407DEFB09E0C06681D1BA0737D2B663105597FA68E3FE43ADF8A199C84F9BB77CDF878CF2D8B65A8D3C73B7AC27B6EFE0D688DB683F679D71D17EDA32DDAE15BD5BB012337653662F7B9E5138FC8574672F34A26D78264D99E97407F9885F615D8261DBB7F9585707617E3DAA73F02ECCB4CFF12AA2F53ECCFECE9FFCC0C903B76542895D602BFCF2A07E05586863E9DD53FF0818C2F47CBAA172E303CD801FA9B0CE40F512ADD27AB5EB89081F66532BF1F202BF60E526C5939EE6EEB74D94BB139F3E2431D180023BBE6CE46AB411F9F783176D03EED53BEB79FE4E4E4E4E4E4E4E4E4E4E4E4E4E4E400FC17BF161F92B71851BE0000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        3,
                        'Chest',
                        'Грудь',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA793000008BC49444154789CED9D7F6C955719C73FCFDBB25EBA75327E4F1136A65BC60F8D64C3994CB39A012D2B6C289099198D6692699698996816FF305DFCC318FF51A3C691388DC97459FDC17AA1159649A34C24D0A1B0CDA1AE93D901457EF407D0527ADFC73FDE5BDAC16DEF39E7BEF7BC17783F49FFE8BDE739CFD3E77BCE79CF7BCE79DF424A4A4A4A4A4A4A4A4A4A4A4A4ACAB584241DC0A5E8CE0D373034F408E87A9065C0F412AB3C85D289C86F08869E95553BCEC611675C548C00BA7DDD6CC2DC57401F076694C94D3FF00B74E47BB2BABDBB4C3EAC485C00DDBEF27AC2CCD741BF014CF5E47618F829D5996FC98A963E4F3E0B929800DADC1CB07CDF6711F92E3037A1304E22F26D6AFA7F2CF51D23490450560174DFA629F41CFB18557A2FCAEDC01D20F340AF07A695DBBF050AF4829C05ED060E811C4272BBA839BBBB9CE2C49E006D6BAC41A6AC037D18F8245017B70FCFF423FC11F835FD992DB2B16538CECA6313409FDF701D75438F014F0237C7556F85710491EF3073EED372D7E60B7154188B00DABEE66E94671096C451DF15C04182F00BB26A5B67A91505A556A06D4D9F03FE7C0D251F602961B04BDB9A1E29B5A2927A80B6AFFD3CE833C420E4158A025F92C6ECCF5C2B701640DBD7DC0B740055AE755C258C807E421AB7EE7631761240B36B6AA9E635E01617FBAB902E32038BA5BE63C8D6D06DE898228F53AEE49F5438A651E78E8B10389AAFBB3C2C64B0EE311743EB1EA0CF6FA8A26EA89B72DCBD9E54384894B01A81F701F3806AC7FA2E00DDC03B1A2D3E04C05229D34A9374B367D902696E0E6DACEC7BC08DC3F59423F9A7184B3EC079852E85DD0A6FEBD8E726844436BB81B7F2C91FFDFC80C28972F4049DC7F2CE8FDB5AD90BA0BAD2DAA618BD0A072748F205E0DFC05E8DD6328BD107ECD1C866A440A2157895F2882034D89A385C037499BDCD249C56F81B902B52EE2CD099EF0D05C322EA31AF280C16A92B2412E1B465AC45918FD85A38F4003E686D3311BDC001CC8717256AD96F5C72910E15FEA1F01FCC2FDE21F0778D1A406CE8EDB616F602083759DB14A2972801C55A7E218E100D59C3443FAF0A1C73A827246A00BD0EB68599666BE032BFA875B07937A7892E862EC91FE504B02B86D69B236A084BA5F4CD4F87955F97FB806223ECE49CC0BDE5978B51118E972CA8F57EB38B00EE5B78C72699ED248D02AF01474A12C17A30F3274037F03AF1DEE1C68D028780C3CE415AE7C64580B7AD4A8F4E0FFF59C9991F87026FE67FEC43FEAFAD81830072D0B8680E783D3F3DBCD2389C1F2E0BDDCC4D8C796EF2B8F4800346A57A817D0A3D0E1E2A8513C03ECC6FD8C48700A2FB8DCABDA10E73820AE41C70C8B01708AFD856EFD003868F1A159B5E29274E62C074F534C898E566BC89AD01D42C372A56FA4D4DE560DA9846CEDD635BB5CB6AE81346E5A673756C565681F9E24B95596EC6612580B63D741BB0C2B8E61957C13034532CB2A42B754793D562A5650F18D984CD2EDADC2B64EE3F1973AC4A0B39F9A28D81A500F2B055F11902193B0F15450697EDCBCFD81436EF5CED6BEF40986F158A000BAD2CECA8C9FF948B5BC5E5DCC802DDB6DA785FC0BC0768F851EB5000E608CC76B22CCE4D585C202D9985FB095709EE362D6ABE1F20B2D42D186091404EE1A4530D13D77B4BBE79F6C47C8C65A6C0E212EC03F35C99F700E1034EC1C02001F021815B89EF3CF62289B6866A813B63AA34201A7696329A19EB83560084E6B9B2D91173ED90BDC05484E88F9B43B438779C682FD7966AE04EA2216294B94020D1F287CBA31481C06C8D7AD4F8FD3EA50F719846881AE7CA5C00753E0B749CF1E2D5028B80DB801E8976A106283E840891780B279859CD066E9468E9BBC7B0BEBABCDD1CA283609797398EED44343234CE954D0FB8C13E10468856D63F7CD93735C07C60BE44CBD6BD44AB8E7DF9632523C07540ADC07485D90653DA0CD1D0B49048F653C0B9FCE67D75FEFB69125DB8A76172A7FE2FA2AB81ED8A81F1DEB08D000E337A3906E17E904F4D5AAC8A68BE3D030A5F242CC7F80C79711D6CDFEDB613E51EE0BD9696C6B9B251D6652CDC07BAD7DAAE5210D98BDA2F3153160154D7015D7671480732B297CADC862F46889EEF4474A7A55D170193F7F871180B20ABB76619C82C01790AB3E9D908D53C270DDB4F81FED5D44FE5202F4BC3F6534C099EC56C6E3508F2149981C5B22ABBD5D48BD5C54536B60C4A636B33B97031CAE44E447F29F7B7461B922ABFB7F15319845B00E4FED61E447E55A470965CB8441A5B9B6D1FD2707A40439AB675C9EAEC1A54D7527858EAA33AF8E6C5DF34D7C295350CE508AA5AC67EAD7E92C267B3BB0858238DD9B5D2B4CD72788E28E9E1BA0986A510D5472FB67E401E683B0CEC28C59757841DB2EA858B474CA4E1774751DDC458231A026DB61D6E0ABB8A09DDFAC04282E007C04BB23AFBFDCBBE6F6B5A8F484B01D3CA43582F0DD9DF5EFAB1B6377D0D957AC2F0ABAE2DFE72579ED09DF765385F7714B53F41EC997E3203735C1EB873C1DBF3BD52DF3184B2C597BF1268F1957CF0FE8075F89C5F7F0E48E03546BF020CD4FE89B147E62A91616AFA76F974E85500D9D83288E9D1C62410F6FB1C7E2089773C6805DF152B7B7CBBF42F80F096779FE6BCE9DB61023D8077BCFB3445FCC796C06B66E47FFE7D1A92F31F9B7F0102A9DCE3725539EFB15DAB2F5A2A4C1878CF877F01C2B05CC7B4624067152F132F495C03DEEFDFA721E23FB624A6A1952B0032CFB7C724AE01DEFF4873F41AE801589EB0F64B2A40C22CF0ED300901DE93804F53CA75D87D429210E050023E4DF11E5B126B413FF7EED31411EFB1F917E04CE669A2B778561A47E9AFD9ECDBA97701A24D197D944A7B718DF0E5FC86915712590B92C6AD6D203F49C27741547F240DD91792709DDC62DCACB94F806C4FCCFF187F60EA19EB27DCE3223101E4AECD17186603E85F928A01789961D998D43FF0818497A3E5C1D601466405CA8B09B8EF60581AE5C1D681047C5FA4225EE6A03BEFCB3058D782D0E4C96596CCC046DF27200A51111B3252DF31C499CC43C00F3DB8DBCCAC9B3F5D09C94F49494949494949494949494949B9F6F83F7EF37E6AC2BC7F470000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        4,
                        'Mid-back (Traps)',
                        'Середина спины',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA793000007B649444154789CED9D5B8C5D5519C77FDFDAE7CCB5763A43072CF6426A2F86161210442A6AAA6DA77D68B1CA740A260A5A1B08260679213E0D4F3E99A85184268A119C76E60429D480BD601B298A2915057D681A4B14B52D6AE9057AA69D73F6E7C3198BD3CE65AD75F659FBD4B37FC9493AD3F5EDFFB7D77FAFCB5E7BED339091919191919191919191919191D14848DA095C8C0EDC7915C787BFC53BF11ACEC69D94B4BA1C73A2B4CB09DACCF3B4CA8372DFD36F25946A22D48D01FA68EFB59C19798413A54F50AA515E39942EF31A6DB9AFC8FD3F3B50130D475237407FB0FE4ADED121FE55FA2471205101BACD1F6893B572FF336F06529D309554D0FEFE1C9DBFFF3E6F9537715E4D2A49E450BAA3ED749EBA4BEED9379C460A3535405FD99CE7DF276F45CC6DC022D0C5A0B341DA3917CFE0C5A2A0B5CCC00223F0B156A5454E82BE0BF2379043687C0835FB693EF61B59BEAF542BF9C40DD0E7D634134D5F0F6CC4F02994F74D58F88FE7E068CDCECD8EAB73B0A479B212A7117E09BA95B775BB6C289C4F523E310374A8B7898EE85E247E08649655D099185E2E2695821FB7B4C0F4C8B6F43F10BE4967C76372D3969124E4133140F7F4DD4CCC8F80A5CEC10786E164398934DCE98AE0C32D3E91AFA3F13DD25338586D0A550F7EBABBEF0BC4BC884FE503CCCB559B823F73BDB5AF43CC7EDDD9F7F96A53A8CA00DDB9E18B288F039376A293D29D83F6142641EDA6A2ED4F0BC213BA73E397AB3988F799EBEEDEDB10F96135C7002A9DE082BC5FAC01ACBBEF8B58E8A9391641F451DDD37BABEF01BC2A4F77AC6D43CD13F89FFE58BA7330DD2395BC81BCC730D6616066625D5F8ED83CA97BEFF61A4CFCAEDEE6D6AF02D778C58E87001F6A729F123401390F031637273D019F4FA978AF4FA0B3013AD41BA1F2808FD8A4744430CBF1AA6C96CAC785AB7395169034AA0F6A7FBFF381DD33E992E508EF778EB36161935B97D2662A1F5B9A041635B9E76585CC66D99F3EEE1AE56E80CA2AE7185B9A04963A740F338CDBD57C6DB3DF98618B9AD5AE211E0670A3738C0B3323986D31433140570EAE88ECA60273F2D09DCC9C6142841B5C437C3AC3851E316E2CCA4F3D4B9993873C9556F381290C9B19C1E25A753D6358E41AE06E80D0E91CE38A11B8BEB972758FC70C33F6DE614153E577E3714504D7B7845A789FE11AE03E1956DA9C637C88801B5AE08D11787304CA0AAD06664530375F31E97FCBDED85A2977AC0467E3CAF4746E1EAE49E486CB9689577E27C0E76EA4084CF388734780F9F9CA672A222A951DB6C22FE65DD7009F31E094474CA370D23520332049D4BD6E3CA6A1FA57E7984641D4F901BFBB01465E778E6914D4BD6E7C5AC06BCE318D82C7C5E96E401CBDEA1CD328C4F23BD7108F41B874D43DA64130EE75E36E402EF711E79886413EEA1AE1D105C5C93F0BF87FC1E33989D30A89BED0F741CA1C768D6B2014A2C5B26AE0B06D805B0B28B399ACF22743D0F2975C025CBBA08D8EE51B0FE14E97E2D606E8F3BD8B81B9CE09351EF3744F9FF57301FB169033B778A5D38894B9D9B6A8BD01B15EE7954C2322F675656F8091055EC9549E1F5CAEF8BDB4A1F675656F8062B7E5FCD240E735F23AC26FE95DECEBCA6516E4B91748EAEAAD44477C73B7AE2B0703C4E7316409F8B3475CBD7018BC5E1DB47E36EC60807A6C3ED563A85EC6ABA7721038E61E86755DB97441EE0688BC82A12EDEC7F542E50082F312335A0B0354D703471C13D947590FE0D78CD326464B0751F63AC61D41F9AC6D616B03A4676807D3E2A5A83C8CDDF4AC8431DB6475E104F0B2AD4EDD20BC24AB0B2730E6A754C6B2A928A2F230F9D625D233F8735B19A7B5205956284ACFB67E4CB404617211919FC88AADC747FFFDB48B4E5DA06C0790155B8FA30C4C517A07265A2A3DDBFA65F98F9DEE1DBC36CACB8A8123B272702DAAEB18BF5B3A85C837DE5331052EAF6EA88C4AE1C24F9A7F08383D4EB923286B65D5E03A5931E0D63D8F52D59B0A13744B312A9B2E5CFD807C7AE02FA8EEAA462B30BBA467DB852D26B2FAC9A3A86CE6BD8B6818D17ED7EE663C927B517BCF5DF3D1F277801764E5E0B72FF9FF9D1BEF40B4304E68FD217A87AC1C7AEAE25FEBAEBEAF232C47A2AFF95EF197482571101B74EFDD2D8C148FE2B1833830A7C9B75EE5DA97FB12EC05DDD113DA1E4AAF0A0AA12A1F021A0080E8B6A07A3E98B0398635A05D7F0524FA6D2309739EA86D7F48C1A006C8B24211A8E7AD8DAF86EC7E20740BA850C777C5FADBD08A6918F0460A9A76A809BE741EDE0095BF07D7B4C5C4C1734BA105C83FC36B5A12133CB7145A4039EDAFE99B1835C1734BE7EB22EB15530E5E1FE10D107365704D5B34EA0E2D19DE00C39CE09AF604CF2D853120AE5F03446787964C631614FC241D68801650DF3BAC1BC100AD6303745E68C534BAA08EF09AB648EDBF8AE72252188439145CD39EE0B9A5310D7D3CB8A63DC1730B6F407BFC18681DBEECAD4799166F09AD1ADC80D187329B20F53FDD301691FB46730B4A2A6B41B26AE839D047D2D09E80EFC9CAC167D2104E6F31AE6BC603C0CED4F4FF8BEA2FC81F4FEDEDFFD40C909BB68C502CF602BF4E2B07E025868737D4F26FC44C45AACBD172FBB36738777625E8EE14E4F7512CAE91DB9F3D9382F605527F1E206B779C25DFB66ECADDD6C9B2837C6BEA950F7560008CEE9A7B3BFE0CE8776B2FC616BA3A3E177AFB49464646464646464646464646464606C07F001CABEB9724733F410000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        5,
                        'Biceps',
                        'Бицепсы',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA79300000C2849444154789CED9D798C55D51DC7BFBF7397F76661DE0C2320B15894A6565B8B4B288B805099416991016480A4B1B6369A3456522B98A64DC0254D171A2BD1446AAAC4BA3083304303C8AA58111D4445C49A1A8B08555964F6EDDDE5FCFAC7B00EEFCD3BF7BE7BEF63E8FBFC37F79EF33BBF39DF7BF6E50179F2E4C993274F9E3C79F2E4F97F8372ED402A78D3FC0A08F973306E0460003808E01008FF01780F88F6A050EEA371ABBA72EC6AD69C5702F0D6EA2990B404C00D0AC15D001F03D809F03608ED159AF2E291703D0C9EF34200DE30671074B10CC0BC6CCC00D807C63608D45045CD5B01B9172A391780B7CC9B04962F00343460D31F80E85EAA58B93D60BB81227299B8BB61FA8360DE1A42E603C0D560DEC69BABA785603B30725202F8D54971B7953768F1C19341A17F034D70F4E134EDF9D6B013F243E425806B2715DB8D6D1F0BB3348ACC07803218CEEC2812F243A40270EDF509476BFE44E8C5C3488B4799F2D51126E689C8046086B005EF65D71AA2C5074795EC89C4313CDA04D5894C0067CDA81DECB45DAA150C454455CF19D0651127A84C2439E1AC1DBB5CDACD63491810E6C02892EC050DCB41A24A842E80BB7AECDD6ED7F1BB0040C42ECAC1D70F005C9C834495083537B8EEFB235CB7F5098001A21E013C9A00A8164CF340F84516AE9CB75314A109C00CE1384D3B585A1A000823011286171336C0B753E5CAB93475650D5CFE300B775EC9226EA884268053F7BD97A4DB7EF1A984BC7DFD3688E75365ED73A79EC48EBE0EF0511FAE4808F1A88F7891108A004EFDC4B9D26E9979F26F1226843140DD00E1675451BBFAAC4793B73B8078C0BB375443535EDCEB3D5E34042E006F1C3B50DAC79F05CBD389C4CAE161D6633955D43C9BEA0555AE5C01E225E899F954E15300F7AB269C0B0217C0E974D6B36B99A79FD0090154E0A370F4457D85A08ADA0721301A4C0B005403D807E000881E01F0191887017E00428C049B5753E5CA2F7CFE2B9110E8649C533FE13637796415F8F4072ACC04F4E2116A06188B686ACD9F82F4E97C27B012C04B26E9D26E5E7166E603803055BF7ED860F9B7A0FCE92F0426803BB2FB4976BB8BCE7C46C2803012AA265EA59B573506E54F7F21100178E384A1D26AF9C939C6CD8100A9D672F45A10BEF4370211C0E948AE6176CEB1E5A9EF4F783F085FFA1B590B60D54DBA46DA2D63CE316C0C00693175432C3ECED697FE48F62540B63F07C8731E7B9EF771ECE6AC7DE987642580BD66D278B65BBF7DAE551DC22CF568ADFDBC5CB30D9BAC04606E5D916A50AAC52E82C721864DD35E4E66E34B7FC5B700F6DA8913D96E4B39C2521FF99EA2C3AF1FFD1DDF02B0D3F9444A8346094878687C7B68F1EB477FC79700C9FA0957B1DDF69D9406BD2FBA00C07FFD44BA10F0258090C9E5A97A3E3D6BBE5E1B5F0084037EFCB810F02C006FBD6988745A53EE5E1631DF0BEEBBFD46ECEF7816C06D6B7F0CD24DD9C51146993F2F4836F88BD8FFF12C80B43B66A47A4E5A1CA417FAF1C14621F6F8897821E04900AB7ECC2F592653EE2914A6CFAF1F78F74238E9E2176F25C0B5EE4D6BC8B700BCC667C40B025D35206F9C30D46A3E9A728F256985F0B9D9D605F1CAB469DE5F590411AB00F354005702B81440028C46109A40BC172CB681F56DB4B4CECF8E899CA33C5FE0D48F7EDAED6E3C67CE1F00B482A1D00A7C9CB120D45345CDCCDE8F79E12D23C0E23E10DD0140A56161005BC0BC8C96AE5FEFDD91DCA12C80BDFADA63D26E4F39CA324ABEE5A7017641F25AAA58F5C1C907BC644E313ABA9700BC001E4A672FDE02E33E5ABAEE4DAF11F9D53BE2B0BBA6835105C2180017A3278F8E82B11BA09721DC97A862556023772501784DE560CBFEECC8995B4D4E5BD060968DF493F6435459B3F8541A8BA657817919802036D24A809683930B69E9E68CF34CBCFB2E03C75BEF01F10300866408DE09E04908F1C7204E652A0960D78DFD9D4C7EF5EB54EF8491803E4071D7C309DCEEA3703BCF9E7D30DFB9C2930D1538665B32D156AD2FDCB9366D988D73AF8386A7C0B8CEA3F916008BD12C1FA7EA55AE5F1F957A41CC5655BA77A417A57B95126935C1EDFC3C85214F6694A0A4616AC74BEBDC3F8FFB4DEF77BC734E016FAE7E0C026FFBC87C004800F80B4AC526DE3A3F53A9494B46019821E0747E33DD7BD20B94139356139C8E0348B9B14DA4A8DE82C015248E943DE2FE61FC5F4F3EE22D73AF44BB6800E85E64BF2A78135CB98737CD1BED2772C6EFCE593B7E8EDB75A436DD7B2371955217B4A7DAF91CE976151A7B47806CBFEDAE0204B889B62DDAA8A12F00FC38006F4537331D60CCA1A9352F7B8994597D69F779C29044864C63174EFBA727EAFC3EB674EABEAB513518D09A0754C8FD8DCF20F8CC07802210FEC19BE6DDE925524601A4B4AFEF330069E9E35A4DB05B3F82B49A323AC2BA93314C1088FD06F8705B58E675103FC59BAB7FA5EC4FC610AED3E7088B65EF8C6348AB0576EBBFE1B47F0A762D354FCC68040013E85F00B77486950201B4543570C64A97D9EAB39595563384590276BBC1761BA4D50496B66AFAA7D331BDC7F18D2B40EF3AE0514950B1E7E5D3405168F5649FA5C4ED3C0437808F898D884AC0491C0D78B71B3C0AA082DC8990B10A226821F50FCF86E38A555580505207DEE902AC903B007D9059007D4024D7BD70819593AB43A8CB00EF6E059C48BEB373C82880EE16CE2011EB0EDD13DD051B11B60367401D26F8BD66F5834F0192B904546F6FA758F9AD202D74F7B838770B63D41C037F14FDF104A561B831E3B52DC22C5F1C761D210784D6355482BE88811BA3DDA4A73C0F62CC7CE361CD2C7B3A4C67B8A423B797A83180FDE1D7B667E269224A9FD570A7880F7C292C67D874C0F1DCEED1A5E638B82BBA1E99E79940A3AA618E88956D0BC319009065ED61995683011CCDBA2A546E2F7D4DC51A33774D11462294CD54B2BC25E777397253D6E302E53EADEFB9707DD6EE716424F6F98D9F0E366DC8446893654A5067D60787C2178008D298B57BA4304A03DFD7E90EC93C7B1A26944C3FC3AB48F80200274498FDF6286194057A1D0C17774196E6B02D70B46C47C6CA135B811C533566EFBA493307AE0CB2F2762F3916DE32A502DC9D456F8CA15C870676525E9FD5305F8B973FA17E30BB6F386EC11996C3CD6E1D59CCCE520E040000BDEACD7B44ACFCA1A0CCCA8B5A20CB737478B231ABB18072FD19F82AB851F5E662A76EFC27D26E7AE6E47565D9E07CFD4BE800C4F19200BC3B812E218B3BC1710B1CB38198D5B31E21182CDC9E9A5427985CE6EF924182F299E750B621E83377FCDD5A3B711F594DAFF7BEC0C3330438C30F43331C684706FA9EB164DD812C6F852C6B03172591D11003D26EF677CD26D341D5A0A1DD1967CEF8E77B4641621819C5019CFF62B8971C837DE501CF33A65CD40D67F897B0BFBB1FEED78E818BBAA1AAA2DBEDB70D92CA0284B81107A01FEE6862C608A76EF43A6935DD92ED843B1724615F7110D41983682A81E888035D26486A0003ACB9802E7BAA96E22EC8920E7081FFDE0C3B9D9056A38F52A05E02421500E8192B000DD3ECFA1BEEE764F3EF99B36F17B83009B7F018A25848743B3F87304A00F29255FC916AC8C8AEB135AADE586A14965D4E7AC9FEA8D20C0296369C0EE50F1A00BAE1B429CF0E447A8F304DDF71D0BCED9D11141F7C5F24CB9C0121AD66B8DDC714435383977B2F72F2132666D51B8F1AC5DDA55A7CD0F324C2DE93180C6EE721485B614CC2F0B4892167BF2143D33E49EA553B7F64C4069669B1F2152462D1EE4B218D8559FA96161B74BB59366888595432488B0FFA2969F1B4DD2CA77D3FD8C9B064A9F10B9EDCF012384C9821ECB56316C0B5EF61BBFD720F138A9E2061BA6416AFD7130577D3E4ED877BBF77D64EF881DB75645DFA1E9B8051F20D909EF242F64D545973B3277FBC048E0ADE306190D3ED2C62B66E85DB3982A5935DCF893426BDE010E985CFEB25C64334797B9FED8FBDFA9AAFA4DD91FECE1D12D08B2E8330CFBA115242CAB174F3AA5D9E5CF3123857D8F5374E005BB3219D5180FD7596B20C6CC7CE168640427301DD2212EDD0F42F88F4BD10DA662DD9524BD51F2A57714EDDB8656EF25886EBF2097AF1F0D3E7A39997D2D4DA855EFFB77E2140D4F086D125765B6B53AA9B207BA3C587402B18BA0E2DA8F273562CA73FE476BE42D31A5AC9486C5009CBD2DA8301A8F67B502F2F401AF442FA3189F48716845ED4A2C7872C3066EDBA369BBB2EF255501FD875631E96C9C6DF820493302C22E32B68C6FBA4C51FD76F7DCDD359B03C79F2E4C993274F9E3C79F2E439C9FF000B274A8A1999CC530000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        6,
                        'Triceps',
                        'Трицепсы',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA79300000D7749444154789CED9D7B705C551DC7BFBF731F9BDD6C92A6297D614BB1C028CA1474148AB606D20407850A4A28FFF8181FA828E263609CC10145FD43745404C78A02E38B6E4B5B8AD80734B68E4F84716A0B0E564A690BC5264D9AEC6E76B3F7DC737EFEB14D9334BBD97BEFDEDD4DEA7E663AD33DF79CDFF9F5FCEE39F7FCCEF99D53A04E9D3A75EAD4A953A74E9D3AFF6F50AD152804EFB8A913427F168CF700B0001C067004840300EF01D11EC4F4F374F9866C8D552D9B696500DED9BD0A9AEE06F02E0FD91580FD00FE02700F84F17B5AF5E8B1CA6A183ED3C200BCF586B3608AFB00AC29470C80E7C1E88140823A137F0B49BD8A527303F0D36BDAC1FA37002D0859F43E10DD4A9DEB76872C3754442D2B575BAFF93A987756A0F101E02230F7F053DD5757407668D4A407F0AEF60695E4AD46C3DC2B40157F074EC03597D0D5BF4E56BAA22054BD07F0FAF6B81C48ED17F6AC6A343E00B4C2723F588D8A82505503F0FAB7B7B8C6E04BC28C2F22A3A19A355F54C5CA7C513503304348C17B5939F38C86B9D5AAF664E55852DD0ABD533503B89BDEF12776538B8DE8025469E819079D5BE50A3D53959670B72C5FABE5E0721216843DBB1A559E062DAA41A59EA8B801D4C6E537AB6CFFA7004044E6D4E0ED07008ED7A0524F54B43578F3954B954A3E0030409437804F1100AD07D31A103E5F862AD37689A26206608670DD137F62ED180020AC1690B0FC8890007F98BAD6DD4857AD4B40F10B65A8F3FB32CA56948A19C0DDFCCEC7B44ACF3F5591BFB75F82F826EA5AFFAB532991DE3F02DC1B40150D21BE1FA05C55A88801DCC757DEA8E5D075A3BF49D81056937701844F50E7FA8D1392AED8ED02E20EFFDA5082563DBAD77FB9EA10BA0178FBF2D95AF6FF02ACC72A89B4C1C7AAC75AEA4CFCA2D003EA5AF70888EF467EE5D30B07017CC56BC5B5207403B819F777AC1C7B2C854E1AC00BDC0BD7BC7DAA1CD4B9FEEB10B8144C5F00D00DE07900AF80E89B000E81F15F80EF8010CBC0F645D4B5EE68C07F4A55087531CE7D7CC58754EED806F0D80B2AEC1698F1A5DE04306EA7AB12F786A9D37427B41EC077B79B5A0E3E32BEF10140D85EDF7E48B0FE7958FACC144233805A36F21356238DE3D3485810568B5711BBE8BD1B06C2D267A6108A0178FB8A05DA19FAD824E1F66C80BC8E72F487307499698462007738B789D99D24CBD7DC9FF0CF30749969946D006773FBC55A0E5D3649B0D5043222DE05B1D85FAE2E3391F27B804EFF0AD093927DAFFBB872B06C5D66206519406E6A7F37CBE45B264B3521EC593EA5A5A7E59E6DA529CB00CCC9470A39A546640E7CBA1892AEDE962B4797994A6003C82D2B57B24C15F4B0BC7BBEA7180EAAC74C27B001D8CD3C5050A0D50C123E3EBE798682EA31D3096480DCE32B2E64997A6B4181FE375D00E0D52085CE04021940E8DCDA42339FFC9EAFDF8F2F00C22B41F43813F06D00DED9314FBBC982D1CB221278C3FDB9A005673ABE0DA052C3F741AB82531C61B506D382F433C10ACE7C7C1B40CBF4B585D2C9680099B1203A48C4B02748C133015F06905B2EFF12EB5CC1984261077CFB817F9C09275D82E2CB00EC8EDC5A54506003F0A68005CF084CAF19794BE742277BF89C42CFC8882160B0AD02F1BAA2756EEA68732DBA4D08EB7A90B9888419030941AC15B372583947C1CE2E57D3FD91D53DD376E37D2A3CAF17B89B2E7D48390393D6FC01C0882E80110D70C682F0387526AE3B3D596E59B9D230623F86D5F416F21849C7EEF07196C3F719AB77DDE35F91DAE1D90072E3257D5AA60B7A5956F39B827C8015485F429D1BF68D26F0F6150B5845B792D57AB15F61A764B8D99476935F34AFDDED7B7B93777DB401327B0D181F00E13200F3916FA35E309E03681B847A8C3A3784E6B97B32006FEA9AEBC843C7C6879A8C493060B72E0B52F737A82B71D7E80FF9DB55771956F3D748584610611361B04CED259DEDA06B761F2F99FBB94F59E84F7E0EC477009857227B06C04F20C477C23895E9C90072E3F26F6B79FCAB859EF98A7A38897606E1A60F62742555D8B361C6C30FE1679573B41CEA36AFDDB5A5689EED37BE0D061E04E36D3EC50F01B80B83FA7EEADEA082EAE86980653893C6E951C8682CF6A8205AA6E00EBF82B1656C82113BDB970CAF9011B18D86B6CDF2B7ED779EFE8CFF7243949FEAFE21049E0DD0F800D002E007982576F0CE9B4AF59AA2943400330454E6FC62CFC98C7AAE4CBB29B8E9039810356735F90DDAF589416664EE3DEA898E9F8DA6F0D337BE1969F10C40B7A2FC5DC10E28BD8777ACB93448E1924390FBC4BBBA55A63751ECB9D572A1A729A8764EC04D8F7FF3F318B137A05A479654AEFF4923326723C0F703F0D7754B330CC60D7455629B9F42A5ADAFD494270C4994702598A1B2AF176C7C001066D8ED501C23D2F67E95EB7F18E1373E003482F004EF58F3713F854A1A406B39F5F848C5272DAC3290C97F43655F47D1785A61174EAF142A032D2BB6FD6C82F8417EAAFBCB5E0B78E801724A0F8BB53B394D8DC04D1F841C7A11AC32538A2711C2ACD30764B7C04D1F04AB8A2D3F1140DFF59AB9E45204B333E55796E52060CD02B4032DD3D0F204D89DBAD1270AA0AA9ED717461C00C14DBD04B3F98220DBA7A1E2612D484FD94BDCE123008E045680B5E32F80AB5C8820EC16E85C3FDCE47F4E1AA1CAC3E0384A0E4104A380FB1B1ECC4E25C517C43819B5C1DA819B3A0070603FAA6C4A1BC06CAAE8752FEC543F208ECCF8A9A187551632F91F145C66A902250D60AAD86A1291914A29A0720328B4C15F6944C359A7FECE2A0337FD72D57500BCF480EEDD698AB45D0B32BC9ECBF2072BB8E9E0DF90A0189139133C702D935099EA47C77872C3ADD57F785AD86D77556ABAA29D7E68A7BF22B28B42024674E1842435D20B76AB1BA4E7791DC4BAEECFF71876EB439552C44D1F821AA9EE817611990D3226EE63E49DC62AEAE027B379FD331F170DB31FAB94322AF31ADCE143559C95108CD8443F53CB1458CB72057B1EAE038D29FADE5587A8DF5ECC4203B60B365DC05260CB05471C7034076E908008F6712561C3889D5D4EA4852FE4E0BE098D6E362E0E1A62390A5357C2D3CB1DC8000C10DFDB71947AA3F3A7CAC551073A9E05C733D02DC3F0EB52901183119D0761CDF271D6CC3F6EFA20B473E2D4EF1036883475253CADB1788E8A180F01CCE7F4BC417347AFE88B16894724503602231B01FA660182A19B86A1DB92D0B3529E4C9F9F1E1ECCC79C46DA2022732AE2B50AAB6982015857EFA842E0CD08EA86124B7AE6F29C116F17686882188AC37C7921AC17CE85E86FF63C52B29650D9FF420EBE0037FD32B43300F0E445C0A04C0A28D0657BE79E3F22A1F46BFDFD2BF7D3D158D15DB3627083845AD8E7B9474C8008C28CE7BD5AB311C28C0114A84383B5841CDC3721CD6EBDB89CCBA506A92BE1E90316DAC0AABF77E51E3A165BE6FDFB3F06C7B3500BFAA19B86CBD288440464E4FF404440C2CE3B5B648C395D45F62F9C817F4CF8ED75A7AF30FC3A75AD5F583A5FC89E95FEC1AA5D7434D20E0E2696A339A8B927A06727015119C77B0C3A690C2E38ED35E34B216CCFA7FC4FE765EA4A780A1509F5B61471DBCE2BF4399944D0C6A36C04E6A1F9B0F79E07F3D07C502A86A0C62C0DE7BF23457C0E76D3E588F65C38F4EB6A8C5B76ADC1E2DC9D6C96E14C290171BC05D6FE45B0F6BE11E6E1F910837140556FF74CE58E075F21257876A72B726316DDB2F35BB4D8B986A3B2EC654E724D88BE169807CE86BD6729AC7F2D8171781EC44033C8B17CF89C3E61051DFCECB8E73B8A824D1B3C409FE979921FE85AC283232FD26043A0931B05A44EF42DF249604B0211172C74DEFB3634409CFF6DEABC776E4B7083E3CB195423BD01EF3965CF3DA062060000BAE5A923BC1ECDFA70C7BF456F746945DE5646BE273856E9190531B8C101C7B3D0AD29E8A62CA6EA42EC66A09D810046A0C35E7356FC1655EA8632BED2739E5E92FD295BB5DBFA030070BE0789BE59304F7E5F8C63AD530E632AF39A7FA78FB5E7438755BBC6D6F86CCFCD74AEB34CCF1E29637A112E244D18AFCE85F5AF378232850303584BB8C39E5F680018C110F695CE7652073F92C3C2BD7FD55A71CCF8248D5835FF2F544E2118F282C3E0C6C2BBAF466C118C71DB9853F037EA4A2CF75CADD78C61627E6EE7CD34FFD5665E947DB6E6C3D2289A601E5C58340A47658E788BA863DAE1A7DA9ABF81FC9B8E79AA8F9F10C7AD7754B547981A3C67E4356EE49F8A98F54B58C3393D687F5A370CDDAEA3A9C2E31109584DE7838AC7B332585C48573DFAA257356A6E805178EDDB2D255BD78A34BAE944A411BA32AAB1ED0273E40BB4C05E4D6BB61D38FDB9BB65C5FB54F6D893C5BFCC0256F37920B3E085EC3BA82BF15E3FFA4C1B038C871F7CDF9B9533F23D4AD10A4A9A719265CE964D0DDDEC64A899B7D259EA63D4BD7BCA8980DC78F1712D878BDFB9430266E3B9A7AF1569085C46AB12CFFA516D5A1A603CCC20F5707BB770E8A3C8888B90A5364861430A41AE181BB385069B1AB0B486C92E226A0811BCC4166F13D991EFD297FEEA391AD7DD7CF97D2AD757E2BA7C82195F32B66D4AB8973A1353DEFA5B584A9D49F0D64B9B652A79A2D04D90A76334CC83115DF024ECBEEBF2178CFBA3A6FF91DB7485AE7E264956CB562F79593B7BD084EE208D0FD40D501433461F2161176D5461360E99D179B759D7FFFD9272EEBAA80F415320375F768FCE0DDC09124CC27288EC3E18E65E88E88FACD5BBB7D75ABF3A75EAD4A953A74E9D3A75EACC4CFE078284DDD241A9A4D00000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        7,
                        'Forearms',
                        'Предплечья',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA79300000C4549444154789CED9D79901C551DC7BFBFF7BA7B6676F64C488CA50211F9C303C59252080489728410722C35C9122E31252085685165A494230256298547A0A4A206280103265420248464574880644322580A0A122B1CA1C8B5C9267BCCECCC74BFF7F38FD99DDD99E9E9B93AC0ECCCE7AFEEF75EFF7EBDEF3BFDFA1DBF7E0BD4A953CBD0477D03D5063384B3EEF49B39695F094E9CC86C5BD09A48188A64F008C8DA6604CC2574D1D65DC5D8AB0B5002F69AB37EC26AE076B01D62D6002BF7822420CCE69D06DA2EA6F6CE835E36EB021401AF8A48B4D0BD80BA1E648CA66B1BEC44A193BDD0C9A339D791B06C61B4448CF6EEB5F96CD70528006FB83000A3790D80599EE574122AF60174F2486686102CAD898B8D79DD0FB95D277CBBD371083308B2F94114A87C002061C1689C0AA3712A4063AA556B5289DE15F69A33CF73BDCEB7BB1D8770E7C26B012C2FF93A270ABBFF7F00743A8D64306A064F9C4C17AF8B8D2D5B7F02F2C01B231300FA4539D7921186D1F45980467FDFACE261C73EB82ABB6C5D807C087105C013CBBEDC6C860C4EC948D34EDF2C5E75F6D48C72E53AA8012EABD4800C4D0189C0688256E498F16563CBD405708137471A017CAD724B0419CA7C0AD8899D3FF6BC2E801B367D053ED58D084C0048A6CF592502F6FAE917A4F3FD70320E995AB848B11084D99C996227AF1E39AE0BE0065373E142C5434638E35C6BFBB491E3BA006E08F82B80B03213B43D69D4551D17C8F1D75C5635B3937E24EA02B8A191F4D51EEBCC53E674BDD7057027EAA731564359293A3D44AE0BE08AF69CC32F15B607B35246A728EA02B841629F5FA658C5A19D1C01D26D525D0037A4F24D0035B40F0067A4911075013C5162B11F6674E270EE020D0040A4D732EB0264A1D6CD58026069A576B4DD0727F6BE7B268B7437D7702F519B386BCFB91C3278172A5CA8D2C95E3883EFE6CD2729E223C7F52760185E35FB53EC44970BA3D9ACC48EB6FBE10CBEE7ED8B64BA97551700A9B55F5BEEEB168109E1C2A5BD51B1BDC87EE9664324F78C1CD70500A09E3EEB4F5043C70BABB53243CC60152B5C4ED09BE9C3CA3C563F8927A67F59257ABE2B0265AF3E8E52E49B83B4F98F91E39A1780107B0A5A932F0280504C954A5B6C1D39AE6901D4DA33AF63A77F2A19E1CCB5DB0A20210BE4076C5AF0E23B23E7352D80B6A37701C859B1AA08F21600D2DA33F6B4660570D67EE372ED4427021FAE0042583B32CEFDF35C5D68DBBE0B004012241BFC339C35F79F03994F8E3DAD490178DDD927B38A9E0000C26CCC8860ABDC789E90750020C932D9FBF4D8A49A14C0B6E3B78FFC52FD7AF98EC09C7F359364C31E5AF09F8CD5B69A148074723438CA4F01587B364164586BB2D36A4E005E336DB27686D2510924FD132077E9710C2460B404EFCE4EAE39011CC277B2C2C67DB3AD9DFCD3104286F7D38C2DFB73D27DF35E2DB03D7DEC2915EAB79762DA430012A6EB674A352700B3FA7C464276CC4E25B6D5807B06492D1BC44FDDB26A4E006827335CD9A78F84D88982957B3891309A77D2CCEDBDAE79BE78AF26D80965261418381589FBDA2F00106035FC38DF7535250033885965FCCDAC7D88426476FD4C15008411DE675EBC65AB6B266A4C00AC3EA32DA79FAEED8ACDEA642F58E7697E28F873AF6B6B4B008473E609F2555CD13043C5737A97000021C307E425DBFFE075796D09D068C6B393BCBA8EC5A09387C12AE1924320B3E98642D7D7940034EBD94476B7533BE5C7E1B2B68723DF5C7C194DEF18F35E7AA2908D9A120000888C8C668855D47B06D30315DD03767B879000590D57E766E45273024018996D0E33B4DD5FB2199D380C6DF7B9BBB05A3799735E7AA1A8DB29D973B543C6A1EC249D385C92097606F3861D920C0E19C6E4F6626DD59400BC2132898C50CE1B53DB0345F78658C5610FBC9D77DA59584DD764EF07E1454D6CD6C1EB17B5C154B781702D80904EF4C289EDC9A844119808237C82B71D958033B0CBBDDD0720CCD6EDE6257F9F56CABD8DFBE05CEEEAB808AC1E0230FA656260024CA3014E740F78F8E3099D380C0E7E22EFF4343B83C3BF7CF79133C9D080614D39B7D4FB1BB74F406A972B792B886F854753AB9347A086F681551CC26C82D174726E99C4A1549BCFEE319F240C8D86895FB7666F7DB5D4FB1C974F006F9ED70A5B3E05F0370B9515561B84D5066DF743278F40278F40586DE97C157B1F2ADEE3618140E6C4256619959FBA7A9CC11B2313206427C0156EB6C170067617ECA20A6BC23366FB8ED9E57A195702F0FA456DB0542780D30A162E801ADA0B35E43EC73382B05AFE6DB6BF724A257EC64D13C49B238DB07517FCD86686758166071066F8A0F15AE3572B75352EC601BC2A2291148F56DEECA4D0765FC1002B6D04CEA3A55B2A5E4C181F4F408BB80F84B97E99D309D7D5C33432D0BAD298FBF26B7EF8AAFA27803775DC08C2F77DB3A7863C5FBC240C2593C1EBFCF257D54F0077767C1BE05FFB69D3EDC3EAB190D5FC24CDDB92FDE97BD954ED13C0CF769C08F0E3F0F147941A0BB8AFED020091A18DA0B8D62F7F40950AC06BE73441F27A00C7F96653DB9EDFF60200594DCFE40B2F2997AA1380972E1508051F05F045FF8C2A3803BBF3CEF30000492B6904E872DF7C0E53750260DA1BBF05688E7F06359CC1B73D3F2F25692549B6CEA6593B4A5FB9294055BD84B9ABE34E30DFE89B3D9D8433B03B6F543389E01019E1E70CA7E13A6A7FFE03BFFC66F8381646FD86972E1538E3CD3B40F8995F36B5DD0F157D2FFFDCBED5F6A2D9BEB3E0645EA5142D00AF8A4800A005ABCB5BC12E13EE8AB400E25130CA9EF0CAB0A76DA8A1BD9ECB90C26A7EDD98FFEAA9443EC52D7A509400BC393205B678018005A2DFC388AFA0194FE5EFAFF904772E8C00B807C0F1951BD350899ED4049BC7348330DB7618ED3BA77D18950F142B40D7C2ABC178704CD220080FC3D1F7D285ABDFF2FBA6B82B720A20968131A3625BDA4E4530247AF236372908D29AF8B0D1BEFDAA4A7D96427102742EB814A0956E59003682F8018077C130F6D18CC772A20E8A85375F7A1C92FAB6E1A9858A3A08EC0C42C57B86075605762F91A62303AD3F9473BAEFAFC467391427C0A68ECF8078378062F6D23900F02B60AC81C5AB68C6EA82C376DE74451822F923309600E5EF5ACB3A019DE84D05CBBA860BE64246F37F4DDD722E2D3836BD9C82FE8B2DC85D0BAF04E30194F6CB3C0AE0669CF7D73F12E5FE0CF9956B4CF41E5D0CE036803E5982DD511BDA4EFD17A3C491E2B68A198664204EB275A9D9BEF557E5F8F58B92BAA1FCB7C819D0E22F287D77F1E700BA92CE7F7C2F305CF1878F5E01A25BCAB00520158F9F8A4E1B40A126662C242C4798CD7F9676FFF5D9DFEC7E14943C0EE0AE480B58FC0EC055255E7F009A22103809CCB7807052A9BE815434B28AED07EBE29A9811485A49329BD61A1CBC86E66F39E63DB862297B20C61B3BA643F072005FF0F17EF2A2ED01A8D8FB60951361EE0141980D076034FCC698D37DCF87D5B52C858A46C2DC19391510DB00F8B8DB4526DAEE831ADA0F2E3A8C9C4032D447147A8E75F04E6BC1967F1EAB7BF383B2BB7ABCA96331C0CB702C2A9F1554A2173A71C8FBEBF36148580A32B49B84F5AC6189FB8BFD479A1F074A7F076CB8AC19A6733FB8F2FF3294635BC5A0E287A093BD05B77D2119EC27D9B08DA45C29E774AFFC38362FC5505A2FA8B3E334801F03F039BF6E80553C1D91E6D5BE9308D82483BB2003EB0CB365195DB4C13B68A74A286E20C620742DBC11C0DD00AC42E50BDA5343A96EA467A50B0819EC850CEE20693E64CCDDBABA52BF1F473C05E0EE4808837226A06F00E85B7E38B4FBDFCAFB422519489008BD0EC35C6D986AF9B15800F9B891F312E6EE480803742E882288621EC04D7E2D1BB8F566840CF741065F0259F799F35FECF4C55115911680372DFC1288EFC020CD0421F5397FF103CC82687B006A682F80D47F161566F811C90DF7D0FCE777FBE7A5FA187D02086B00CA0D8EF70176A2A9456F006435BF61CAE0E934775B9EAD456A8BB14D901F5BC7E690DA4D3CB54FA90C4E5A61CCEBFEDEB1F053AD8C464530EFF4DBB88A1F8033B01B44D29181498BEA959FCBD826683380997E186567084E6C0FD88982CCC6774D84CEA1F95BBD37D5AF514605D0BC02023F00E8D3E51A6395804E1C848AF78044202E02937E69CEEFF6DC2DA4D6C9E85FF2E64B8F83CD37017A3140938B33C1D0F60074BC07DAEE8330C24749363C22FF65DDE447FCFC78C7B5839F5A30E9BB00A039203E13A9A987F40898551CAC62363B315B3B8304123DA0C0CB84E07D667BFECD89EAE452FC54C4338B5A11E6D416833D4E3F2D58FD91AF26D5A953A7DAF93FB8F7BDB28B9F959A0000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        8,
                        'Abdominals',
                        'Брюшной пресс',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA7930000091E49444154789CED9D6B6C15C71580BFB3F75E3FB089CD3304886994144A0345454DD592A82D2960128950A21A9394A46A2B505A456A5AA955F3A722EA8FAAEA9F26125283942612026C6EA4A4808A78941085D0A640AA36AA124230E1D5F0286070C017DFBB7BFA636D1EF6EEDE9DF57D85BB9FE41FF6CC99993D67E6CCCE9C9935C4C4C4C4C4C4C4C4C4C4C4C4C4C4541352EE060C46DF686B246B7D0FE5BB08B381D1C32CF23CE801D47A1552EBA475EDE542B4B350548C0174DB13E321FB1384A741C714A99A4BA0AF904BFD5E1E5E77A2487518517603E8B6271A20FB0B447F09D497A8DA3ED03F22FA6B999FBE58A23A3D299B0174D52A8BFBDF5F8EC3EF102694A715720EF437A44EAF96B9BB73656941310BD7FD2B539CEBFE3A623D004C059D063A19A401682E76FD0628D00D7A19E404C841D439885A7BA83DF5B7621AA7E00AD08D6D35342596803E86C58328230B5D4789B984B00B740317F475599AEE2B64E1053380EE5F99E2C2C5A7507D16E48E42955B61FC17E1B78C6A7A51BEB2265B88020B6200DDD97E1F0E7F026614A2BCCF00EFA1CE0FA4357D60B80559C32D4077B43F89C35B548FF2016622D61EDDBE74F9700B1AD608D01DED4FA2BC4C010CF91945515921AD1D2F452D20B2017447DB03A8B51B48442DE3162187CA37A5B5636F14E14806D0BD6DF57C6AFD07B82B8AFC2DC8111A9D7B654EBAD754309AEBE8B19E2656FE8DDC454FE2A92882C6234037B6256896E3B7F0AB66544EB2777A8BAC5AE59808998F80E6C4B762E57B3289FB3FF886A9500417A40BCC65AA0475169A8A981B40996D2C5335C8974D25CC0D207CDE58A67A986A2A10E52D685404996AA1D954208A01464490A9168C777EA3B820E3C54615611C6F8E30096B594378154EB7A940041724B101FC31D64D941170DC58A67A30D68DB9012C79CF58A66A5063DD441901FF3696A916D4BC739A1BC049FCD358A66AB08C43941126E1DC27E632558265AE1B730324935F3596A91AE46BA612115C90F33363996A41C55837460119FD6BFBDDD81C3295AB221412D364C1FA436105CC4680CD4A62E50721A8FD4313015317B4CC307FF5213C66923DB401746BDB34A0C5B841D5C714DDD91E3A2E107E042412F1DB4F586CEE0B9B35BC014467466A4C3562A0ABF00650BD275263201351AE12B81A494A25B4AE0C26E1884751D47C8FBC72881AFB908961739ABC0545BD467426A25C0520D1DA2E1A5A572606688CD0141BD1C311E42A850F01A3936EFD848E0D9B18A02E42434EA1BC1B41AE429003C0A90882A175555C0328FBB1D8672C5729A8EC432275A02218405902741935C36237B6EE23DA302E370E9A3B80F286A15C17AA8F86CD1CDA00D2DAB9856E673AF00CE18E5FE4483A1DB2307D1EF87BD87A2A06E16D59983E8F65AD03C25C53ED037D01ADF992B46EDC1CB69AA4519BDC2B9ACFEBCEC737E3D87F001605645F2B73D3AEFF14790DD539792BF8380BC7B390D1A1692981E604DC9984313E9772CED9702C0B171DC87A945127D092727FF26D292AAF03C8BC0DA775FBB275A0DFF7CD2B6C41123F9579EBCD3C04112F68C8BCF55DB2A0F311944578BBA58B58D6B3D76BB1D2E4734347B370A8CF5BF9E02AF46C0EDECDC0098F0E793CEBA6FDCFF6563EB8657FD8E7E60DC646257DEDB794FD2BE09247BE2E541F91F99D8BA2281F8679B94E5A3BB790AABF17D1555C5FF13AC00A99B7E1F4B57CDF5E7F14D81658587EA55CA7CB23EF1103F9E3793DCA7669EDB876C444E6A64F21BA82EB9D2883CA73343A334CDC8D17462EC80B99FB4A06784E773EBE16B59FC7915DD2DA911E9A515F42E521DF82AEFAF45ACFBC1E83C9483E4F5ED121B71E65FEC68DBA6DD9242C7D30AABBF1ACAA10858441FFF2502DC9DB4EE17782F84006CEDBE10B9CDF70F3EF3B0C8E658E49C06CDF37C54B343A13A25CB88B42C9EEF7CAC35BAF02AFF966B83BC4C4388057ABC3CA4A7F5DFEA44BA57C28FD05EB0EDF94E604CCA80D77EB78AC87E71C17C29B5AC08C3A680AA8C452FF36168161CF0146343A6FF1A9D507D478A64F48BA863896857339B8A2D7A7BD84C00881F149F89C470F9E5103472D38D32F67F7FB790B576E74125A92501FD8E7FA488CD813FD01CD2979805DB7B7FF03C2478C4ACC3BB2A0D3F86CCF7028FD371EB49257C5FA4EA96B2CAD0B02408EB81FA8F2E1AC0D87FBE0B2827343BE3A8126CB5DC536FBF8F00B361CCBC125FBE6059D25D020EEE41B3457A855F2ADF3D21BC0724EA23E9EEF6C0EFE75D5DB3E19858C0D676C985E0B930635FD440E3EF09175147AD42D7B96C0381F035ACE4993472904A5774136677DD33ECE050E0EC04D3FECF1D5B0AEBE70B2470356CC4E40DB8A44E90D90B0FCD59409B96BEDB5920DBB12EE0DA84303DA56242AEB434B234BD09C91416B00BBE4FA2883019CF1BE4961B689C13B4F58B92901AB604D8C0B514A4129C76BE89DBE69A313F085DAFCCA1CEDD18B47E559420B6ED9A3021FD9BF6D45A21CAFA1C10F3939E92AE958D6DD9CCBF4AF861340ADC098A4F75ECECC5A7772BEE0B873898DDBBDEA2DB7BC961434E4E96F965305065026E7EDE10D96FBAA69428D98CB0C2668741689D2BB20A9E413D67946671128830B0A6100AFD8704ADCB7A49694FF42EA6CCE5D09F70C8A09878D052B53C23D42E12887019A02530762C383C9AA3B279CB7E18B353069D03C702207EFFB9CA51D88050BAE11FC90D27F8AA71CEB808381A96162C31F79E4F928C437B5F3C582354FDB8A40390CF072606A98D87A9FC782D5EF24443EB91BB1F2B4AD0894DE008DCE1A50FF0BCD238B18A2085C69EB2734382F16AF726F4A6E009993EE45E547F86D9D4D0C8CD7F61712B1F28901539EC88F4B190B1EA02C7B41D2DAB91558ED997847124614A159232C98E0B75AD6D532BFF3CF85AF343FE5DB8CEB769E01DD34E4EF024CCDF3BAE8D591930102024CAB71033343D05D74EBCF831B5B3CCA6600599AB6E9CD2C07DE1E92382E3934E07223B51E8AF4FADB00935330D6B3F7EFA537F39D42FF5B1213CABA1D2D8B37F570F5CA0260FB90C46935FE8770BD4E36F8B9ADB109B7ACA1B5BF496FEF4259BCA92774838B40D9E301B268F31552F58B819BCF585A02B3EAE0768F91E0B91BEAF128B7276196C7EEAAB085545DD9950F156000E83F5FDAED2C017DE1A68404EE2EE7CC3A37206F09345B4357C1E0BA99813CB759FD72B543FDBEB086514D8FF69F698D89898989898989898989898989892929FF07C6B59C3A6C49A0A50000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        9,
                        'Lats',
                        'Широчайшие мышцы спины',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA793000009CF49444154789CED9D6F8C5C5515C07FE7BD99CEFE6B77B7FF40D842512989458C082A1535356D178C0551DB228826040912BE1082217E304BFC4088DF0C1069148942BBEDF2415952A8A0D488F2053482A542E9D2D296DDA5C26E5BDAD99D3FEFF861DA6DBB7D3BF3EE7D77DEABF07EC9263B33EFDC73F69C7BCEBDEFDEFB662123232323232323232323232323E3A384A46DC074F4F9351D94BD1B51BE83702930376693EF83BE8C7A4F40FE71E9FDDD111776BAE28C09806EBD6921946F47B803745E93D41C027D944AFEE7F2F5C7F735498711A90740B7DED40EE5BB11FD31D09A90DA12E82F11FDA9AC1C389890CE50520B80F6F5797C69C7F708B81FE1EC74AC90F7407F467EF44159BEAD928A05CD6C5C5FBA35CF7BE35720DE95C012D08B407B40DA81AE66EB37408171D02320FB80FFA0FA06EABD4061E4C56606C7B90374CBD505FC39D701D7E3F13594D9AE7524CC21843F836E644C7F2F6B074A2E1B771600DDBC66169DFE6D48700FC8C75CB57B86F10EC27D74773E2C97AD2FBB68D04900F4B9759713F00870B18BF6CE78945720B8597A075E8EDB9417DB9667D77D9F80BFF251713E807009E2BDA05BD7DD18BFA918E8D6B53F40E4111C04F2FF1445E587D2DBFF6BDB06AC03A0CFAEB912F5B601BE6D1B1F122A78C15764C5C08B36C25601D0C1D56D14DAB6038B6DE43F840C916F5D2ACB1F9D3015B42B1D85D63B70E9FC32B0D3C9A4221A4325A8A8CB163F4EA5789B8DA0710074F31A1F953B6D94CDC8D100769760A7D3297638BB4AB0AB5CD3E912D5BBB4AFCFD89FE6193057963B5F3A281E73C6EE72AD77368B374B30742CD38E3ACD00407A58B6FDCBA652E6015059652CD388937BE35019869B70E73F5C81B74E2A73CE0300A87795A9884500B8D458A611273B4381D726E160D55DFBE355D83E79EA7B45C7250840F8ACA988CD207CA1854C7D0E4D734600FCAB042507BDB4ACF0CA642DB0F574BA6189A9807900846E63997A94357C409C0C6ABD364E0C14D85E82C990468E04B5D9975BBA4C056C4A509BB14C3DC6AA333BF9BF55D81F633CD85B860333C82B30EE7CAC315EF9B52941450B9999196F500ADE2841D1220D26B436EBA9C798F33264BCDF6C1300B75B78EF37186CAB0AAF5B4C4D774C42A371BC916E73C64D05D20DC091000E47E885072A306AE0ACD14AAD7C35E27060975D33A1E6BEB11803F46D6399991835A8C13B4BB5D9512314B33BEA118723B1E85E5311F30078F2AAB1CC4C9804A018D406D546EC299BF5EA11876548CD7D639301AF18CB847128800F0CD37F77B97E5DAF6A6D4DC9840F2296C12858744EF30004FE3F8D65C278DB22F54B5A7F99627FC56E6E6F634B1881FCC354C46210AE0C9BCB4C635261C4720EBEBB8EB3F6583A72A4EAE6AEDB33F78D790072B9CF1BCB4C675FC5FE0EB718D46EDEA63356ADCDFD6D0814F6B9C802F9A2A98445090AE2ED0594347ECA874D4987630EA67B2AF1B3C0629FC42800FAA7759F00569A2A39855D0E76A3C6439C1D77F5B4A2A72E57DBB14AFF7883D162A5590654B9953827298E04F08E8369DF9190598B8BE5E5BDE5B8FB0482566F3611302D41D71B5E7F82E32B938183C12EEC1C86383863A6C0BF27E2ADC00ADF35B93C7200F4E9351701E7191B749CB74AEE3659FC1067E7DC34CDC1C07E3655E37C7D6E5DE47D81E81990F3BE60650EC081EA89BD5817E4C302E0F09CF1CE12BC1B63A9BACAE5512F8D1E80403F6D65CC70055E8D99D6D3097376DE61FB00AF4EDADFAB48745F450F80279FB432E6B508CBC2A6CC0A0B80E3D39101B0C3F2848646F75574AB15BB23E72DE2FE8843474800DA9BF0AC47013BDB25BAAF4CBA8DDD59A0BC677C5CAF216D21D3A08E261C51CD89ADED917D651000E9B030A44281031672F5492C03BC51A2ED424C27F2DEB04100B4C5DC0E1DA1D5375E21AC8B006D2166B77BEE1FB86AF35E02468CE584C8BE322941E601107989D932682C578F362FDC6A8FF0C0C4618E0E229877206D460054AF03860C0DD9C659DE2005875DB3BB8EC9F53E33A520D0DDBA05E57943C921946F45BD38B2C5D2BB79908EE06254EE05A20C4E153CAF5FAE1A789F4EFFDDA87A1AD25DE796B7CBE140DCE98DC837368CE1798F43A4D95011957BC9B72E95DE4D4F455563D46564D940517AFBFBF0FCA508F59588FC56566C1C05A0439E36D15397AE3A26CF75980173FCA70064C5C651940D0DAE1EC4F32F96DEFE3ED38734AC2C96151B8664E5A6D5A85E4378593A88C84FA65ECD6BBF2F74FDC6945681963AED14BCFA9F47C507BAFDFBA75E6BFE1EE050C8954328AB65D5A66B64C506B3F27C8C585D6686B214A072CB54EF0764ED63AF33C71B0D6FC580B9114A4C946B1A31C71B91B5036F1E7F29573D368CCAAD9C98924E20DA675A6EC2889DB3A79525E12EE9ED7FE2B40B5BBCFEB8BA5810C1B90B1D2C8BB6C9C6E96F496FFF26E06E84A7F0FCA5B272F3BD36CF849DD66EDC06A2A20FDDD0CDDE43EF51B1D4E9035F6D6FFC4C6615F8CBD1DA11152B3DA29C377B9EDCBE61CCAE0133127BBE576EDF304697FF867503F372D11E88F5817931CAD03C6F4752CE87A41FB0EEF41FB4965D68E054936BA733471EB0173627D9005CE2FF8AD9625E1B7C60BE416D9F9F03CFA2D2CDF694255DBF3117B427D100C8B28122E7E4F6180B9E9533DB70C903675964414F6EC8C5C06A42F2DFF1706E7E8BF15CBDC76266632AD322704EEE197345F1483E00BEEC629141776EF7A0D3A23777F935D9A89C9707F1EC270996241F0095FDF4E4A26FA22F8A31AF8F9A0579A0270F5EB0DF5E991D297CCD8C1C2027B0384216143C3837C66EFBB97922ADC45E30AB36D0074DD83C6A400A1970EC0E6971BEB6B6538F0B72F12CF4691CE8568FA992A85E131E9FAF4F7A5FB424C085B366FEBC45E2F5FEE3F4E4EA2FD02DC99FF082574DDC1FC90740BC8553BF2FCCC1FC1906D825B3DC58E7095C5808FF6C817FEADA91FA0B1C683422F900782C9AFA5D80A585D37BE8D9B9DADCDF1567FBB59F9369919AEE535934FD8D6693C218109CFA47CE12B8B4E5C47EEE7C1F96D6294DB67CAA05161C0B6A9B079F6B3DFD88A3688F7BC5F571D8CDA222A7FF91ED1E5CD15A3B62DED684D30D501B903F5380A3F9DAC01BDEF512CF80140230C3096B0FB31B271BA4A18E8F400942ED8FB8371D3D3F698D69DC887526AF332AE2F6AB782290C220CCEB89EB8C4EE2B6A5310D4D74BDDD90C46D4B3E00EDC1C3A0F11FF6768E0ED311AC4F5A6BE20190650345E016DC3E33131F911F1DB32D5152590B92559BB7803E9486EE197840566EFA431A8AD35B8C9BDB7527B03535FDC7517D86FCA8DB6F023620B500C865EBCB148B6B80BFA76503F0372626D6A6F50F7C20E5EFFD976B9F3CCCE4D195A0CFA6A07E1BC5E2D572ED938753D03D45EAFF7841560F1E25DF764DC3D3D66E1924DF9ABAF3E10C0800802C7F7482B1E09BA0BF68BE32D633B7F3DB491F3FC9C8C8C8C8C8C8C8C8C8C8C8C8C8C800F81FC3F8CDFF085B16EE0000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        10,
                        'Lowerback',
                        'Нижняя часть спины',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA793000009CF49444154789CED9D6F8C5C5515C07FE7BD99CEFE6B77B7FF40D842512989458C082A1535356D178C0551DB228826040912BE1082217E304BFC4088DF0C1069148942BBEDF2415952A8A0D488F2053482A542E9D2D296DDA5C26E5BDAD99D3FEFF861DA6DBB7D3BF3EE7D77DEABF07EC9263B33EFDC73F69C7BCEBDEFDEFB662123232323232323232323232323E3A384A46DC074F4F9351D94BD1B51BE83702930376693EF83BE8C7A4F40FE71E9FDDD111776BAE28C09806EBD6921946F47B803745E93D41C027D944AFEE7F2F5C7F735498711A90740B7DED40EE5BB11FD31D09A90DA12E82F11FDA9AC1C389890CE50520B80F6F5797C69C7F708B81FE1EC74AC90F7407F467EF44159BEAD928A05CD6C5C5FBA35CF7BE35720DE95C012D08B407B40DA81AE66EB37408171D02320FB80FFA0FA06EABD4061E4C56606C7B90374CBD505FC39D701D7E3F13594D9AE7524CC21843F836E644C7F2F6B074A2E1B771600DDBC66169DFE6D48700FC8C75CB57B86F10EC27D74773E2C97AD2FBB68D04900F4B9759713F00870B18BF6CE78945720B8597A075E8EDB9417DB9667D77D9F80BFF251713E807009E2BDA05BD7DD18BFA918E8D6B53F40E4111C04F2FF1445E587D2DBFF6BDB06AC03A0CFAEB912F5B601BE6D1B1F122A78C15764C5C08B36C25601D0C1D56D14DAB6038B6DE43F840C916F5D2ACB1F9D3015B42B1D85D63B70E9FC32B0D3C9A4221A4325A8A8CB163F4EA5789B8DA0710074F31A1F953B6D94CDC8D100769760A7D3297638BB4AB0AB5CD3E912D5BBB4AFCFD89FE6193057963B5F3A281E73C6EE72AD77368B374B30742CD38E3ACD00407A58B6FDCBA652E6015059652CD388937BE35019869B70E73F5C81B74E2A73CE0300A87795A9884500B8D458A611273B4381D726E160D55DFBE355D83E79EA7B45C7250840F8ACA988CD207CA1854C7D0E4D734600FCAB042507BDB4ACF0CA642DB0F574BA6189A9807900846E63997A94357C409C0C6ABD364E0C14D85E82C990468E04B5D9975BBA4C056C4A509BB14C3DC6AA333BF9BF55D81F633CD85B860333C82B30EE7CAC315EF9B52941450B9999196F500ADE2841D1220D26B436EBA9C798F33264BCDF6C1300B75B78EF37186CAB0AAF5B4C4D774C42A371BC916E73C64D05D20DC091000E47E885072A306AE0ACD14AAD7C35E27060975D33A1E6BEB11803F46D6399991835A8C13B4BB5D9512314B33BEA118723B1E85E5311F30078F2AAB1CC4C9804A018D406D546EC299BF5EA11876548CD7D639301AF18CB847128800F0CD37F77B97E5DAF6A6D4DC9840F2296C12858744EF30004FE3F8D65C278DB22F54B5A7F99627FC56E6E6F634B1881FCC354C46210AE0C9BCB4C635261C4720EBEBB8EB3F6583A72A4EAE6AEDB33F78D790072B9CF1BCB4C675FC5FE0EB718D46EDEA63356ADCDFD6D0814F6B9C802F9A2A98445090AE2ED0594347ECA874D4987630EA67B2AF1B3C0629FC42800FAA7759F00569A2A39855D0E76A3C6439C1D77F5B4A2A72E57DBB14AFF7883D162A5590654B9953827298E04F08E8369DF9190598B8BE5E5BDE5B8FB0482566F3611302D41D71B5E7F82E32B938183C12EEC1C86383863A6C0BF27E2ADC00ADF35B93C7200F4E9351701E7191B749CB74AEE3659FC1067E7DC34CDC1C07E3655E37C7D6E5DE47D81E81990F3BE60650EC081EA89BD5817E4C302E0F09CF1CE12BC1B63A9BACAE5512F8D1E80403F6D65CC70055E8D99D6D3097376DE61FB00AF4EDADFAB48745F450F80279FB432E6B508CBC2A6CC0A0B80E3D39101B0C3F2848646F75574AB15BB23E72DE2FE8843474800DA9BF0AC47013BDB25BAAF4CBA8DDD59A0BC677C5CAF216D21D3A08E261C51CD89ADED917D651000E9B030A44281031672F5492C03BC51A2ED424C27F2DEB04100B4C5DC0E1DA1D5375E21AC8B006D2166B77BEE1FB86AF35E02468CE584C8BE322941E601107989D932682C578F362FDC6A8FF0C0C4618E0E229877206D460054AF03860C0DD9C659DE2005875DB3BB8EC9F53E33A520D0DDBA05E57943C921946F45BD38B2C5D2BB79908EE06254EE05A20C4E153CAF5FAE1A789F4EFFDDA87A1AD25DE796B7CBE140DCE98DC837368CE1798F43A4D95011957BC9B72E95DE4D4F455563D46564D940517AFBFBF0FCA508F59588FC56566C1C05A0439E36D15397AE3A26CF75980173FCA70064C5C651940D0DAE1EC4F32F96DEFE3ED38734AC2C96151B8664E5A6D5A85E4378593A88C84FA65ECD6BBF2F74FDC6945681963AED14BCFA9F47C507BAFDFBA75E6BFE1EE050C8954328AB65D5A66B64C506B3F27C8C585D6686B214A072CB54EF0764ED63AF33C71B0D6FC580B9114A4C946B1A31C71B91B5036F1E7F29573D368CCAAD9C98924E20DA675A6EC2889DB3A79525E12EE9ED7FE2B40B5BBCFEB8BA5810C1B90B1D2C8BB6C9C6E96F496FFF26E06E84A7F0FCA5B272F3BD36CF849DD66EDC06A2A20FDDD0CDDE43EF51B1D4E9035F6D6FFC4C6615F8CBD1DA11152B3DA29C377B9EDCBE61CCAE0133127BBE576EDF304697FF867503F372D11E88F5817931CAD03C6F4752CE87A41FB0EEF41FB4965D68E054936BA733471EB0173627D9005CE2FF8AD9625E1B7C60BE416D9F9F03CFA2D2CDF694255DBF3117B427D100C8B28122E7E4F6180B9E9533DB70C903675964414F6EC8C5C06A42F2DFF1706E7E8BF15CBDC76266632AD322704EEE197345F1483E00BEEC629141776EF7A0D3A23777F935D9A89C9707F1EC270996241F0095FDF4E4A26FA22F8A31AF8F9A0579A0270F5EB0DF5E991D297CCD8C1C2027B0384216143C3837C66EFBB97922ADC45E30AB36D0074DD83C6A400A1970EC0E6971BEB6B6538F0B72F12CF4691CE8568FA992A85E131E9FAF4F7A5FB424C085B366FEBC45E2F5FEE3F4E4EA2FD02DC99FF082574DDC1FC90740BC8553BF2FCCC1FC1906D825B3DC58E7095C5808FF6C817FEADA91FA0B1C683422F900782C9AFA5D80A585D37BE8D9B9DADCDF1567FBB59F9369919AEE535934FD8D6693C218109CFA47CE12B8B4E5C47EEE7C1F96D6294DB67CAA05161C0B6A9B079F6B3DFD88A3688F7BC5F571D8CDA222A7FF91ED1E5CD15A3B62DED684D30D501B903F5380A3F9DAC01BDEF512CF80140230C3096B0FB31B271BA4A18E8F400942ED8FB8371D3D3F698D69DC887526AF332AE2F6AB782290C220CCEB89EB8C4EE2B6A5310D4D74BDDD90C46D4B3E00EDC1C3A0F11FF6768E0ED311AC4F5A6BE20190650345E016DC3E33131F911F1DB32D5152590B92559BB7803E9486EE197840566EFA431A8AD35B8C9BDB7527B03535FDC7517D86FCA8DB6F023620B500C865EBCB148B6B80BFA76503F0372626D6A6F50F7C20E5EFFD976B9F3CCCE4D195A0CFA6A07E1BC5E2D572ED938753D03D45EAFF7841560F1E25DF764DC3D3D66E1924DF9ABAF3E10C0800802C7F7482B1E09BA0BF68BE32D633B7F3DB491F3FC9C8C8C8C8C8C8C8C8C8C8C8C8C8C800F81FC3F8CDFF085B16EE0000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        11,
                        'Glutes',
                        'Ягодицы',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA7930000087249444154789CED9D5D6F14D719C77F67F6DD6FD82640B0EB84843649D55288B869D58BBA97552245ADEA2AA952291F201F229F27BDEA4D55A5A9E0A2AD1A02A1D006949660E2043004B0B1D7BBB33B33E7F4E21835ECECCEDB39336BC7F393D0E23933CF39E7F9CF79D9F3B65052525252525252525252525252525252725010B60CA93F2C2B5AC76C99DBDB74EF21DE386FC5778E0D230074EE40EF9135737B96DE239D574BD81300A0BD06FE8E55937B8AA0033B5F5A35695700146CAF82F4EC9ADD0B481FB6564149AB662D0B8076FEF62A2865DDF4D8500AB66F82EC5B376D5F00D0D590BB9E8BE9B1D05DCFAD6ACD470080EE3D5D67EE77820EB8F772339F9F004A41FBABDCCC1746FBAB5CABD3FC04005D6C7B9BB946912BFDCDDC7B75F90A00D0BD9B7B14B9D1C93FEDF90B10B8E0EFC3B6C0EFE8B4E74CFE02C0FEFC865C509AAD08A0DEFF413DF206AF6D239A628949736C9E1362A704B49A3391E1B267259A42894BF3CCCC948D68EC08209BA722C32D7F7D2F84B834F79CD336A2B1234010FCCE8A9DFD84A53C576D18C10D5EE3D671D89A808A84C35B7074132A8115F36327A8C0FD597838038103331D38D179CD8669E34905F5DE7295AAE3F178E2E980AA0FCFDD87D9DDC6ECF0ABA65115CBC3CBFAF3F114AC1D056FE05D9DE940206BE2BDF3BE4934E655D092F36EC8F9007E156E2EC0EA02F815E3680A27A8C0DA31F87C21EC7CD0A57DD179D7341A7301B6C46F22C337A6E0FA09D8DC470DF1A6846B27E0C1A1E8FBB659318DCA5C809E38197B8F57818B5D58DB071335B73D9D562F41A9F59CF8BCC7602E80DF4CD68E28E0B33E5CEBEBFFEF3514F05F2F5DFAFA2DE336D4BC17E43B2D4851BDDCF6A023E174036A09D2EFDE076F07EAD3509D864A23FA7EE9E911CCFE365427A079383E0E4FC1951E6CA4ECB5F96248E3970E730124E9BF926F04F0B10B671BD0882984CDA3E07F01EDDDC970A70EB529A84DEB4FD0C306DEB6FE7C326DD8984FE6FC9E82CB2E6C6768A35486BC0F602E4040B62ECE8E840B2E9C6DC2448C08934B10F4F49B2DFB7AA02C6AB0AC3201534BF169E82AB8D4D59F59089471F7CEBC0D9032BB0D57C1C5046F9F7060FA05706AF1369D1ACCBC486CD6B6257C6CE07C00A98CFD67612842983544BD5D11E2BAA94E0D269F8BB737B9142FD4A6D471F64C7B038679C75000756EB96AA547E3EFD6C35B318D607D06EA7311E173508FE9BBB7A58ECBB79070A550EFAF1855438625E048D3DA84B5AFE0724FB70D514C2EE82A6910E1E8B02876245CB2E47C1D291C6A364D2C9809D06F2A8BEB7BA1AFB483BA11223875A8CF86AFD76775D8285C059FB83A0E6B2898768DBEE29B0950AF04D6976C3C6913DC08BB8DF964D7D2D8CC820236DB6314E0EB1D69A11D0AE32AB8DC85512317D556F85A65C835D0363EE94697AACC0838BA3446018E7C2D91398D2BB4155C75870F0B88215F5F9C21D714F06F57DBCA03A5E0E6C61805583E1FD86C02423C0AE03F060B623FEBC3839C2785567E3F46013E583991FBC0DA9A07EB19E63CD603F832E7D15705FCE9CDE74D4C187643C5CFCD9E4FC8B504DDD36FD25570BDA095185565E403330184538C0001F069C26162856E3BACF5F563E31BA300A89F993D9F82C741B2099D2F3CD82A74F66DD9E4E1CC02A8BFFCF67920C190A3456EF4A3FBF2AE82CFEDEF62896149FD7925C120D570B297005FFE38F3B35991C06A84836F7AA9E686EC2132FB22BB0042FD24F3B326DC09A037C4CB3D09778D568864478ACCBE306803B2476A8454707748DFFE4E406E5F0AE310142B80FAE32F1AA0ACAC8DCCC4FD21023C18D3DBAF79559D7B27D3A868B6125039741688991DCF91CE100176C6BAD4A24EB09369E95F3601841C4FF5F38461BD516FCC6B5DA493C92759DB80E27B407B9F4C3E2905B0C74FB33C945A00756EE55910DFC912D9B79C05F5E15BA9CFEB495F0282EA99A72DE4391EBDC719CCBA0ACE0CBD2F82F402C881EE67652F2EF42C88CA80028AD45DF32C6DC0800007B8040C4EC229518400EAE962D62A66ABF19E647049A520DF2A48FD7DA5057CEFE9441CE01210CEFB4BBB3E4A4CBAD7B7CDCB0C16BCE9035C02A6438BE2AA6C392FA53191CE7B42848D1FB6B3D1725F3237C47D0E390AA09C9743D7260424DC24F3ADA229607288FB940AFB2882B4F5C7707517122C1BB74D75729DDADC69C4EC192A13F91D69358AC5117916435ED208EC08B0542DEADC95FF539D7C5DFCFAA3ABE2CD0B57684CBE5E68DC02581C59F5E65805A1861BAF0B5828B02DA848C42FFF7AE9C99FE28DBF5DC429702E72B10A8D51D56E4E55903AF7D633C09065C9BB7CB75E5C5BD0F2C31302ADA09873111A8ECEEB680EEDFA2A11C94B80AFA25740D4049C6A165315CD77C387F9CCEFE47F646F45C08F12ECEEF4FCC4839569DC15B3FB019875E09497EF211DAD1E1CDBB915BAFE6CE716AD1C57C35503F8615FE7311611EFAB5D920B20594C745FE31E7C7F0DE6DA56F76E00DAF9276F83E3DC088539CE0D4EDEC6BA08029D9757D6A091F0305A91D057A4D9A62A54BC516F4B1F7657075EB8036E1D36A6A1DD02B701BE032AA52A8ED44E9DDF86671E8350A0F857387D5CA5EEFF8A57D6F4190F8FA6A1DB80B49B388582AA84660FA6BA30B70DCDDDB548BEA7F3588B3E200CE9E420000954ED3D7CFAEF661F8E3F1C7EAF094A7E14BA26830B8076E0914DFD2F0FDC87F1022479597749F37A1C8F0C5512FA5B29CC19D0EB5E095D73DD7F1612777F2BC9116C39B4014A44EC0F05FC763167C30911F0F6F57065FCF6F5758428A02B2A755EA319DD5D1F20B90042451F4CE115F4C30DA2B1214478A1BA10284463A39034C4E735F1211E69AAA0C9C8D0A09BC2940195EADAC830A76AF7E72D46119FD7685F7D83340244AB1A14B42345D43E1D19568908B3497C5EC750028AFBD9927F8C4E8313EE1DE5818A5D873A861250D4E1AC427D3832CC093E28240D32B6AD4F2C4049494949494949494949494949494949C9C1E17F8474B9BA65A3DA320000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        12,
                        'Quards',
                        'Квадрицепсы',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA79300000B2D49444154789CED9DDB6F1DC519C07FB3BBE7663B4E6C4262120209978442240A3C505455D4E212A84AD597945255559FDBE7BEF3A754424D8942AB525AAE85505AD252B5A8158296022184102057C73E3E3E97DD9D3EAC8DCF39BBB397D99993B89C9F64C9DE9DFDE69BFDE6FB66E6DBD9358C193366CC983163C67C1911A3AE50BEF8A83421A77BE1CD81BFABB3779A108B78F0F048EF8933CACACC32F2BE63858D6B00D16700B1719BB171351FF0808DEB0DDEE55620132991418BD05F46062D64D081B007047D65027A0B6F815345383584DBC0A94C21BC09AE74E35CB10690C10A61F72241FB2CC820BB7CD883B0876419806005102E4E7506B77615C29BB4ACB11E1B380415405CB95E70C57A80701BB88D066E634714827ACDD510D485B01BF578D666B40EC2F1C0A920DC7A1482BC49843B7145DF7C18718094BFBEF701E8BCC8E4AED23397A0758AA07D0600B7BE0D77E2DA92CA85D03A055E6D5E3CF2EAABE584E567B42148B67F42E7025C7A17FC762951C2AD27FEAE45D08E746A9F876EE7A7E5841563C406E87E03881ABCB8DA605DDCDA17BF9632C05A8708563B84ECDCAB2FAC382333807CFE9E597AADABD60F84B07C129A1FB11ECBF3239CBE9BEED4D405950A8551DDCD8FA2DFD7E8B5AE962FDDBFB9B8403D46E7012BCE8F126F74E7025C7A3FD754B31FE154067E0A210358FC20AA3B4608CBED1F1613A8CFE80C20FDEF28CFF94D583A41514F10DE14C29B2AA88784C5E3519D2A02FFBBC584EA333A0384DDDB52CFF716A1F55921914E651AA7B2A9981E2B9FA6DF7C00D9DD5F4CA83EA33380DFDE9A5966E573083BB9450A6F0A5199CEAF43D8819533D9E582EED5F985966324EB00F9C2C13DC0718216749BD0390F6137B9707D2B4CEEB2A348F3645477126E0D6AB3E06D02AF01A1BB473CFCE4093B8AAC33220F10F30807BC2998988399DB502EC63A17076725C608A1BB90A09A1BE9B2E55668CC416532D2CB93F3169488311A030827DE98FA56D87C0BB8D5C1E332805E468CD6A1BB149F69B935D8B22FD26518C9FF910190C98B1BB706D337C3F034B2B7645E85DEE2E0DF4E15A66F4A5B437CD3BC1271AC1B40BEFC83EB01755077AAB0E986C170D4BB645E917EA30A07A66F88EA56B34BBE74F03AF38A0C62DF03FCF06B9965BC0998BA9E2FE6044127FA3145D0EE9327606A37B88D1C178A6CDD4B62DF0042DE133BD696D0191A68AB5B60E29AF5BF87434619FA654DEE80EA50A621491F8050C47537CC08C68084462C84B090B0EA6D6C87FA6ABAC8E438D05D95559B85FAB6F8F94B215C4CD047B0B10D209F7DB806F2F6D889F33E5C52E47E26774553C1EE9299E9A80C23635636C1A422A42F06914E71EE90477F5C32D79D8E5D0F7037DF050C4E334209E782A8D72522606A0F385E76CA200FFE5234CBDAB45BFD746C2184B341A4DB205582E53BCA2BA1C6AE01441877E1B30174252C85EADC9B53814D7BCCAC07BACD4896503C7D9544BAF4249C4D1A071CAB61C8F618109F459C5A75F540C2724AF6D39B808A81B47C754B244B452B8C7401F8A49754C2EA4C68B406589170B12FF637339E01540C6C25C992B1D8D7EB2F04B01CF382AF9757428D3503C8A307E7400C3E293FD11D0C3B8B36723E0559EAD3410227635EB043FEE1B1EDB6AAB7E70181F7D581BFDB123E199A692C5D010618EE04A78348D77E6430D81683D833403834FDFCB01B1F7497029DC7C1E6581B80FB0965A4EB60B9F854DA1036C78075A5DB124E27CCB37B40E7325AA02DC14FA8FFB43FB8329662231A40AEBBED891EA8A2CD62B187F146518D412170A2AFC30836560892C70E36809B81A8279D4E9CDE455CCE81386D1676CAEF1F0BF6AEB6C938763CA0C93ED6F69D9EF0077692C7CB5EC610B494527728FB67441E8BCE5E1B2AD831801091B23D548B9B75AEC410B4C6C7BD68850CE0B0810C209D7D4074F3B3EE6F4746A98951D3233905DD4FC8FAE441CA7D36D4B0B53D7D2F92A807E5A11542D52D22FF3FE2C1C35FE93F205F7CF45D28D04BB356E16B7CECC3759575AF368CAD59D05ECEFAF1058D8AE2E3C0EF138EFDAE9084B43C543F2B219CF30161C5032C1940EEE5B302B13D9E7F4947C89712EA7CB9908C22757E1E007642907103C8A38F6D25640BE7AC19A04B58FB73EC6845BE4614D9F3D12C50E7191F0236CBA38F65EFEE2B88790FF0E52ECE06EB29DE3C14B9198237C48127966387E78F3481BFE596933704413491381F40CF2FF91A4E1C1B21680767121FEFA9E928520289883F2A4F49F2BD5AE42B1EC2A771C607E1EE2C765136E60D10B27320E79F97BC3D320CFFA13C2784FA5C3F2D8D69EFC500087714BF301DF30658F0F76B25D856F2F648477D935DE74DE5B97E5A1AE98FB684056E2D7E613AE60DB018A4BF07A0225FAF3C270E3CF9B1EAA4B8EFD047C0B94C292B9A0BBF255FAF6D299837402B651B621AF93C20BB874BFE995946C703009AF27ABD0BD5983740279CD1BA2E4FAF14FCCB48195D0F684BBDB6A560DE005DA997B6CDE301521ECF2E243ECC2CA2EB011DCDB6A560C100A46E3956D291D9893BC7CD7E6345905E26403FF9E74BBDB6A56063215628ABF60592EC1B13FAD96FF105F2D3D4F35DA9FF1CBA278D272F6DAC03F4DF3BCB9ABEBA4EF68E5DC74D2F537401D64F288DBF5367C1002594CCCA9E3A612C0511AFDF49DFCF5866134099CEA5C0BC01CA7C1EA69BD53B2713DEB21BA2E65D4C3D9F37453E22CC1BC091FA2D4C7F29A625E67F9EF98995D532EA72659EBEB9E677319937802BF4836CAA07C8A40F3BA8CAAABDA04C082AD33605163CA08492A937479C2AA084325D51D2038CEF20306F808A54BC029F83F46708FF2E20495DB6C8738A615CA1DF3605E60D50730A848A21D21E2308F14E01492906282065989AD06F9B02F306A88AD3DAD7A60E01617E0348F9B6F25CEE073F09D4D16F9B02F306A88B1CF91A05EAF020A9B8F91F375255970D4B4C936BDEFBFA172763DE0093CE1BDAD7AAC3C3FB62FE97D979FE55C48127CE20F920B98E121E50A66D0ACC1B605BF5051A9A62552148F297C2B21CFE5AA88E2CEA02B6575ED0BC5A8979035CF2DF638BA337D4A9D67082631AD25E2F54471633AECFB1BDC95E5502E30610DF3B1230E3E87DE848A98DFB4A714548DEA8A5DBE2CDEE87E2F1C737C0420C60BBF72C053F6408809B38409E140F1E7AAFA82871FFE1FF02F10599A331087B02AE7193B64396C68E015C5E61BB46EABC9278738AF7FE75E25E50D530C09C1BB5C90296B6A7CBD7B8B652DC5D27136E8E90CF69EB9174ED844693AFAD04F4BCF876480358318078E8C805A69DD7D959D00B66620FD37A20F5671EBDCAF3C060FA60A66093775660DA794D7CFB507A9A5B137B2FE949F9343755A3F8994B1301DB870D205F150F1CD1FE7C96F8D62F16813F0D1C9C73F38F039E809B2B20795A57872CEC19C015BFA12AE0F65ABE8F63EEF6A036A48E10CF18D0645046CD81DD3966088248F78A0019FED6801E89583380B8EFF007C03BCCBAB0BF9E5ED3AE0ADC98B0E1200C8BBD749184E3C68D786325AA53790DB0BF06B32EC05BE2C091ECAD2EBAEAD9120C80587D9365CE85BB1BB0CD8BDCDA11D1CA72CE833BEB704BE26E0F230D17F71F3A0EC49373B754E1AE7AA4437D55274F443ADEDD888E03C8C4B7718C61F75F9804F2391CF13300A69CC8A5F3F394313DA4780A21E3FB3A67DDB55EAE4684CF1BD32301CB1E502B90C11C22747E654C0F298EE85F5BFFBB313D12B06B806A5B3FF72B65F61694CB21CB30760D107837685FEB1AFC726D1959AE7FA3313D12B06B80302CF1FD65C5E78E472D2B90563F616CFB93650F97B8D664C34BC80ACBB421136BFF3F401E3BD8A0E99C07F4B77407A2F437FCE573DFDF8D2BCB4C67DB745A5789479E6995D143853D0F688A79CADC7C30330E949751A73A61ED5F5B590C41C280EB9A18078C8C25D6C290CD31E02103324C8C03E565087B06183366CC983163C68CF972F23F4C1DA917E9F8D8F80000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        13,
                        'Hamstrings',
                        'Бицепс бедра',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA79300000ADD49444154789CED9DDF8F245515C73FA7AABABAA777981F3BEC6F10DC417E4C02B8445F0445249AF086D15D777950C38B89847FC4C4C82B890FEA0B09465F50F0C71235901049106382B0CBC2C2F243D861777677BA7BFA47555D1F6EF74C577555775577DD1A7BED6F32D999AABAE79C7BBFF79C5BF7D6B97761861966986186196698E1FF1152B442F5CC1D0A80C5DBC1A916AD3E1E5E03AE9E05404E9D29B44DAC2295ED40C1E67908BCDD511F32C5D3B6A07645FD2E1100046DA87FB86BEAB751FB40DB02EC0609BB40405F25DB1BD0BE52BC09DBFAAFECAE7E76D3037A687CBC4B8AD5A06E297C48DC0502A295F45BD0DA28DC0C5A57B4EE7EECC230B0FB1E00D0BA54BCCEE667C5EB8C41F104C4F5B24EBD7033F01AC5EB8C41A104A8D38F1D65790DE66F017709A4A73E28D28CB04EB1B42DF3B7C0F21AEA8FC73F5FA4154E91CA50DEC3582E94F7EA1F021D8B9BEB859A01E84960651F949788F4C387819F176546B1214859F70FA82FEF85C53B0A3503D03ACB7B896982AF146946C104A86385EA1B0F85DA581801EAD9E336C29D630BE85CEB9BB10E41D0D6CF8E8F35F5EC717B12015950DC18B052BA09DF77C72E2F166CFC1BAC1294E6A17483FE17A05383CEA6FE37E8C0E26D9358EAB2CC11E0C22442D2A238023CB53AD1DAAB330F730760EB13685DD63F71983BA89F9D04BEAC521001C58D01121C9D5846F510D873C9F7ED39FDCCA4106B725B53A2C04158E5F37E5D3D3CE4DE915C54E4D25952A24002AC7C5AC75DD0F13F8AD20DE0C65C1F0B3284E57C51A407ECCB4D54E5C674D7C6468EB68E4091F380FDB9498A1B649DBC7A3F80E467EB081449407EBDCA8A7979B3727D75BF2E3DA0B04AE580EBCB03D49F4F1E03FE47522052A1AAFE74FC8B45282AC60394FA41217A7285F5C342B49856A01402EA3BA6F518C077B5ED6661DE035EFCDE97406E32AE277F1CD1B69B85790214DF32AEC31402F9A669150510A0BE615C873198B7DD2801EAF947CA20857E61CA19F7EB3A9883590F7017EE012A467598450567F16E930ACC12E0F365A3F28B8028A375304B8060FC2DC23CC4681D4C0FC266DC57F9E9AEE5A24BDD6346B0866902BE60446A6733DDB57C60A60E5D182340FDE5F84160D188F0B8BC4E73F9A58BEAF4A903A6849BF380966DAEF7C7F5F6F6B549D35192A13C635E608E008BD5D0DFED1C52D0830ED4B693153E84E03EFD83DE6A53FB403F3329A2E9F2CA9E28CF6518CC11A082707A42ED83C9C244D081CD777692B3947A5C4E9D7B5D4E9D7B1DA51ED7CFB461F3DDC9F69EB52EF593AC21EAE0F80287C31C0122E1B829E88A5D3B973D35BC7505AEBE05DE564FD8054EBD7D7AFBFEA9B74F83E856F31A70E54D5D260BBC86B6AD766170EF6880B131C0646256C4680BF075FCBE7A46E7F0B83780B307EC0A88A3B3DF44740FF65BE0D57438F09B11D1EA39919D9D062228F58C7A0E7842DFF6A0761EB62A505ED6DF90EDB2FE94A914A8403FE337C1AB437B13FC2D1211ED4C39C220016A7FB82B45B7266D41AD051F03971C087CB003B8E3025446E48006D67383EAE477887A22ACA3098DFFECFCDD74E1CCE7C0B7C052B05287C39F69BD21445D4019FB4469700C90489E48A4521D5B37C6FA1204DD7BBE051F8D4C2FF1F1DD9707AE7AE59780E1B3B18F6ED43A40EB5C5F82B3378317E98703ED6FEE7BB6C13120F20DB87F739E1278F788EE91515CDB03ED218EA93823DFFFD7C09EA6EEB5B389E5DA8E961DC55619DE3944B8D5231916C2907CC8C96072261C5EC6ED27E0F202D413164995C0C642B254E1B5213A93EF6D2C68D971A8CFC1A5FEBCA281E78CADE89A242062745795023E5D1A5E32AEA7EEE0F5C43B32E4DED51149191797FBE444738C94B16F02264350257A0180960BCD11F5A9552048324D258799A47B8140634414D92A6BDBA06FF3600F32851EA02204F42A95147A4265056A090D16F0517239157FAF56DD19E887A1A7D31A68962924202ABBE7D6A37A7F0F8D843A97DC4F12CB78A5F87B694887BE9782813447635B964C86A0F074B797CFD94E5997A4462B7BC9BBBACBADF829762325E9BDB7AF68EE69B42E39C21C0101E186EA7980574A573EA9D1160E254F593796E31B6A2BA5072411A0542D9D80EC301982C204F4B2973B2927DF9EB33369EA4168C9437F4D5C69931FBDD601C2D368DF4AAFB3F79C449F1763672914484037BE7652AA5440AB14BD9662C15FC2BDB5E9A63F05C5EB76126BC04BA7900021DC103D0292264371189C29A7F9E2127E264AE230049626CB1E28339521284240B7522A83CA76A421C41A7DA884C8A7A1BF5B19B7260736C8F5E001030438BAF7673914291ABB557066649980F033D185B691E5ADB81034951E10D9492D201967F4D14539E1ADD18582F0339D8CAFF02AE68D4989B12FFE06095083464BC645C581DE3B6C19A20B4B853D60D8CA6A1CE20888AB4B4E28D00348A8DC10445F432D2B79B16DBB8CFC33F47790D10382181B45193BD4CE2001124340C610D4BF2027568BE367DE1B59E6B1B3E7116BE734BE2889A3E0C7BC35296B0A3D40623C20C8F846D2DF7876E97CFF77E044B582C27277D21AFC8CBB8CE20888AB4B4E30999632D86BFC8C1E106A3C7B74F8E9C172FEB1FD7B9A55D07EC4CE9AFD292420AED7B4321ECC19FA8C19FC36753915FCA6CF8E6C68C4D8389521C88A21602BE3E988D23BD91005FE1F5297539D17E885ABAC04D4636C9498F12C27182460CF60AF89EB5D4365749F97CA2539F146EAC9909C78A38655BE1C929116CD60F014CD5265FA0890877ED1243A85AF676C0CA79B6562BBAF6636C02ABF1A9291168A6847A977EB6204A6F707ECACDDF8403B6308DA26407E9959B365FF4A971D63E34638545ECC2E203D8A23A01E643F1CDBED8058014B7BD20FC03D787FFF356205B8294E5A8CA2DE4F9A183D55D630016AA7F75C1EA327963DB0E7DE1FF611260972021F67EE7DCA63A4AB5FEBF780609A09E8EB3D6311D006ABFCFBB1D55BEEF394C74855DFE82740A6380449370429E0CA180774BB1E743A4F8DADDFB39E1ACB03DA0A1ADBF64EB107045DE3377CF0230380007795E1D090D5CA2A9B72F2B577C6552F275E394795E4DD7B071D6D83153359E87518B91EC680F548F8B1806315B8C981A3A5F8C992E3C15CE96F139B50715FC289094302AC96B40DF796076DD8B6594D790852C045AFFF1ADC5D8695EE3271D582859825E36A0BC4193FFCF460BB3FA3DA1ABCBE606BDD0037DA7077254CC2655F87CE609A439025EB5C0BA0D9177E6E73617F24EC1C8E0943F39E27DF7EE5C5494D90475F3ECDBC37E802519D076C58ED5BADF5940E9D3646FFAF13B30474643DD4FBF7D9704BCC72EF211BDC480CA85A6FE666C79C843F53BA123FF6DC5A82837DDEB8EE83D8531C82BCFAC5ED583A2F836EDE832DE1DE0750919FE66647D5F949E8EFDB4AF1D99E02AC55B4AD00977C686C4E7108BAE07C8D7A008EC0BD73C3535C8F38DA437AA8ED1BFBED67009B2BE7B77FDF67C3E121B94236DA5647F4ECFD3DEBABB9D91103B30434D59300DCE94275C4BAB000F75460A96B52C7CFEFD4C29EACC598C1360E55D13603747832373B6260968046F000079CE1EFFA516B8E5560AF0D4DEFC1DCEC687A0FB26CC37DE5F489E6871C38E0409D0772B32306E60EEB78FAD155DA6A81B58CDF811D81636558B257723366C95EE1BEB2969D0577B9D00E16D5D38FAE8E7E783C98F3802DF5046B63541AF4CCF4A8BBAC5E3879EBA466A8174EDECA51773976B63B0A2581B53234F9F1A47624C11C01FB9D23DB93AD7161F3F589ED9854C68A0D2BB6B1734FCD11B052BA7972212A8771200719FB9D292440B83D0729937B402E326417FEA7B919669861861966986186EB19FF0510E81C60DFC1DBD20000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        14,
                        'Calves',
                        'Икры',
                        'X'89504E470D0A1A0A0000000D49484452000000300000003008060000005702F98700000006624B474400FF00FF00FFA0BDA793000005CE494441546881ED99DB6F14551CC73F672E3BDBED6D5B8ADC049B1A2041313162D4C4687C418498684C0ABCF1609427A2AF3CF5055FF44F203E7109F449135F48442A21C42085DA50CBA5864B22BDB0B4A52DDDCBCC1C1FCE2C3BBBB3B39DB3C85BBF2F3B737EBFDFF7FCBE73F65C7E33B08A553C17846E803CB77F1EE8A86BF43D98FD0B60461CBCF55255DCE96D33400F5D6F8061C6D1CF8BDD67B23AF9183ACE2A13EEC6DAFC42D9E7EF3A56D5E6171B71DFD34D475F806024D6564E4EC8B1689C18ABF2D1E58E81BE00647C275E5980315EC71A8C40A139EE183421408CC69ACA4FD7F7A32380A70478A5E6B863D0C41CF06FC7DABCE0E91AF29F3AD609E5936F8E3B06FA028AF9A9589BB71CB03A519F1673BACA47973B06FA022ECAF798F4A2ED8F0A5094EABA65D68FF6B4A0820ABEF2ADC5A4A7B835D1CC327A84F13CE46575FB4409165BD475B1F7B5489CFBCAEB002CB528DF30F212C6F38A5B135A02E4B71F7703FB280163A1A738E7C31301736D01ABF74124D8F33E54BEED816F6890C60AA034ED0BFA783102B0ADF701B58DE63C987655FB8360F5996D03CF04DF7F3B122BE45B78A6F209C74CB98A4BC10CFA784102A451FD646F15C195301D3C4D2920D70ED2EB8BC67AAF2A5B707A99F6D553BF55B3B1D5F6B10234E7807CB3EA7659C27811FCD07CC87582EF6D8886BAEBC97556EE7D09370BD1B954DBC70AD01320D816697BE856DF2F3BF0D488FE8F97CC6E969DC6B1717D34809E0083F589FC726D4EA2B6E7E9E399BB0E7C6125F25B70A2BC0BE9647D25ED23809E004BD6FE61EB633915AD3396ED64B58799B08F007A023ABC0667E130EAE59AB076CA7A8D8EAB11E80958B3349BC8CFF2A3678D7A6DF5D0BD34A793929E80EEFC08AD0946D8B1A3A7CA74EACE8A711909DDC5EB3A29E90930CD53AC5B5CD9CF96BF44DBBC685B2DD62F82214FEAA4A42720357386CE6949BA11A394744DFE1C69CF4EFD84D160F4D240E78C4F69F1AC4E4A5A02C4DE3B056CE75F36CD571AB7D8B03555B9EF592AD07DE55224B8FBCA257A962A13746B4AC596B1691E2CFBA1E8BF9170A15068A2A8B787E89C8636A0D5806D29E8B5A1C7044BC286D929D14F64C28A7E3C36CC4D6149E5DB6BABD8564371754E8361FFA69B4E13028AC741C2CB39D89EAAAC8E7D29D8FC181C113F09537284CD8F952FA8D8ED29C58504DF3BFEE2058C8E0C61982E991C644385496B1EBA7200D76263A53142570E5A434B7DD6854C0E0CD365ECDA45DD74B40588017C4C472D9385D0B6500CE685DFE0DD8EE50F03500A2DF5855C40ECDC1603444BD115D0C46B1500E34F00DC854A93FB54FDA6DD7A6F2414A47DB7CA17A0142CCB86F9475399341384CF79A0FA1549F9DAB7EEC7C6B5D9F762E33C2E34934A9323600D01E087465CBA60D888CFAFC71E05C49ECB8F1116F8A13A40061CC2FCBD994CF48AFA010C39B8EB28A2388C9501421B93F4C14870E4B7D295A45520581910C56139B8EBA81CD0CB29B1B33CDBB7851D3B27709F1CC3CD6749AF8D3AD9EDC8730736C6729C3BB011AB2D6A48AF052F9FC57D728C1D3B27E4D9BE2D49F34AAE563A4378855E002C0752D9E87B7EA70BE050039643A46BAA4DC30CB882BDC12BF4229DA1A469690C97AC7CB0B03B4018E08492B13BC0740079B801C7610C07ECF64A536A8DE24A850A7E29EB0C6F7D241720ACCA1BE75447A5F33232EBCA57B19F5F40AA7231132A7BCB0F2115FAE863583792A6A53102E2C8B373839951BF564BC55CF96F5F8DA710576B7C2B1C654E0420BE499A556201A27FF43256DBF9951D65BC005FC4DBCAB03B7E15FDA39793E6A5B70FA4DBF763D81E7EA38F14C12E5D177EBC005902C3F6C8A40FEAA4A4570F7C7AE11156C7C9AA8DA8169E351C6B4BC92BB136BF0476FB09B1F7E28C4E4EFA3BF1A3E297082F6E92DD177B4E3C8C0B151F0D4E020FEA1AA51CC35DF84A371DFDD3E8D7574B88B62F404E478DF2C71509A4A8E733859DFD4CB71A8326CF42E293C19B78C63B204E0353C01C82EFE9CA7EB762F09A8E6348F90330074C21398527DE15BB4F697F1F5BC52AFE07FC070ED1FBEC90F303E70000000049454E44AE426082''
                    );


-- Table: programs
CREATE TABLE programs (
    id             INTEGER PRIMARY KEY AUTOINCREMENT
                           NOT NULL
                           UNIQUE,
    en_name        STRING,
    ru_name        STRING,
    en_description STRING,
    ru_description STRING
);


-- Table: user
CREATE TABLE user (
    id          INTEGER NOT NULL
                        PRIMARY KEY,
    birthday    DATE,
    sex         INTEGER,
    programs_id INTEGER
);

INSERT INTO user (
                     id,
                     birthday,
                     sex,
                     programs_id
                 )
                 VALUES (
                     1,
                     NULL,
                     NULL,
                     1
                 );


-- Table: workouts
CREATE TABLE workouts (
    id           INTEGER PRIMARY KEY
                         UNIQUE,
    ord          INTEGER DEFAULT (0) 
                         NOT NULL,
    days_id      INTEGER REFERENCES days (id),
    exercises_id INTEGER REFERENCES exercises (id),
    sets         INTEGER DEFAULT (3) 
                         NOT NULL,
    repeats      INTEGER DEFAULT (8) 
                         NOT NULL,
    rest         INTEGER DEFAULT (90) 
                         NOT NULL,
    weight       DOUBLE  NOT NULL
                         DEFAULT (10) 
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
