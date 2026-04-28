import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/models.dart';
import '../core/repository_provider.dart';
import 'workout_state.dart';

final workoutProvider = NotifierProvider<WorkoutNotifier, WorkoutState>(
  WorkoutNotifier.new,
);

class WorkoutNotifier extends Notifier<WorkoutState> {
  List<Workout> _workoutsSnapshot = [];

  @override
  WorkoutState build() {
    return WorkoutState(
      active: false,
      finished: false,
      dayId: 0,
      startTime: null,
      finishTime: null,
      exercises: const [],
      currentExcersise: 0,
      currentSet: 0,
      lastUpdate: DateTime.now(),
    );
  }

  set workoutsSnapshot(List<Workout> workoutsSnapshot) {
    _workoutsSnapshot = workoutsSnapshot;
    final exercises = <WorkoutExercise>[];

    for (final item in _workoutsSnapshot) {
      final sets = <WorkoutSet>[];
      final numberOfSets = item.sets ?? 1;
      for (int i = 0; i < numberOfSets; i++) {
        sets.add(
          WorkoutSet(
            repeats: item.repeats ?? 0,
            repeatsLeft: item.repeatsLeft ?? 0,
            weight: item.weight ?? 0,
            weightLeft: item.weightLeft ?? 0,
            rest: item.rest ?? 0,
            distance: item.distance ?? 0,
            timeLoad: item.timeLoad ?? 0,
          ),
        );
      }

      exercises.add(
        WorkoutExercise(
          id: item.exerciseId ?? 0,
          name: item.name ?? '',
          maxSets: numberOfSets,
          restTime: item.rest ?? 0,
          sets: sets,
          completed: false,
          limbs: item.limbs ?? 0,
          loadId: item.loadId ?? 0,
        ),
      );
    }

    state = state.copyWith(
      active: false,
      finished: false,
      dayId: 0,
      currentExcersise: 0,
      currentSet: 0,
      startTime: null,
      finishTime: null,
      exercises: exercises,
    );
  }

  void startWorkout(int dayId) {
    state = state.copyWith(
      active: true,
      dayId: dayId,
      startTime: DateTime.now(),
    );
  }

  Future<void> finishWorkout() async {
    final repository = ref.read(repositoryProvider);
    await repository.insertLog(
      startTime: state.startTime!,
      finishTime: DateTime.now(),
      dayId: state.dayId,
      workoutExercises: state.exercises,
    );
    state = state.copyWith(active: false, finished: true);
  }

  void _incCurrentExcersise() {
    if (state.currentExcersise < state.maxExcersise) {
      final exercises = [...state.exercises];
      exercises[state.currentExcersise] =
          exercises[state.currentExcersise].copyWith(completed: true);
      state = state.copyWith(
        currentSet: 0,
        currentExcersise: state.currentExcersise + 1,
        exercises: exercises,
      );
    } else {
      state = state.copyWith(
        finishTime: DateTime.now(),
        finished: true,
      );
    }
  }

  void incCurrentSet() {
    if (state.currentSet < state.maxSet) {
      state = state.copyWith(currentSet: state.currentSet + 1);
    } else {
      _incCurrentExcersise();
    }
  }

  void setRepeats({
    required int excersiseNumber,
    required int setNumber,
    required int repeats,
  }) {
    final newSet = state.exercises[excersiseNumber].sets[setNumber]
        .copyWith(repeats: repeats);
    _setSetsSettings(
      excersiseNumber: excersiseNumber,
      setNumber: setNumber,
      newSet: newSet,
    );
  }

  void setRepeatsLeft({
    required int excersiseNumber,
    required int setNumber,
    required int repeatsLeft,
  }) {
    final newSet = state.exercises[excersiseNumber].sets[setNumber]
        .copyWith(repeatsLeft: repeatsLeft);
    _setSetsSettings(
      excersiseNumber: excersiseNumber,
      setNumber: setNumber,
      newSet: newSet,
    );
  }

  void setWeight({
    required int excersiseNumber,
    required int setNumber,
    required double weight,
  }) {
    final newSet = state.exercises[excersiseNumber].sets[setNumber]
        .copyWith(weight: weight);
    _setSetsSettings(
      excersiseNumber: excersiseNumber,
      setNumber: setNumber,
      newSet: newSet,
    );
  }

  void setWeightLeft({
    required int excersiseNumber,
    required int setNumber,
    required double weightLeft,
  }) {
    final newSet = state.exercises[excersiseNumber].sets[setNumber]
        .copyWith(weightLeft: weightLeft);
    _setSetsSettings(
      excersiseNumber: excersiseNumber,
      setNumber: setNumber,
      newSet: newSet,
    );
  }

  void setTimeLoad({
    required int excersiseNumber,
    required int setNumber,
    required int timeLoad,
  }) {
    final newSet = state.exercises[excersiseNumber].sets[setNumber]
        .copyWith(timeLoad: timeLoad);
    _setSetsSettings(
      excersiseNumber: excersiseNumber,
      setNumber: setNumber,
      newSet: newSet,
    );
  }

  void setDistance({
    required int excersiseNumber,
    required int setNumber,
    required double distance,
  }) {
    final newSet = state.exercises[excersiseNumber].sets[setNumber]
        .copyWith(distance: distance);
    _setSetsSettings(
      excersiseNumber: excersiseNumber,
      setNumber: setNumber,
      newSet: newSet,
    );
  }

  void setRestForSet({
    required int excersiseNumber,
    required int setNumber,
    required int rest,
  }) {
    final newSet =
        state.exercises[excersiseNumber].sets[setNumber].copyWith(rest: rest);
    _setSetsSettings(
      excersiseNumber: excersiseNumber,
      setNumber: setNumber,
      newSet: newSet,
    );
  }

  void _setSetsSettings({
    required int excersiseNumber,
    required int setNumber,
    required WorkoutSet newSet,
  }) {
    final newSets = [...state.exercises[excersiseNumber].sets];
    newSets[setNumber] = newSet;

    final newExercises = [...state.exercises];
    newExercises[excersiseNumber] =
        state.exercises[excersiseNumber].copyWith(sets: newSets);

    state = state.copyWith(exercises: newExercises);
  }

  void manualAddOneSet() {
    final newSets = [...state.exercises[state.currentExcersise].sets];
    newSets.add(
      state.exercises[state.currentExcersise]
          .sets[state.exercises[state.currentExcersise].sets.length - 1],
    );

    final exercises = [...state.exercises];
    exercises[state.currentExcersise] =
        state.exercises[state.currentExcersise].copyWith(
      sets: newSets,
      maxSets: state.exercises[state.currentExcersise].maxSets + 1,
    );
    state = state.copyWith(exercises: exercises);
  }

  void manualRemoveOneSet() {
    final newSets = [...state.exercises[state.currentExcersise].sets];
    newSets.removeLast();

    final exercises = [...state.exercises];
    exercises[state.currentExcersise] =
        state.exercises[state.currentExcersise].copyWith(
      sets: newSets,
      maxSets: state.exercises[state.currentExcersise].maxSets - 1,
    );
    state = state.copyWith(exercises: exercises);
  }
}
