import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:npng/screens/about_screen.dart';
import 'package:npng/screens/home_screen.dart';
import 'package:npng/screens/timer/set_screen.dart';
import 'package:npng/screens/timer/timer_screen.dart';
import 'package:npng/screens/timer/train_screen.dart';

/// Place for themes, configuration constants, etc.

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
  brightness: darkModeOn ? Brightness.dark : Brightness.light,
);

/// Initial route
final kInitialRoute = HomeScreen.id;

/// Route map
final Map<String, Widget Function(BuildContext)> kAppRoutes = {
  HomeScreen.id: (context) => HomeScreen(),
  TrainScreen.id: (context) => TrainScreen(),
  SetScreen.id: (context) => SetScreen(),
  TimerScreen.id: (context) => TimerScreen(),
  AboutScreen.id: (context) => AboutScreen(),
};
