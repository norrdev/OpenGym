import 'package:flutter/material.dart';

class AppTheme {
  /// Material light theme
  static ThemeData light = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primaryColor: Colors.black,
    toggleableActiveColor: Colors.black,
    textTheme: const TextTheme(
      subtitle1: TextStyle(
        color: Colors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(color: Colors.black),
      //color: Colors.blue,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        minimumSize: MaterialStateProperty.all<Size>(const Size.square(50)),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(Colors.black),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black, //thereby
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.black,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
  );

  /// Material dark theme
  static ThemeData dark = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primaryColor: Colors.black,
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
}
