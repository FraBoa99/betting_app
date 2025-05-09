// 📦 Package imports:
// 🌎 Project imports:
import 'package:betting_app/core/config/theme/app_theme.dart';
import 'package:betting_app/logic/cubit/app_theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeState(
            themeData: AppThemes.getTheme("Yellow"), themeName: "yellow"));

  void changeTheme(String themeName) {
    emit(ThemeState(
        themeData: AppThemes.getTheme(themeName), themeName: themeName));
  }
}
