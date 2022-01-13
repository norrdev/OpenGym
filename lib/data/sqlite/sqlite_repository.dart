import 'dart:async';
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
}
