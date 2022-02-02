import 'package:flutter/material.dart';

abstract class Themes {
  static final ThemeData light = ThemeData.light().copyWith(
    primaryColor: const Color(0xff0468D7),
    colorScheme: const ColorScheme(
      primary: Color(0xff0468D7),
      primaryVariant: Colors.white,
      secondary: Color(0xff64ffda),
      secondaryVariant: Color(0xff00bfa5),
      surface: Color(0xff424242),
      background: Color(0xffFAFAFA),
      error: Color(0xffd32f2f),
      onPrimary: Colors.white,
      onSecondary: Color(0xff000000),
      onSurface: Color(0xffffffff),
      onBackground: Colors.white,
      onError: Color(0xff000000),
      brightness: Brightness.dark,
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
      colorScheme: const ColorScheme(
        primary: Color(0xffff9800),
        primaryVariant: Color(0xff000000),
        secondary: Color(0xff64ffda),
        secondaryVariant: Color(0xff00bfa5),
        surface: Color(0xff424242),
        background: Color(0xff616161),
        error: Color(0xffd32f2f),
        onPrimary: Color(0xff000000),
        onSecondary: Color(0xff000000),
        onSurface: Color(0xffffffff),
        onBackground: Color(0xff000000),
        onError: Color(0xff000000),
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800]),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff2e2e2e)));
}
