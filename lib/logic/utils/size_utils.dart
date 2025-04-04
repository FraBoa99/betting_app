import 'package:betting_app/core/config/screen_size_config.dart';
import 'package:flutter/material.dart';

double dynamicScale(
    BuildContext context, double? desiredWidth, double? desiredHeight) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  if (desiredWidth != null) {
    return (desiredWidth / ScreenSizeConfig.designWidth) * screenWidth;
  } else if (desiredHeight != null) {
    return (desiredHeight / ScreenSizeConfig.designHeight) * screenHeight;
  } else {
    return 20; //Valore di defalut.
  }
}
