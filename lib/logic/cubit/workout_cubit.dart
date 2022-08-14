import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/models/workout_exercise.dart';
import 'package:npng/data/models/workout_set.dart';
import 'package:npng/data/repository.dart';
import 'package:provider/provider.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit()
      : super(WorkoutState(
          active: false,
          finished: false,
          dayID: 0,
          startTime: null,
          finishTime: null,
          exercises: const [],
          currentExcersise: 0,
          currentSet: 0,
          lastUpdate:
              DateTime.now(), //! TODO: remove this field, then fix the bug.
        ));

  //Snapshot of workouts
  List<Workout> _workoutsSnapshot = [];

  List<Workout> get workoutsSnapshot => _workoutsSnapshot;

  set workoutsSnapshot(List<Workout> workoutsSnapshot) {
    _workoutsSnapshot = workoutsSnapshot;
    List<WorkoutExercise> exercises = [];
    for (Workout item in _workoutsSnapshot) {
      List<WorkoutSet> sets = [];
      for (int i = 0; i < (item.sets as int); i++) {
        WorkoutSet oneset = WorkoutSet(
          repeats: item.repeats as int,
          weight: item.weight as double,
        );
        sets.add(oneset);
      }
      WorkoutExercise ex = WorkoutExercise(
        id: item.exercisesId as int,
        name: item.name as String,
        maxSets: item.sets as int,
        restTime: item.rest as int,
        sets: sets,
        completed: false,
      );
      exercises.add(ex);
    }
    emit(state.copyWith(
      active: false,
      finished: false,
      dayID: 0,
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
      dayID: dayId,
      startTime: DateTime.now(),
    ));
  }

  void finishWorkout(BuildContext context) async {
    final repository = Provider.of<Repository>(context, listen: false);
    await repository.insertLog(
      startTime: state.startTime!,
      finishTime: DateTime.now(),
      dayId: state.dayID,
      exercises: state.exercises,
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

  /// Increase repeats in set
  void incRepeats({required int excersiseNumber, required int setNumber}) {
    List<WorkoutExercise> exercises = [...state.exercises];

    exercises[excersiseNumber].sets[setNumber] = exercises[excersiseNumber]
        .sets[setNumber]
        .copyWith(
            repeats: exercises[excersiseNumber].sets[setNumber].repeats + 1);

    emit(state.copyWith(exercises: exercises));
  }

  /// Decrease repeats in set
  void decRepeats({required int excersiseNumber, required int setNumber}) {
    List<WorkoutExercise> exercises = [...state.exercises];
    if (exercises[excersiseNumber].sets[setNumber].repeats > 1) {
      exercises[excersiseNumber].sets[setNumber] = exercises[excersiseNumber]
          .sets[setNumber]
          .copyWith(
              repeats: exercises[excersiseNumber].sets[setNumber].repeats - 1);

      emit(state.copyWith(exercises: exercises));
    }
  }

  /// Increase weight in set by 0.25
  void incWeight025({required int excersiseNumber, required int setNumber}) {
    List<WorkoutExercise> exercises = [...state.exercises];
    exercises[excersiseNumber].sets[setNumber] = exercises[excersiseNumber]
        .sets[setNumber]
        .copyWith(
            weight: exercises[excersiseNumber].sets[setNumber].weight + 0.25);

    emit(state.copyWith(exercises: exercises));
  }

  /// Increase weight in set by 5
  void incWeight5({required int excersiseNumber, required int setNumber}) {
    List<WorkoutExercise> exercises = [...state.exercises];
    exercises[excersiseNumber].sets[setNumber] = exercises[excersiseNumber]
        .sets[setNumber]
        .copyWith(
            weight: exercises[excersiseNumber].sets[setNumber].weight + 5);

    emit(state.copyWith(exercises: exercises));
  }

  /// Decrease weight in set
  void decWeight025({required int excersiseNumber, required int setNumber}) {
    List<WorkoutExercise> exercises = [...state.exercises];
    if (exercises[excersiseNumber].sets[setNumber].weight > 0) {
      exercises[excersiseNumber].sets[setNumber] = exercises[excersiseNumber]
          .sets[setNumber]
          .copyWith(
              weight: exercises[excersiseNumber].sets[setNumber].weight - 0.25);

      emit(state.copyWith(exercises: exercises));
    }
  }

  ///Decrease weight in set in 5
  void decWeight5({required int excersiseNumber, required int setNumber}) {
    List<WorkoutExercise> exercises = [...state.exercises];
    if (exercises[excersiseNumber].sets[setNumber].weight > 5) {
      exercises[excersiseNumber].sets[setNumber] = exercises[excersiseNumber]
          .sets[setNumber]
          .copyWith(
              weight: exercises[excersiseNumber].sets[setNumber].weight - 5);

      emit(state.copyWith(exercises: exercises));
    }
  }

  /// +1 set Button
  void manualAddOneSet() {
    List<WorkoutExercise> exercises = [...state.exercises];
    exercises[state.currentExcersise].sets.add(exercises[state.currentExcersise]
        .sets[exercises[state.currentExcersise].sets.length - 1]);

    exercises[state.currentExcersise] =
        exercises[state.currentExcersise].copyWith(
      sets: exercises[state.currentExcersise].sets,
      maxSets: exercises[state.currentExcersise].maxSets + 1,
    );
    emit(state.copyWith(exercises: exercises));
  }

  /// -1 set Button
  void manualRemoveOneSet() {
    List<WorkoutExercise> exercises = [...state.exercises];
    if (exercises[state.currentExcersise].sets.length > state.currentSet + 1) {
      exercises[state.currentExcersise].sets.removeLast();

      exercises[state.currentExcersise] =
          exercises[state.currentExcersise].copyWith(
        sets: exercises[state.currentExcersise].sets,
        maxSets: exercises[state.currentExcersise].maxSets - 1,
      );
      emit(state.copyWith(exercises: exercises));
    }
  }
}
