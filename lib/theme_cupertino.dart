import 'package:flutter/cupertino.dart';

/// Cupertino light & dark theme
//final Brightness brightness = MediaQuery.platformBrightnessOf(context);

final Brightness brightness = //Brightness.dark;
    WidgetsBinding.instance!.window.platformBrightness;

//get brightness => WidgetsBinding.instance!.window.platformBrightness;
//var brightness = SchedulerBinding.instance.window.platformBrightness;
bool darkModeOn = brightness == Brightness.dark;

final CupertinoThemeData cupertinoTheme = CupertinoThemeData(
  //materialTheme: kMaterialLight,
  brightness: brightness, //darkModeOn ? Brightness.dark : Brightness.light,
);

// final CupertinoThemeData kCupertinoTheme = MaterialBasedCupertinoThemeData(
//   materialTheme: kMaterialLight,
//   //brightness: brightness, //darkModeOn ? Brightness.dark : Brightness.light,
// );