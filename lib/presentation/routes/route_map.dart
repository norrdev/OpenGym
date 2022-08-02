import 'package:flutter/widgets.dart';

import '../screens/calculators/calc_absi_screen.dart';
import '../screens/calculators/calc_bmi_screen.dart';
import '../screens/exercises/exercises_screen.dart';
import '../screens/main_screen.dart';
import '../screens/settings/about_screen.dart';
import '../screens/shared/results.dart';
import '../screens/workout/workout_02_set_screen.dart';
import '../screens/workout/workout_03_timer_screen.dart';

/// Initial route
const kInitialRoute = '/';

/// Route map
// TODO: Add  all routes here
final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => MainScreen(),
  WorkoutSetScreen.id: (context) => const WorkoutSetScreen(),
  TimerScreen.id: (context) => const TimerScreen(),
  AboutScreen.id: (context) => AboutScreen(),
  ExercisesScreen.id: (context) => const ExercisesScreen(),
  '/bmi': (_) => const CalcBmiScreen(),
  '/absi': (_) => const CalcAbsiScreen(),
  '/result': (_) => const ResultScreen(),
};
