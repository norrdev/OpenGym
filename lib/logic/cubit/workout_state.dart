part of 'workout_cubit.dart';

class WorkoutState extends Equatable {
  /// Active workout flag.
  //TODO: make state
  bool active = false;

  /// Finished workout flag. Active != filished.
  //TODO: make state
  bool finished = false;

  /// Workout day from DB.days.
  int dayID = 0;

  /// Workout start time.
  DateTime? startTime;

  /// Workout end time.
  DateTime? finishTime;

  /// Exerscises from DB.
  List<WorkoutExercise> exercises = [];

  // Completion Log

  ///Current excersise counter
  int currentExcersise = 0;
  int get maxExcersise => exercises.length - 1;

  /// Current set counter
  int currentSet = 0;
  int get maxSet => exercises[currentExcersise].maxSets - 1;

  /// Current rest
  int get currentRest => exercises[currentExcersise].restTime;

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
        currentRest,
        maxExcersise,
        maxSet,
      ];
}
