import 'package:flutter/material.dart';

class DefaultProgramState extends ChangeNotifier {
  int _defaultProgram = -1;

  int get defaultProgram => _defaultProgram;

  set defaultProgram(int defaultProgram) {
    _defaultProgram = defaultProgram;
    notifyListeners();
  }
}
