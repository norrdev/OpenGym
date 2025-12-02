import 'models/models.dart';

abstract class Repository {
  Future<void> init();

  void close();

  Stream<List<Muscle>> watchAllMuscles();

  Stream<List<Exercise>> findExercisesByMuscle(int id);

  Future<Exercise> findExerciseById(int id);

  Future<int> updateExercise(Exercise exe);

  Future<void> insertExercise(int muscleId, Exercise exercise);

  Future<void> deleteExercise(Exercise exercise);

  Stream<List<Program>> watchAllPrograms();

  Future<int> getCurrentProgramId();

  Future<Program> findProgram(int id);

  Future<void> setCurrentProgramId(int id);

  Future<void> insertProgram(Exercise program);

  Future<int> updateProgram(Program program);

  Stream<List<Day>> findDaysByProgram(int id);

  Future<void> reorderDays(List<Day> days);

  Future<void> reorderWorkouts(List<Workout> workouts);

  Future<void> insertDay(int programId, Day day);

  Future<void> updateDay(Day day);

  Stream<List<Workout>> findWorkoutByDay(int dayId);

  Future<void> updateWorkout(Workout workout);

  Future<void> deleteWorkout(Workout workout);

  Future<void> insertWorkout(int dayId, int exerciseId);

  Future<List<LogDay>> watchAllLogDays();

  Future<List<LogDay>> findMonthLogDaysBetweenDates(
      DateTime start, DateTime finish);

  Future<List<LogWorkout>> findLogWorkoutByDay(int logDayId);

  Stream<List<Equipment>> watchAllEquipment();

  Future<Equipment> findEquipmentById(int id);

  Stream<List<Load>> watchAllLoad();

  Future<Load> findLoadById(int id);

  Future<void> insertLog({
    required DateTime startTime,
    required DateTime finishTime,
    required int dayId,
    required List<WorkoutExercise> workoutExercises,
  });

  Future<String> backupDatabase();

  Future<void> importDataBase(String filePath);

  Future<bool> deleteDay(int id);

  Future<bool> deleteProgram(int id);
}
