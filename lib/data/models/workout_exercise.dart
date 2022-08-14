import 'package:equatable/equatable.dart';
import 'package:npng/data/models/workout_set.dart';

class WorkoutExercise extends Equatable {
  final int id;
  final String name;
  final int maxSets;
  final int restTime;
  final List<WorkoutSet> sets;
  final bool completed;

  const WorkoutExercise({
    required this.id,
    required this.name,
    required this.maxSets,
    required this.restTime,
    required this.sets,
    required this.completed,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        maxSets,
        restTime,
        sets,
        completed,
      ];

  WorkoutExercise copyWith({
    int? id,
    String? name,
    int? maxSets,
    int? restTime,
    List<WorkoutSet>? sets,
    bool? completed,
  }) {
    return WorkoutExercise(
      id: id ?? this.id,
      name: name ?? this.name,
      maxSets: maxSets ?? this.maxSets,
      restTime: restTime ?? this.restTime,
      sets: sets ?? this.sets,
      completed: completed ?? this.completed,
    );
  }
}
