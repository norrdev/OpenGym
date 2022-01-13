import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:npng/screens/exercises/exercises_by_muscle_screen.dart';
import 'package:npng/screens/exercises/exercises_screen.dart';
import 'package:npng/screens/programs/programs_01_days_page.dart';
import 'package:npng/screens/programs/programs_00_page.dart';
import 'package:npng/screens/workout/workout_02_set_page.dart';
import 'package:npng/screens/settings/about_screen.dart';
import 'package:npng/screens/workout/workout_03_timer_page.dart';
import 'package:npng/screens/workout/workout_01_process_page.dart';
import 'package:npng/screens/workout/workout_00_start_page.dart';
import 'screens/main_screen.dart';

/// Place for themes, configuration constants, etc.

final bool isApple = !kIsWeb && (Platform.isMacOS || Platform.isIOS);
//const bool isApple = false;

// bool get isMobileDevice => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
// bool get isDesktopDevice =>
//     !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
// bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
// bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;

/// Current locale
String kLocale = Intl.getCurrentLocale();

/// Cupertino light & dark theme
//final Brightness brightness = MediaQuery.platformBrightnessOf(context);

final Brightness brightness = //Brightness.dark;
    WidgetsBinding.instance!.window.platformBrightness;

//get brightness => WidgetsBinding.instance!.window.platformBrightness;
//var brightness = SchedulerBinding.instance.window.platformBrightness;
bool darkModeOn = brightness == Brightness.dark;

final CupertinoThemeData kCupertinoTheme = CupertinoThemeData(
  brightness: brightness, //darkModeOn ? Brightness.dark : Brightness.light,
);

/// Material light theme
final ThemeData kMaterialLight = ThemeData(
  brightness: Brightness.light,
  primaryColor: kCupertinoTheme.primaryColor,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

/// Material dark theme
final ThemeData kMaterialDark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  primarySwatch: Colors.blue,
  bottomAppBarColor: Colors.black, // for bottomBar
  toggleableActiveColor: kCupertinoTheme.primaryColor, // for radio
  chipTheme: const ChipThemeData(
    backgroundColor: Colors.black45,
    disabledColor: Color(0xaaF5E0C3),
    shape: StadiumBorder(),
    brightness: Brightness.dark,
    labelPadding: EdgeInsets.all(8),
    labelStyle: TextStyle(),
    padding: EdgeInsets.all(8),
    secondaryLabelStyle: TextStyle(),
    secondarySelectedColor: Colors.white38,
    selectedColor: Colors.white38,
  ),
);

/// Initial route
const kInitialRoute = '/';

/// Route map
final Map<String, Widget Function(BuildContext)> kAppRoutes = {
  '/': (context) => const MainScreen(),
  WorkoutStartPage.id: (context) => const WorkoutStartPage(),
  WorkoutProcessPage.id: (context) => const WorkoutProcessPage(),
  ProgramsPage.id: (context) => const ProgramsPage(),
  WorkoutSetPage.id: (context) => const WorkoutSetPage(),
  TimerPage.id: (context) => const TimerPage(),
  AboutScreen.id: (context) => AboutScreen(),
  ExercisesScreen.id: (context) => const ExercisesScreen(),
  ProgramsDaysPage.id: (context) => const ProgramsDaysPage(),
  // RoutinesByDayPage.id: (context) => RoutinesByDayPage(),
  // AddExcersisePage.id: (context) => AddExcersisePage(),
};
