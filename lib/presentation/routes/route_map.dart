import 'package:flutter/widgets.dart';
import 'package:npng/presentation/screens/calculators/calc_bfp_screen.dart';

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
final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => MainScreen(),
  '/set': (context) => const WorkoutSetScreen(),
  '/timer': (context) => const TimerScreen(),
  '/about': (context) => AboutScreen(),
  '/exercises': (context) => const ExercisesScreen(),
  '/bmi': (_) => const CalcBmiScreen(),
  '/absi': (_) => const CalcAbsiScreen(),
  '/bfp': (_) => const BfpScreen(),
  '/result': (_) => const ResultScreen(),
};
