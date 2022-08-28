part of 'workout_cubit.dart';

class WorkoutState extends Equatable {
  /// Active workout flag.
  final bool active;

  /// Finished workout flag. Active != filished.
  final bool finished;

  /// Workout day from DB.days.
  final int dayId;

  /// Workout start time.
  final DateTime? startTime;

  /// Workout end time.
  final DateTime? finishTime;

  /// Exerscises from DB.
  final List<WorkoutExercise> exercises;

  ///Current excersise counter.
  final int currentExcersise;

  /// Current set counter.
  final int currentSet;

  /// Current rest time default for exercise
  int get currentRestTime => exercises[currentExcersise].restTime;

  int get currentSetRestTime =>
      exercises[currentExcersise].sets[currentSet].rest ?? 60;

  /// Max exervise.
  int get maxExcersise => exercises.length - 1;

  /// Quantity of sets in current excersise
  int get maxSet => exercises[currentExcersise].maxSets - 1;

  //! TODO: unique field. Added to the state to re-rendering of the widget, cause of bug.
  // I do not know, why states is not unique. May be exercises is unique for compare.
  final DateTime lastUpdate;

  const WorkoutState({
    required this.active,
    required this.finished,
    required this.dayId,
    this.startTime,
    this.finishTime,
    required this.exercises,
    required this.currentExcersise,
    required this.currentSet,
    required this.lastUpdate, //!  TODO: remove this field, then fix the bug.
  });

  @override
  List<Object?> get props => [
        active,
        finished,
        dayId,
        startTime,
        finishTime,
        exercises,
        currentExcersise,
        currentSet,
        lastUpdate, //! TODO: remove this field, then fix the bug.
        // WRN: DO NOT ADD GETTERS HERE
        // currentRest,
        // maxExcersise,
        // maxSet,
      ];

  WorkoutState copyWith({
    bool? active,
    bool? finished,
    int? dayId,
    DateTime? startTime,
    DateTime? finishTime,
    List<WorkoutExercise>? exercises,
    int? currentExcersise,
    int? currentSet,
    DateTime? lastUpdate, //! TODO: remove this field, then fix the bug.
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
      lastUpdate: DateTime.now(), //! TODO: remove this field, then fix the bug.
    );
  }
}
