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
  int weight = 0;

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
  List<Map<String, dynamic>> excersises = [];
  List<Exerscise> excersises2 = [];

  void loadEx(List<Map<String, dynamic>> excersises) {}

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
  int get maxSet => excersises[_currentExcersise]['sets'] - 1;
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
  int get currentRest => excersises[_currentExcersise]['rest'];

  /// Check if excersise is completed
  bool excersiseCompleted(int index) {
    if (excersises[index]['completed'] == true)
      return true;
    else
      return false;
  }

  /// Clear object.
  void resetAllData() {
    active = finished = false;
    dayID = _currentExcersise = _currentSet = 0;
    startTime = finishTime = null;
    excersises.clear();
  }
}
