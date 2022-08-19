import 'dart:async';
import 'package:npng/data/models/workout_exercise.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/data/sqlite/database_helper.dart';
import 'package:npng/data/models/models.dart';

class SqliteRepository extends Repository {
  final dbHelper = DatabaseHelper.instance;

  @override
  Future<void> init() async {
    await dbHelper.database;
    return Future.value();
  }

  @override
  void close() {
    dbHelper.close();
  }

  @override
  Stream<List<Muscle>> watchAllMuscles() {
    return dbHelper.watchAllMuscles();
  }

  @override
  Stream<List<Exercise>> findExcersisesByMuscle(int id) {
    return dbHelper.findExcersisesByMuscle(id);
  }

  @override
  Future<Exercise> findExerciseById(int id) {
    return dbHelper.findExerciseById(id);
  }

  @override
  Future<int> updateExercise(Exercise exe) {
    return dbHelper.updateExercise(exe);
  }

  @override
  Future<void> insertExercise(int muscleId, Exercise exercise) {
    dbHelper.insertExercise(muscleId, exercise);
    return Future.value();
  }

  @override
  Future<void> deleteExercise(Exercise exercise) {
    dbHelper.deleteExercise(exercise);
    return Future.value();
  }

  @override
  Stream<List<Program>> watchAllPrograms() {
    return dbHelper.watchAllPrograms();
  }

  @override
  Future<int> getCurrentProgram() {
    return dbHelper.getCurrentProgram();
  }

  @override
  Future<void> setCurrentProgram(int id) {
    dbHelper.setCurrentProgram(id);
    return Future.value();
  }

  @override
  Future<void> insertProgram(Exercise program) {
    dbHelper.insertProgram(program);
    return Future.value();
  }

  @override
  Future<int> updateProgram(Program program) {
    return dbHelper.updateProgram(program);
  }

  @override
  Stream<List<Day>> findDaysByProgram(int id) {
    return dbHelper.findDaysByProgram(id);
  }

  @override
  Future<void> reorderDays(List<Day> days) {
    dbHelper.reorderDays(days);
    return Future.value();
  }

  @override
  Future<void> reorderWorkouts(List<Workout> workouts) {
    dbHelper.reorderWorkouts(workouts);
    return Future.value();
  }

  @override
  Future<void> insertDay(int programId, Day day) {
    dbHelper.insertDay(programId, day);
    return Future.value();
  }

  @override
  Future<int> updateDay(Day day) {
    return dbHelper.updateDay(day);
  }

  @override
  Stream<List<Workout>> findWorkoutByDay(int dayId) {
    return dbHelper.findWorkoutByDay(dayId);
  }

  @override
  Future<void> updateWorkoutSetsRepeatsRest(Workout workout) {
    dbHelper.updateWorkoutSetsRepeatsRest(workout);
    return Future.value();
  }

  @override
  Future<void> deleteWorkout(Workout workout) {
    dbHelper.deleteWorkout(workout);
    return Future.value();
  }

  @override
  Future<void> insertWorkout(int dayId, int exerciseId) {
    dbHelper.insertWorkout(dayId, exerciseId);
    return Future.value();
  }

  @override
  Future<List<LogDay>> wathchAllLogDays() {
    return dbHelper.wathchAllLogDays();
  }

  @override
  Future<List<LogWorkout>> findLogWorkoutByDay(int logDayId) {
    return dbHelper.findLogWorkoutByDay(logDayId);
  }

  @override
  Future<void> insertLog({
    required DateTime startTime,
    required DateTime finishTime,
    required int dayId,
    required List<WorkoutExercise> exercises,
  }) {
    dbHelper.insertLog(
      startTime: startTime,
      finishTime: finishTime,
      dayId: dayId,
      exercises: exercises,
    );
    return Future.value();
  }

  @override
  Future<String> backupDatabase() {
    return dbHelper.backupDatabase();
  }

  @override
  Future<void> importDataBase(String filePath) {
    dbHelper.importDataBase(filePath);
    return Future.value();
  }

  @override
  Stream<List<Equipment>> watchAllEquipment() {
    return dbHelper.watchAllEquipment();
  }

  @override
  Stream<List<Load>> watchAllLoad() {
    return dbHelper.watchAllLoad();
  }
}
