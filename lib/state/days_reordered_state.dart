import 'package:flutter/material.dart' show ChangeNotifier;

class DaysReorderedState extends ChangeNotifier {
  bool _isDaysReordered = false;

  bool get isDaysReordered => _isDaysReordered;

  set isDaysReordered(bool isDaysReordered) {
    _isDaysReordered = isDaysReordered;
    notifyListeners();
  }

  void setDaysReorderedFalse() {
    _isDaysReordered = false;
  }
}
