// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

enum AppTheme { light, dark, system }

class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(AppTheme.system);

  void setLightTheme() => emit(AppTheme.light);
  void setDarkTheme() => emit(AppTheme.dark);
  void setSystemTheme() => emit(AppTheme.system);
}
