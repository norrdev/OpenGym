import 'package:get/get.dart';

class SetRestController extends GetxController {
  int sets = 5;
  int rest = 90;
  int currentSet = 1;
  static SetRestController get to => Get.find();

  void increaseSets() {
    sets++;
    update();
  }

  void decreaseSets() {
    if (sets >= 2) sets--;
    update();
  }

  void increaseRest() {
    rest = rest + 10;
    update();
  }

  void decreaseRest() {
    if (rest >= 20) rest = rest - 10;
    update();
  }

  void increaseCurrentSet() {
    currentSet++;
    update();
  }

  void resetCurrentSet() {
    currentSet = 1;
    update();
  }

  void changeSets(int sets) {
    sets = sets;
    update();
  }

  void changeRest(int rest) {
    rest = rest;
    update();
  }
}
