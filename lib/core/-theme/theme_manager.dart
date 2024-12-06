import 'package:flutter/material.dart';

class ThemeManager {
  //Tema chiaro
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white70,
      appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 212, 244, 54)),
      textTheme: const TextTheme(
          bodySmall: TextStyle(color: Colors.black, fontSize: 16),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 18),
          bodyLarge: TextStyle(color: Colors.black, fontSize: 20)));

  //Tema scuro
  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 212, 244, 54),
      ),
      textTheme: const TextTheme(
          bodySmall: TextStyle(color: Colors.white, fontSize: 30),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 30),
          bodyLarge: TextStyle(color: Colors.white, fontSize: 35)));

  // Sistema
  static ThemeData systemTheme(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark ? darkTheme : lightTheme;
  }
}
