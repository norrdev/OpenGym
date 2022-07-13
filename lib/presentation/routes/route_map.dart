import 'package:flutter/widgets.dart';
import 'package:npng/presentation/screens/calculators/calc_bmi_screen.dart';
import 'package:npng/presentation/screens/exercises/exercises_screen.dart';
import 'package:npng/presentation/screens/main_screen.dart';
import 'package:npng/presentation/screens/settings/about_screen.dart';
import 'package:npng/presentation/screens/workout/workout_02_set_screen.dart';
import 'package:npng/presentation/screens/workout/workout_03_timer_screen.dart';

/// Initial route
const kInitialRoute = '/';

/// Route map
final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => MainScreen(),
  WorkoutSetScreen.id: (context) => const WorkoutSetScreen(),
  TimerScreen.id: (context) => const TimerScreen(),
  AboutScreen.id: (context) => AboutScreen(),
  ExercisesScreen.id: (context) => const ExercisesScreen(),
  '/bmi': (_) => const CalcBmiScreen(),
};
