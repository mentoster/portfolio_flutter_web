import 'package:flutter/material.dart';

abstract class Themes {
  static final ThemeData light = ThemeData.light().copyWith(
    useMaterial3: true,
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    }),
    primaryColor: const Color(0xff0468D7),
    colorScheme: const ColorScheme(
      primary: Color.fromARGB(255, 4, 102, 215),
      secondary: Color.fromARGB(255, 100, 255, 219),
      surface: Color.fromARGB(255, 66, 66, 66),
      background: Color.fromARGB(255, 250, 250, 250),
      error: Color.fromARGB(255, 211, 47, 47),
      onPrimary: Colors.white,
      onSecondary: Color.fromARGB(255, 0, 0, 0),
      onSurface: Color.fromARGB(255, 255, 255, 255),
      onBackground: Colors.white,
      onError: Color.fromARGB(255, 0, 0, 0),
      brightness: Brightness.dark,
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        primary: Color.fromARGB(255, 255, 153, 0),
        secondary: Color.fromARGB(255, 100, 255, 219),
        surface: Color.fromARGB(255, 66, 66, 66),
        background: Color.fromARGB(255, 97, 97, 97),
        error: Color.fromARGB(255, 211, 47, 47),
        onPrimary: Color.fromARGB(255, 0, 0, 0),
        onSecondary: Color.fromARGB(255, 0, 0, 0),
        onSurface: Color.fromARGB(255, 255, 255, 255),
        onBackground: Color.fromARGB(255, 0, 0, 0),
        onError: Color.fromARGB(255, 0, 0, 0),
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800]),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xff2e2e2e)));
}
