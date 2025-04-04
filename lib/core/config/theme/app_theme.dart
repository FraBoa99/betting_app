// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../../utils/app_text_styles.dart';

class AppThemes {
  static final Map<String, Color> themeColors = {
    "Red": Colors.red,
    "Yellow": const Color.fromRGBO(181, 217, 53, 1),
    "Green": Colors.green,
    "Celeste": Colors.lightBlue,
    "Pink": Colors.purple,
    "White": Colors.white,
    "Black": Colors.black,
  };

  static ThemeData getTheme(String themeName) {
    final primaryColor =
        themeColors[themeName] ?? Colors.red; // Default a Rosso
    final isDark =
        primaryColor.computeLuminance() < 0.5; // Determina se il colore è scuro

    return ThemeData(
      primaryColor: primaryColor,
      brightness: isDark ? Brightness.dark : Brightness.light,
      textTheme: AppTextStyles.getTextTheme(primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor:
              isDark ? Colors.white : Colors.black, // Testo su pulsante
        ),
      ),
    );
  }
}
