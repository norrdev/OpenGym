import 'package:flutter/foundation.dart';

class SetRestProvider extends ChangeNotifier {
  int _repeats = 5;
  int _rest = 3;
  int _currentRepeat = 1;

  int get sets => _repeats;
  int get rest => _rest;
  int get currentSet => _currentRepeat;

  void changeRepeats(int sets) {
    _repeats = sets;
    notifyListeners();
  }

  void changeRest(int rest) {
    _rest = rest;
    notifyListeners();
  }

  void increaseRest() {
    _rest = _rest + 10;
    notifyListeners();
  }

  void decreaseRest() {
    if (_rest >= 20) _rest = _rest - 10;
    notifyListeners();
  }

  void increaseRepeats() {
    _repeats++;
    notifyListeners();
  }

  void decreaseRepeats() {
    if (_repeats >= 2) _repeats--;
    notifyListeners();
  }

  void increaseCurrentRepeat() {
    _currentRepeat++;
    notifyListeners();
  }

  void resetCurrentRepeat() {
    _currentRepeat = 1;
    notifyListeners();
  }
}
