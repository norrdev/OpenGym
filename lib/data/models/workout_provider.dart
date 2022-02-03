import 'package:flutter/foundation.dart';

/// Data classes ===============================================================
class Set {
  int repeats = 0;
  double weight = 0;
  //int rest = 0;
  bool completed = false;
}

class Exerscise {
  int id = 0;
  String name = '';
  int maxSets = 0;
  int restTime = 0;
  List<Set> sets = [];

  bool get completed {
    bool flag = true;
    // May be usual circle.
    for (var element in sets) {
      if (!element.completed) flag = false;
      return flag;
    }
    return flag;
  }
}

/// Workout settings and methods. ==============================================

class WorkoutProvider extends ChangeNotifier {
  /// Default program.
  int _defaultProgram = -1;

  /// Default program.
  int get defaultProgram => _defaultProgram;

  /// Default program.
  set defaultProgram(int defaultProgram) {
    _defaultProgram = defaultProgram;
    notifyListeners();
  }

  /// Active workout flag.
  bool active = false;

  /// Finished workout flag. Active != filished.
  bool finished = false;

  /// Workout day from DB.days.
  int dayID = 0;

  /// Workout time
  DateTime? startTime;
  DateTime? finishTime;

  ///Exerscises from DB
  List<Exerscise> excersises = [];

  /// Loading from database
  void loadEx(List<Map<String, dynamic>> excersisesInput) {
    for (Map<String, dynamic> item in excersisesInput) {
      Exerscise ex = Exerscise();
      ex.id = item['exercises_id'] as int;
      ex.name = item['name'] as String;
      ex.maxSets = item['sets'] as int;
      ex.restTime = item['rest'] as int;
      for (int i = 0; i < (item['sets'] as int); i++) {
        Set oneset = Set();
        oneset.repeats = item['repeats'] as int;
        oneset.weight = item['weight'] as double;
        oneset.completed = false;
        ex.sets.add(oneset);
      }
      excersises.add(ex);
    }
  }

  /// Completion Log------------------------------------------------------------

  ///Current excersise counter
  int _currentExcersise = 0;
  int get currentExcersise => _currentExcersise;
  int get maxExcersise => excersises.length - 1;
  set currentExcersise(int currentExcersise) {
    _currentExcersise = currentExcersise;
    notifyListeners();
  }

  void incCurrentExcersise() {
    if (_currentExcersise < maxExcersise) {
      // Flag previous excersise as 'completed'
      _currentSet = 0;
      _currentExcersise++;
      notifyListeners();
    } else {
      finishTime = DateTime.now();
      finished = true;
    }
  }

  /// Current set counter
  int _currentSet = 0;
  int get currentSet => _currentSet;
  int get maxSet => excersises[_currentExcersise].maxSets - 1;

  set currentSet(int currentSet) {
    _currentSet = currentSet;
    notifyListeners();
  }

  void incCurrentSet() {
    if (_currentSet < maxSet) {
      _currentSet++;
      notifyListeners();
    } else {
      incCurrentExcersise();
    }
  }

  /// Current rest
  int get currentRest => excersises[_currentExcersise].restTime;

  /// Check if excersise is completed
  bool excersiseCompleted(int index) {
    if (excersises[index].completed == true) {
      return true;
    } else {
      return false;
    }
  }

  /// Increase repeats in set
  void incRepeats({int? excersiseNumber, int? setNumber}) {
    excersises[excersiseNumber!].sets[setNumber!].repeats++;
    notifyListeners();
  }

  /// Decrease repeats in set
  void decRepeats({int? excersiseNumber, int? setNumber}) {
    if (excersises[excersiseNumber!].sets[setNumber!].repeats > 1) {
      excersises[excersiseNumber].sets[setNumber].repeats--;
      notifyListeners();
    }
  }

  /// Increase weight in set
  void incWeight025({int? excersiseNumber, int? setNumber}) {
    excersises[excersiseNumber!].sets[setNumber!].weight =
        excersises[excersiseNumber].sets[setNumber].weight + 0.25;
    notifyListeners();
  }

  void incWeight5({int? excersiseNumber, int? setNumber}) {
    excersises[excersiseNumber!].sets[setNumber!].weight =
        excersises[excersiseNumber].sets[setNumber].weight + 5;
    notifyListeners();
  }

  /// Decrease weight in set
  void decWeight025({int? excersiseNumber, int? setNumber}) {
    if (excersises[excersiseNumber!].sets[setNumber!].weight > 0) {
      excersises[excersiseNumber].sets[setNumber].weight =
          excersises[excersiseNumber].sets[setNumber].weight - 0.25;
      notifyListeners();
    }
  }

  void decWeight5({int? excersiseNumber, int? setNumber}) {
    if (excersises[excersiseNumber!].sets[setNumber!].weight > 5) {
      excersises[excersiseNumber].sets[setNumber].weight =
          excersises[excersiseNumber].sets[setNumber].weight - 5;
      notifyListeners();
    }
  }

  /// +1 set Button
  void manualAddOneSet() {
    excersises[currentExcersise].sets.add(excersises[currentExcersise]
        .sets[excersises[currentExcersise].sets.length - 1]);
    excersises[currentExcersise].maxSets++;
    notifyListeners();
  }

  /// -1 set Button
  void manualRemoveOneSet() {
    if (excersises[currentExcersise].sets.length > currentSet + 1) {
      excersises[currentExcersise].sets.removeLast();
      excersises[currentExcersise].maxSets--;
      notifyListeners();
    }
  }

  /// Skip exersise and remove it from log
  /// Set as completed
  void manualSkipExersise() {
    //if (currentSet == 0) {
    // print('skip');
    // excersises.removeAt(currentExcersise);
    // notifyListeners();
    //}
  }

  /// Clear object.
  void resetAllData() {
    active = false;
    finished = false;
    dayID = 0;
    _currentExcersise = 0;
    _currentSet = 0;
    startTime = null;
    finishTime = null;
    excersises.clear();
  }
}
