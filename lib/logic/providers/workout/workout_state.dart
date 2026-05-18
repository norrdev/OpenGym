import '../../../data/models/models.dart';

class WorkoutState {
  const WorkoutState({
    required this.active,
    required this.finished,
    required this.dayId,
    this.startTime,
    this.finishTime,
    required this.exercises,
    required this.currentExcersise,
    required this.currentSet,
    required this.lastUpdate,
  });

  final bool active;
  final bool finished;
  final int dayId;
  final DateTime? startTime;
  final DateTime? finishTime;
  final List<WorkoutExercise> exercises;
  final int currentExcersise;
  final int currentSet;
  final DateTime lastUpdate;

  int get currentRestTime => exercises[currentExcersise].restTime;
  int get currentSetRestTime =>
      exercises[currentExcersise].sets[currentSet].rest ?? 60;
  int get maxExcersise => exercises.length - 1;
  int get maxSet => exercises[currentExcersise].maxSets - 1;

  WorkoutState copyWith({
    bool? active,
    bool? finished,
    int? dayId,
    DateTime? startTime,
    DateTime? finishTime,
    List<WorkoutExercise>? exercises,
    int? currentExcersise,
    int? currentSet,
  }) {
    return WorkoutState(
      active: active ?? this.active,
      finished: finished ?? this.finished,
      dayId: dayId ?? this.dayId,
      startTime: startTime ?? this.startTime,
      finishTime: finishTime ?? this.finishTime,
      exercises: exercises ?? this.exercises,
      currentExcersise: currentExcersise ?? this.currentExcersise,
      currentSet: currentSet ?? this.currentSet,
      lastUpdate: DateTime.now(),
    );
  }
}
