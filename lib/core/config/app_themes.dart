import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.black),
      elevation: 0,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.blue,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.white),
    ),
  );
}
