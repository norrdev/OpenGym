import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:npng/pages/exercises/exercise.dart';
import 'package:npng/pages/exercises/exercises_by_muscle_page.dart';
import 'package:npng/pages/exercises/exercises_page.dart';
import 'package:npng/pages/programs/days_page.dart';
import 'package:npng/pages/programs/programs_page.dart';
import 'package:npng/pages/workout/workout_set_page.dart';
import 'package:npng/pages/about_page.dart';
import 'package:npng/pages/workout/timer_page.dart';
import 'package:npng/pages/workout/train_page.dart';
import 'package:npng/pages/workout/workout_process_page.dart';
import 'package:npng/pages/workout/workout_start_page.dart';

/// Place for themes, configuration constants, etc.

final bool isApple = !kIsWeb && (Platform.isMacOS || Platform.isIOS);
//final bool isApple = false;

// bool get isMobileDevice => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
// bool get isDesktopDevice =>
//     !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
// bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
// bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;

/// Material light theme
final ThemeData kMaterialLight = ThemeData(
  primarySwatch: Colors.blue,
  buttonColor: Colors.blue,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

/// Material dark theme
//TODO: Make blue primary color
final ThemeData kMaterialDark = ThemeData(
  brightness: Brightness.dark,
  accentColor: Colors.blue,
  primarySwatch: Colors.blue,
  buttonColor: Colors.blue,
);

/// Cupertino light & dark theme
//final Brightness brightness = MediaQuery.platformBrightnessOf(context);

final Brightness brightness =
    WidgetsBinding.instance!.window.platformBrightness;

//get brightness => WidgetsBinding.instance!.window.platformBrightness;
//var brightness = SchedulerBinding.instance.window.platformBrightness;
bool darkModeOn = brightness == Brightness.dark;

final CupertinoThemeData kCupertinoTheme = CupertinoThemeData(
  brightness: brightness, //darkModeOn ? Brightness.dark : Brightness.light,
);

/// Initial route
final kInitialRoute = WorkoutStartPage.id;

/// Route map
final Map<String, Widget Function(BuildContext)> kAppRoutes = {
  WorkoutStartPage.id: (context) => WorkoutStartPage(),
  WorkoutProcessPage.id: (context) => WorkoutProcessPage(),
  ProgramsPage.id: (context) => ProgramsPage(),
  TrainPage.id: (context) => TrainPage(),
  WorkoutSetPage.id: (context) => WorkoutSetPage(),
  TimerPage.id: (context) => TimerPage(),
  AboutPage.id: (context) => AboutPage(),
  ExercisesPage.id: (context) => ExercisesPage(),
  ExercisesByMusclePage.id: (context) => ExercisesByMusclePage(),
  ExercisePage.id: (context) => ExercisePage(),
  DaysPage.id: (context) => DaysPage(),
  // RoutinesByDayPage.id: (context) => RoutinesByDayPage(),
  // AddExcersisePage.id: (context) => AddExcersisePage(),
};
