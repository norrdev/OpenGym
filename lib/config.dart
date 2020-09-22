import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// Place to themes, configuration constants, etc.

final ThemeData materialLight = ThemeData(
  primarySwatch: Colors.blue,
  buttonColor: Colors.blue,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final ThemeData materialDark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.teal,
);

CupertinoThemeData cupertinoTheme() {
  var brightness = SchedulerBinding.instance.window.platformBrightness;
  bool darkModeOn = brightness == Brightness.dark;
  return CupertinoThemeData(
    brightness: darkModeOn ? Brightness.dark : Brightness.light,
  );
}
