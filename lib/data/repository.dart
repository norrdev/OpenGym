import 'package:npng/data/models/models.dart';

abstract class Repository {
  Stream<List<Muscle>> watchAllMuscles();

  Future<void> init();

  void close();
}
