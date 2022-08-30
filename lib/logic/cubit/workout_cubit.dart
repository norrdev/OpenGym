import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:provider/provider.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit()
      : super(WorkoutState(
          active: false,
          finished: false,
          dayId: 0,
          startTime: null,
          finishTime: null,
          exercises: const [],
          currentExcersise: 0,
          currentSet: 0,
          lastUpdate:
              DateTime.now(), //! TODO: remove this field, then fix the bug.
          //! Solution: convert from cubit into bloc, add events
        ));

  //Snapshot of workouts
  List<Workout> _workoutsSnapshot = [];

  List<Workout> get workoutsSnapshot => _workoutsSnapshot;

  set workoutsSnapshot(List<Workout> workoutsSnapshot) {
    _workoutsSnapshot = workoutsSnapshot;
    List<WorkoutExercise> exercises = [];
    for (Workout item in _workoutsSnapshot) {
      List<WorkoutSet> sets = [];
      int numberOfSets = item.sets ?? 1;

      for (int i = 0; i < (numberOfSets); i++) {
        WorkoutSet oneset = WorkoutSet(
          repeats: item.repeats ?? 0,
          repeatsLeft: item.repeatsLeft ?? 0,
          weight: item.weight ?? 0,
          weightLeft: item.weightLeft ?? 0,
          rest: item.rest ?? 0,
          distance: item.distance ?? 0,
          timeLoad: item.timeLoad ?? 0,
        );
        sets.add(oneset);
      }

      WorkoutExercise ex = WorkoutExercise(
        id: item.exerciseId ?? 0,
        name: item.name ?? '',
        maxSets: numberOfSets,
        restTime: item.rest ?? 0,
        sets: sets,
        completed: false,
        limbs: item.limbs ?? 0,
        loadId: item.loadId ?? 0,
      );
      exercises.add(ex);
    }
    emit(state.copyWith(
      active: false,
      finished: false,
      dayId: 0,
      currentExcersise: 0,
      currentSet: 0,
      startTime: null,
      finishTime: null,
      exercises: exercises,
    ));
  }

  void startWorkout(int dayId) {
    emit(state.copyWith(
      active: true,
      dayId: dayId,
      startTime: DateTime.now(),
    ));
  }

  void finishWorkout(BuildContext context) async {
    final repository = Provider.of<Repository>(context, listen: false);
    await repository.insertLog(
      startTime: state.startTime!,
      finishTime: DateTime.now(),
      dayId: state.dayId,
      workoutExercises: state.exercises,
    );
    emit(state.copyWith(active: false, finished: true));
  }

  /// Increment the current exercise.
  /// Called from incCurrentSet.
  void _incCurrentExcersise() {
    if (state.currentExcersise < state.maxExcersise) {
      List<WorkoutExercise> exercises = [...state.exercises];
      exercises[state.currentExcersise] =
          exercises[state.currentExcersise].copyWith(
        completed: true,
      );
      emit(state.copyWith(
        currentSet: 0,
        currentExcersise: state.currentExcersise + 1,
        exercises: exercises,
      ));
    } else {
      emit(
        state.copyWith(
          finishTime: DateTime.now(),
          finished: true,
        ),
      );
    }
  }

  /// Increment current set and if current set is last set of current exercise,
  /// increment current exercise by calling _incCurrentExcersise.
  void incCurrentSet() {
    if (state.currentSet < state.maxSet) {
      emit(state.copyWith(currentSet: state.currentSet + 1));
    } else {
      _incCurrentExcersise();
    }
  }

  void setRepeats(
      {required int excersiseNumber,
      required int setNumber,
      required int repeats}) {
    WorkoutSet newSet = state.exercises[excersiseNumber].sets[setNumber]
        .copyWith(repeats: repeats);

    _setSetsSettings(
        excersiseNumber: excersiseNumber, setNumber: setNumber, newSet: newSet);
  }

  void setRepeatsLeft(
      {required int excersiseNumber,
      required int setNumber,
      required int repeatsLeft}) {
    WorkoutSet newSet = state.exercises[excersiseNumber].sets[setNumber]
        .copyWith(repeatsLeft: repeatsLeft);

    _setSetsSettings(
        excersiseNumber: excersiseNumber, setNumber: setNumber, newSet: newSet);
  }

  void setWeight(
      {required int excersiseNumber,
      required int setNumber,
      required double weight}) {
    WorkoutSet newSet = state.exercises[excersiseNumber].sets[setNumber]
        .copyWith(weight: weight);

    _setSetsSettings(
        excersiseNumber: excersiseNumber, setNumber: setNumber, newSet: newSet);
  }

  void setWeightLeft(
      {required int excersiseNumber,
      required int setNumber,
      required double weightLeft}) {
    WorkoutSet newSet = state.exercises[excersiseNumber].sets[setNumber]
        .copyWith(weightLeft: weightLeft);

    _setSetsSettings(
        excersiseNumber: excersiseNumber, setNumber: setNumber, newSet: newSet);
  }

  void setTimeLoad(
      {required int excersiseNumber,
      required int setNumber,
      required int timeLoad}) {
    WorkoutSet newSet = state.exercises[excersiseNumber].sets[setNumber]
        .copyWith(timeLoad: timeLoad);

    _setSetsSettings(
        excersiseNumber: excersiseNumber, setNumber: setNumber, newSet: newSet);
  }

  void setDistance(
      {required int excersiseNumber,
      required int setNumber,
      required double distance}) {
    WorkoutSet newSet = state.exercises[excersiseNumber].sets[setNumber]
        .copyWith(distance: distance);

    _setSetsSettings(
        excersiseNumber: excersiseNumber, setNumber: setNumber, newSet: newSet);
  }

  /// Setting rest time for current set, not exercise!
  void setRestForSet(
      {required int excersiseNumber,
      required int setNumber,
      required int rest}) {
    WorkoutSet newSet =
        state.exercises[excersiseNumber].sets[setNumber].copyWith(rest: rest);

    _setSetsSettings(
        excersiseNumber: excersiseNumber, setNumber: setNumber, newSet: newSet);
  }

  void _setSetsSettings(
      {required int excersiseNumber,
      required int setNumber,
      required WorkoutSet newSet}) {
    List<WorkoutSet> newSets = [...state.exercises[excersiseNumber].sets];
    newSets[setNumber] = newSet;

    List<WorkoutExercise> newExercises = [...state.exercises];
    WorkoutExercise newCurentExercise =
        state.exercises[excersiseNumber].copyWith(sets: newSets);

    newExercises[excersiseNumber] = newCurentExercise;

    emit(state.copyWith(exercises: newExercises));
  }

  /// +1 set Button
  void manualAddOneSet() {
    List<WorkoutSet> newSets = [
      ...state.exercises[state.currentExcersise].sets
    ];

    newSets.add(state.exercises[state.currentExcersise]
        .sets[state.exercises[state.currentExcersise].sets.length - 1]);

    List<WorkoutExercise> exercises = [...state.exercises];

    WorkoutExercise newCurentExercise = state.exercises[state.currentExcersise]
        .copyWith(
            sets: newSets,
            maxSets: state.exercises[state.currentExcersise].maxSets + 1);

    exercises[state.currentExcersise] = newCurentExercise;

    emit(state.copyWith(exercises: exercises));
  }

  /// -1 set Button
  void manualRemoveOneSet() {
    List<WorkoutSet> newSets = [
      ...state.exercises[state.currentExcersise].sets
    ];

    newSets.removeLast();

    List<WorkoutExercise> exercises = [...state.exercises];

    WorkoutExercise newCurentExercise = state.exercises[state.currentExcersise]
        .copyWith(
            sets: newSets,
            maxSets: state.exercises[state.currentExcersise].maxSets - 1);

    exercises[state.currentExcersise] = newCurentExercise;

    emit(state.copyWith(exercises: exercises));
  }
}
