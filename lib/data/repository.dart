import 'package:npng/data/models/models.dart';

abstract class Repository {
  Future<void> init();

  void close();

  Stream<List<Muscle>> watchAllMuscles();

  Stream<List<Exercise>> findExcersisesByMuscle(int id);

  Future<Exercise> findExerciseById(int id);

  Future<int> updateExercise(Exercise exe);
}
