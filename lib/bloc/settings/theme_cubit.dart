import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AppTheme { light, dark, system }

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_initialTheme());

  static ThemeData _initialTheme() {
    final systemBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return systemBrightness == Brightness.dark
        ? ThemeData.dark()
        : ThemeData.light();
  }

  void changeTheme(AppTheme appTheme) {
    switch (appTheme) {
      case AppTheme.light:
        emit(ThemeData.light());
      case AppTheme.dark:
        emit(ThemeData.dark());
      case AppTheme.system:
        final systemBrightness =
            WidgetsBinding.instance.platformDispatcher.platformBrightness;
        emit(systemBrightness == Brightness.dark
            ? ThemeData.dark()
            : ThemeData.light());
        break;
    }
  }
}
