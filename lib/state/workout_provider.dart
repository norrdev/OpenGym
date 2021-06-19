import 'package:flutter/foundation.dart';

class WorkoutProvider extends ChangeNotifier {
  int workoutId = 0;

  List<Map<String, dynamic>>? excersises;

  int currentExcersise = 0;
  int maxExcersise = 0;

  int currentSet = 0;
  int maxSet = 4;

  int currentRest = 3;

  int currentRepeat = 0;
  int maxRepeat = 4;

  double currentWeight = 0.0;

  List<Map<int, List<Map<String, double>>>> workoutLog = [
    // # 0 ord
    {
      //id exc
      45: [
        // # 1 set
        {
          'repeat': 4.0,
          'rest': 90.0,
          'weight': 100.0,
        },
        // # 2 set
        {
          'repeat': 4.0,
          'rest': 90.0,
          'weight': 110.0,
        },
      ],
    },
  ];

  void _saveLog() {}
}
