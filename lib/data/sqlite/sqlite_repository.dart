import 'dart:async';
import '../repository.dart';
import 'sqlite_helper.dart';
import '../models/models.dart';

class SqliteRepository extends Repository {
  final sqliteHelper = SqliteHelper.instance;

  @override
  Future<void> init() async {
    await sqliteHelper.database;
    return Future.value();
  }

  @override
  void close() {
    sqliteHelper.close();
  }

  @override
  Stream<List<Muscle>> watchAllMuscles() {
    return sqliteHelper.watchAllMuscles();
  }

  @override
  Stream<List<Exercise>> findExcersisesByMuscle(int id) {
    return sqliteHelper.findExcersisesByMuscle(id);
  }

  @override
  Future<Exercise> findExerciseById(int id) {
    return sqliteHelper.findExerciseById(id);
  }

  @override
  Future<int> updateExercise(Exercise exe) {
    return sqliteHelper.updateExercise(exe);
  }

  @override
  Future<void> insertExercise(int muscleId, Exercise exercise) {
    sqliteHelper.insertExercise(muscleId, exercise);
    return Future.value();
  }

  @override
  Future<void> deleteExercise(Exercise exercise) {
    sqliteHelper.deleteExercise(exercise);
    return Future.value();
  }

  @override
  Stream<List<Program>> watchAllPrograms() {
    return sqliteHelper.watchAllPrograms();
  }

  @override
  Future<int> getCurrentProgramId() {
    return sqliteHelper.getCurrentProgramId();
  }

  @override
  Future<void> setCurrentProgramId(int id) {
    sqliteHelper.setCurrentProgramId(id);
    return Future.value();
  }

  @override
  Future<Program> findProgram(int id) {
    return sqliteHelper.findProgram(id);
  }

  @override
  Future<void> insertProgram(Exercise program) {
    sqliteHelper.insertProgram(program);
    return Future.value();
  }

  @override
  Future<int> updateProgram(Program program) {
    return sqliteHelper.updateProgram(program);
  }

  @override
  Stream<List<Day>> findDaysByProgram(int id) {
    return sqliteHelper.findDaysByProgram(id);
  }

  @override
  Future<void> reorderDays(List<Day> days) {
    sqliteHelper.reorderDays(days);
    return Future.value();
  }

  @override
  Future<void> reorderWorkouts(List<Workout> workouts) {
    sqliteHelper.reorderWorkouts(workouts);
    return Future.value();
  }

  @override
  Future<void> insertDay(int programId, Day day) {
    sqliteHelper.insertDay(programId, day);
    return Future.value();
  }

  @override
  Future<int> updateDay(Day day) {
    return sqliteHelper.updateDay(day);
  }

  @override
  Stream<List<Workout>> findWorkoutByDay(int dayId) {
    return sqliteHelper.findWorkoutByDay(dayId);
  }

  @override
  Future<void> updateWorkout(Workout workout) {
    sqliteHelper.updateWorkout(workout);
    return Future.value();
  }

  @override
  Future<void> deleteWorkout(Workout workout) {
    sqliteHelper.deleteWorkout(workout);
    return Future.value();
  }

  @override
  Future<void> insertWorkout(int dayId, int exerciseId) {
    sqliteHelper.insertWorkout(dayId, exerciseId);
    return Future.value();
  }

  @override
  Future<List<LogDay>> watchAllLogDays() {
    return sqliteHelper.watchAllLogDays();
  }

  @override
  Future<List<LogDay>> findMounthLogDaysBetweenDates(
      DateTime start, DateTime finish) {
    return sqliteHelper.findMounthLogDaysBetweenDates(start, finish);
  }

  @override
  Future<List<LogWorkout>> findLogWorkoutByDay(int logDayId) {
    return sqliteHelper.findLogWorkoutByDay(logDayId);
  }

  @override
  Future<void> insertLog({
    required DateTime startTime,
    required DateTime finishTime,
    required int dayId,
    required List<WorkoutExercise> workoutExercises,
  }) {
    sqliteHelper.insertLog(
      startTime: startTime,
      finishTime: finishTime,
      dayId: dayId,
      exercises: workoutExercises,
    );
    return Future.value();
  }

  @override
  Future<String> backupDatabase() {
    return sqliteHelper.backupDatabase();
  }

  @override
  Future<void> importDataBase(String filePath) {
    sqliteHelper.importDataBase(filePath);
    return Future.value();
  }

  @override
  Stream<List<Equipment>> watchAllEquipment() {
    return sqliteHelper.watchAllEquipment();
  }

  @override
  Stream<List<Load>> watchAllLoad() {
    return sqliteHelper.watchAllLoad();
  }

  @override
  Future<Load> findLoadById(int id) {
    return sqliteHelper.findLoadById(id);
  }

  @override
  Future<Equipment> findEquipmentById(int id) async {
    return sqliteHelper.findEquipmentById(id);
  }

  @override
  Future<bool> deleteDay(int id) {
    return sqliteHelper.deleteDay(id);
  }

  @override
  Future<bool> deleteProgram(int id) {
    return sqliteHelper.deleteProgram(id);
  }
}
