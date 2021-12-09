import 'package:npng/data/models/models.dart';

abstract class Repository {
  Future<void> init();

  void close();

  Stream<List<Muscle>> watchAllMuscles();

  Stream<List<Exercise>> watchAllExcersisesByMuscle(int id);
}
