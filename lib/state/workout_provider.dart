import 'package:flutter/foundation.dart';

class WorkoutProvider extends ChangeNotifier {
  /// Active workout flag.
  bool active = false;

  /// Workout day from DB.days.
  int dayID = 0;

  /// Workout time
  DateTime? startTime;
  DateTime? finishTime;

  ///Exerscises from DB
  List<Map<String, dynamic>> excersises = [];

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
      _currentSet = 0;
      _currentExcersise++;
      notifyListeners();
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
      incCurrentExcersise();
    }
  }

  /// Clear object.
  void resetAllData() {
    active = false;
    dayID = 0;
    startTime = finishTime = null;
    excersises.clear();
    _currentExcersise = 0;
    _currentSet = 0;
  }
}
