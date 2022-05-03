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
    primaryColor: Colors.white,
    toggleableActiveColor: Colors.white,
    textTheme: const TextTheme(
      subtitle1: TextStyle(
        color: Colors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      actionsIconTheme: IconThemeData(color: Colors.white),
      //color: Colors.blue,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        minimumSize: MaterialStateProperty.all<Size>(const Size.square(50)),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white, //thereby
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),
    //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
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
}