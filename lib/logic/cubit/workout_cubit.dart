import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/models/workout_exercise.dart';
import 'package:npng/data/models/workout_set.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(WorkoutState());

  //Snapshot of workouts
  List<Workout> _workoutsSnapshot = [];

  List<Workout> get workoutsSnapshot => _workoutsSnapshot;

  set workoutsSnapshot(List<Workout> workoutsSnapshot) {
    _workoutsSnapshot = workoutsSnapshot;
    _resetAllData();
    _loadEx();
    emit(state);
  }

  /// Clear object.
  void _resetAllData() {
    state.active = false;
    state.finished = false;
    state.dayID = 0;
    state.currentExcersise = 0;
    state.currentSet = 0;
    state.startTime = null;
    state.finishTime = null;
    state.exercises.clear();
  }

  /// Load data from database
  void _loadEx() {
    for (Workout item in _workoutsSnapshot) {
      WorkoutExercise ex = WorkoutExercise();
      ex.id = item.exercisesId as int;
      ex.name = item.name as String;
      ex.maxSets = item.sets as int;
      ex.restTime = item.rest as int;
      for (int i = 0; i < (item.sets as int); i++) {
        WorkoutSet oneset = WorkoutSet();
        oneset.repeats = item.repeats as int;
        oneset.weight = item.weight as double;
        oneset.completed = false;
        ex.sets.add(oneset);
      }
      state.exercises.add(ex);
    }
  }

  void _incCurrentExcersise() {
    if (state.currentExcersise < state.maxExcersise) {
      state.currentSet = 0;
      state.exercises[state.currentExcersise].completed = true;
      state.currentExcersise++;
    } else {
      state.finishTime = DateTime.now();
      state.finished = true;
    }
  }

  void incCurrentSet() {
    if (state.currentSet < state.maxSet) {
      state.currentSet++;
    } else {
      _incCurrentExcersise();
    }
    emit(state);
  }

  /// Increase repeats in set
  void incRepeats({int? excersiseNumber, int? setNumber}) {
    state.exercises[excersiseNumber!].sets[setNumber!].repeats++;
    emit(state);
  }

  /// Decrease repeats in set
  void decRepeats({int? excersiseNumber, int? setNumber}) {
    if (state.exercises[excersiseNumber!].sets[setNumber!].repeats > 1) {
      state.exercises[excersiseNumber].sets[setNumber].repeats--;
      emit(state);
    }
  }

  /// Increase weight in set by 0.25
  void incWeight025({int? excersiseNumber, int? setNumber}) {
    state.exercises[excersiseNumber!].sets[setNumber!].weight =
        state.exercises[excersiseNumber].sets[setNumber].weight + 0.25;
    emit(state);
  }

  /// Increase weight in set by 0.5
  void incWeight5({int? excersiseNumber, int? setNumber}) {
    state.exercises[excersiseNumber!].sets[setNumber!].weight =
        state.exercises[excersiseNumber].sets[setNumber].weight + 5;
    emit(state);
  }

  /// Decrease weight in set
  void decWeight025({int? excersiseNumber, int? setNumber}) {
    if (state.exercises[excersiseNumber!].sets[setNumber!].weight > 0) {
      state.exercises[excersiseNumber].sets[setNumber].weight =
          state.exercises[excersiseNumber].sets[setNumber].weight - 0.25;
      emit(state);
    }
  }

  ///Decrease weight in set in 0.5
  void decWeight5({int? excersiseNumber, int? setNumber}) {
    if (state.exercises[excersiseNumber!].sets[setNumber!].weight > 5) {
      state.exercises[excersiseNumber].sets[setNumber].weight =
          state.exercises[excersiseNumber].sets[setNumber].weight - 5;
      emit(state);
    }
  }

  /// +1 set Button
  void manualAddOneSet() {
    state.exercises[state.currentExcersise].sets.add(state
        .exercises[state.currentExcersise]
        .sets[state.exercises[state.currentExcersise].sets.length - 1]);
    state.exercises[state.currentExcersise].maxSets++;
    emit(state);
  }

  /// -1 set Button
  void manualRemoveOneSet() {
    if (state.exercises[state.currentExcersise].sets.length >
        state.currentSet + 1) {
      state.exercises[state.currentExcersise].sets.removeLast();
      state.exercises[state.currentExcersise].maxSets--;
      emit(state);
    }
  }
}
