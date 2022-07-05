import 'package:npng/data/models/workout_set.dart';

class WorkoutExercise {
  int id = 0;
  String name = '';
  int maxSets = 0;
  int restTime = 0;
  List<WorkoutSet> sets = [];
  bool completed = false;
}
