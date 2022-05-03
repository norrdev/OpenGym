import 'package:flutter/material.dart';

/// Material light theme
final ThemeData materialLight = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(color: Colors.white),
    color: Colors.blue,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
  ),
);

/// Material dark theme
final ThemeData materialDark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  primarySwatch: Colors.blue,
  bottomAppBarColor: Colors.black, // for bottomBar
  toggleableActiveColor: Colors.blue, // for radio
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

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
  ),
);
