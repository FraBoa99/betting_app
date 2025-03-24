import 'package:flutter/material.dart';

class AppConfig {
  static double iconSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * 0.08; // 8% della larghezza dello schermo
  }
}
