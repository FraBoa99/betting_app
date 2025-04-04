import 'package:flutter/widgets.dart';

class ScreenSizeConfig {
  static late double designWidth;
  static late double designHeight;
  static bool isInitialized = false;

  static void init(BuildContext context) {
    if (!isInitialized) {
      designWidth = MediaQuery.of(context).size.width;
      designHeight = MediaQuery.of(context).size.height;
      isInitialized = true;
    }
  }
}
