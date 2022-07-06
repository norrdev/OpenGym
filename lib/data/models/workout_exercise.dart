import 'package:equatable/equatable.dart';
import 'package:npng/data/models/workout_set.dart';

class WorkoutExercise extends Equatable {
  int id = 0;
  String name = '';
  int maxSets = 0;
  int restTime = 0;
  List<WorkoutSet> sets = [];
  bool completed = false;

  @override
  List<Object?> get props => [
        id,
        name,
        maxSets,
        restTime,
        sets,
        completed,
      ];
}
