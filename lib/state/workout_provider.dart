import 'package:flutter/foundation.dart';

class Set {
  int repeats = 0;
  double weight = 0;
  int rest = 0;
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
    sets.forEach((element) {
      if (!element.completed) flag = false;
      return;
    });
    return flag;
  }
}

class WorkoutProvider extends ChangeNotifier {
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

  void loadEx(List<Map<String, dynamic>> excersisesInput) {
    for (Map<String, dynamic> item in excersisesInput) {
      Exerscise ex = Exerscise();
      ex.id = item['id'];
      ex.name = item['name'];
      ex.maxSets = item['sets'];
      ex.restTime = item['rest'];
      for (int i = 0; i < item['sets']; i++) {
        Set oneset = Set();
        oneset.repeats = item['repeats'];
        oneset.weight = item['weight'];
        oneset.rest = item['rest'];
        oneset.completed = false;
        ex.sets.add(oneset);
      }
      excersises.add(ex);
    }
  }

  /// Completion Log

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
      try {
        print(excersises[_currentExcersise]);
        //excersises[_currentExcersise].putIfAbsent('completed', () => true);
        //excersises[_currentExcersise]['completed'] = true;
      } catch (e) {
        print(e);
      }

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
      print("Switch excersise");
      incCurrentExcersise();
    }
  }

  /// Current rest
  //FIXME Cange from excersise to set level (not critical now)
  int get currentRest => excersises[_currentExcersise].restTime;

  /// Check if excersise is completed
  bool excersiseCompleted(int index) {
    if (excersises[index].completed == true)
      return true;
    else
      return false;
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

  /// Clear object.
  void resetAllData() {
    active = finished = false;
    dayID = _currentExcersise = _currentSet = 0;
    startTime = finishTime = null;
    excersises.clear();
  }
}
