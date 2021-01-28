import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:npng/pages/exercises_page.dart';
import 'package:npng/pages/routines_page.dart';
import 'package:npng/pages/timer/set_page.dart';
import 'package:npng/pages/about_page.dart';
import 'package:npng/pages/timer/timer_page.dart';
import 'package:npng/pages/timer/train_page.dart';

/// Place for themes, configuration constants, etc.

bool isApple = true;
// for debug
//final bool isApple = !kIsWeb && (Platform.isMacOS || Platform.isIOS);

/// Material light theme
final ThemeData kMaterialLight = ThemeData(
  primarySwatch: Colors.blue,
  buttonColor: Colors.blue,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

/// Material dark theme
final ThemeData kMaterialDark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.teal,
);

/// Cupertino light & dark theme
var brightness = SchedulerBinding.instance.window.platformBrightness;
bool darkModeOn = brightness == Brightness.dark;

final CupertinoThemeData kCupertinoTheme = CupertinoThemeData(
  //TODO: uncomment on release
  //brightness: darkModeOn ? Brightness.dark : Brightness.light,
  brightness: Brightness.light,
);

/// Initial route
final kInitialRoute = RoutinesPage.id;

/// Route map
final Map<String, Widget Function(BuildContext)> kAppRoutes = {
  RoutinesPage.id: (context) => RoutinesPage(),
  TrainPage.id: (context) => TrainPage(),
  SetPage.id: (context) => SetPage(),
  TimerPage.id: (context) => TimerPage(),
  AboutPage.id: (context) => AboutPage(),
  ExercisesPage.id: (context) => ExercisesPage(),
};
