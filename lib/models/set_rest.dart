import 'package:flutter/foundation.dart';

class SetRestData extends ChangeNotifier {
  int _sets = 5;
  int _rest = 90;
  int _currentSet = 1;

  int get sets => _sets;
  int get rest => _rest;
  int get currentSet => _currentSet;

  void changeSets(int sets) {
    _sets = sets;
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

  void increaseSets() {
    _sets++;
    notifyListeners();
  }

  void decreaseSets() {
    if (_sets >= 2) _sets--;
    notifyListeners();
  }

  void increaseCurrentSet() {
    _currentSet++;
    notifyListeners();
  }

  void resetCurrentSet() {
    _currentSet = 1;
    notifyListeners();
  }
}
