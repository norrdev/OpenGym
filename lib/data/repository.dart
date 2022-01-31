import 'package:npng/data/models/models.dart';

abstract class Repository {
  Future<void> init();

  void close();

  Stream<List<Muscle>> watchAllMuscles();

  Stream<List<Exercise>> findExcersisesByMuscle(int id);

  Future<Exercise> findExerciseById(int id);

  Future<int> updateExercise(Exercise exe);

  Future<void> insertExercise(int muscleId, Exercise exercise);

  Future<void> deleteExercise(Exercise exercise);

  Stream<List<Program>> watchAllPrograms();

  Future<int> getCurrentProgram();

  Future<void> setCurrentProgram(int id);

  Future<void> insertProgram(Exercise program);

  Future<int> updateProgram(Program program);

  Stream<List<Day>> findDaysByProgram(int id);

  Future<void> reorderDays(List<Day> days);

  Future<void> reorderWorkouts(List<Workout> workouts);

  Future<void> insertDay(int programId, Day day);

  Future<void> updateDay(Day day);

  Stream<List<Workout>> findWorkoutByDay(int dayId);

  Future<void> updateWorkoutSetsRepeatsRest(Workout workout);
}
