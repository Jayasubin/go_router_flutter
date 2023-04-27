import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.from(
    useMaterial3: false,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.cyan,
      brightness: Brightness.light,
    ),
  );
  static ThemeData darkTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.teal,
      brightness: Brightness.dark,
    ),
  );
}
