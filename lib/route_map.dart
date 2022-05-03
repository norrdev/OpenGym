import 'package:flutter/widgets.dart';
import 'package:npng/screens/exercises/exercises_screen.dart';
import 'package:npng/screens/main_screen.dart';
import 'package:npng/screens/settings/about_screen.dart';
import 'package:npng/screens/workout/workout_02_set_screen.dart';
import 'package:npng/screens/workout/workout_03_timer_screen.dart';

/// Initial route
const kInitialRoute = '/';

/// Route map
/// TODO: Remove all
final Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => const MainScreen(),
  WorkoutSetScreen.id: (context) => const WorkoutSetScreen(),
  TimerScreen.id: (context) => const TimerScreen(),
  AboutScreen.id: (context) => AboutScreen(),
  ExercisesScreen.id: (context) => const ExercisesScreen(),
};
