import 'package:flutter/material.dart';

const Color kActionColorIcon = Colors.white;
const Color kActionColorEdit = Colors.grey;
const Color kActionColorDelete = Colors.black;

class AppTheme {
  /// Material light theme
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSwatch(),
    useMaterial3: true,
  );

  /// Material dark theme
  static ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark),
    useMaterial3: true,
  );
}
