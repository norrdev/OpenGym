part of 'workout_cubit.dart';

class WorkoutState extends Equatable {
  /// Active workout flag.
  final bool active;

  /// Finished workout flag. Active != filished.
  final bool finished;

  /// Workout day from DB.days.
  final int dayID;

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

  //! TODO: unique field. Added to the state to re-rendering of the widget, cause of bug.
  //! I do not know, why states is not unique. May be exercises is unique for compare.
  final DateTime lastUpdate;

  /// Max exervise.
  int get maxExcersise => exercises.length - 1;

  /// Quantity of sets in current excersise
  int get maxSet => exercises[currentExcersise].maxSets - 1;

  /// Current rest
  int get currentRest => exercises[currentExcersise].restTime;

  const WorkoutState({
    required this.active,
    required this.finished,
    required this.dayID,
    this.startTime,
    this.finishTime,
    required this.exercises,
    required this.currentExcersise,
    required this.currentSet,
    required this.lastUpdate,
  });

  @override
  List<Object?> get props => [
        active,
        finished,
        dayID,
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
    int? dayID,
    DateTime? startTime,
    DateTime? finishTime,
    List<WorkoutExercise>? exercises,
    int? currentExcersise,
    int? currentSet,
    DateTime? lastUpdate,
  }) {
    return WorkoutState(
      active: active ?? this.active,
      finished: finished ?? this.finished,
      dayID: dayID ?? this.dayID,
      startTime: startTime ?? this.startTime,
      finishTime: finishTime ?? this.finishTime,
      exercises: exercises ?? this.exercises,
      currentExcersise: currentExcersise ?? this.currentExcersise,
      currentSet: currentSet ?? this.currentSet,
      lastUpdate: DateTime.now(), //! TODO: remove this field, then fix the bug.
      //lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }
}
