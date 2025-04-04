import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFBFAF42); // Giallo senape
  static const Color secondary = Color(0xFF404040); // Grigio antracite

  //NAVIGATION:

  //Circle icon color
  static Color bgCircleIcon = const Color(0xFFE0FF11);

  //HOME PAGE:
  static Color bgHome = const Color(0xFFEFF1F5);

  //MAIN CARD (CONTAINER):
  static Color bgMainContainer = const Color.fromARGB(15, 0, 0, 0);
  //Widget lega circolare
  static Color bgCircleLega = const Color.fromARGB(15, 0, 0, 0);
  static Color bgCircleLegaSelected = const Color.fromARGB(255, 109, 114, 76);

  //Registration:
  static LinearGradient bgTextFieldReg = const LinearGradient(
      colors: [Colors.black, Color.fromARGB(137, 48, 48, 48)]);
}
