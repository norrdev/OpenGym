import 'package:get/get_state_manager/src/simple/get_state.dart';

class SetRestController extends GetxController {
  int _sets = 5;
  int _rest = 90;
  int _currentSet = 1;

  int get sets => _sets;
  int get rest => _rest;
  int get currentSet => _currentSet;

  void changeSets(int sets) {
    _sets = sets;
    update();
  }

  void changeRest(int rest) {
    _rest = rest;
    update();
  }

  void increaseRest() {
    _rest = _rest + 10;
    update();
  }

  void decreaseRest() {
    if (_rest >= 20) _rest = _rest - 10;
    update();
  }

  void increaseSets() {
    _sets++;
    update();
  }

  void decreaseSets() {
    if (_sets >= 2) _sets--;
    update();
  }

  void increaseCurrentSet() {
    _currentSet++;
    update();
  }

  void resetCurrentSet() {
    _currentSet = 1;
    update();
  }
}
