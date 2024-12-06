import 'package:betting_app/bloc/navigation/navigation_cubit.dart';
import 'package:betting_app/bloc/rest/betting_cubit.dart';
import 'package:betting_app/bloc/settings/bookmakers_cubit.dart';
import 'package:betting_app/bloc/settings/sports_settings_cubit.dart';
import 'package:betting_app/bloc/settings/theme_cubit.dart';
import 'package:betting_app/bloc/ui/sport_cubit.dart';
import 'package:betting_app/core/-api/api_service.dart';
import 'package:betting_app/core/-navigation/app_routes.dart';
import 'package:betting_app/core/-theme/theme_manager.dart';
import 'package:betting_app/repository/odds_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = OddsRepository(apiClient: ApiService());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => BookmakersCubit()),
        BlocProvider(create: (context) => SportsSettingsCubit()),
        BlocProvider(create: (context) => BettingCubit(repository: repository)),
        BlocProvider(
          create: (context) =>
              SportCubit(context.read<BettingCubit>(), repository: repository),
        ),
      ],
      child: BlocBuilder<ThemeCubit, AppTheme>(builder: (context, themeState) {
        ThemeData theme;

        switch (themeState) {
          case AppTheme.light:
            theme = ThemeManager.darkTheme;
            break;
          case AppTheme.dark:
            theme = ThemeManager.darkTheme;
            break;
          case AppTheme.system:
            theme = ThemeManager.systemTheme(context);
            break;
          default:
            theme = ThemeManager.systemTheme(context);
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.generateRoute,
          title: 'Flutter Demo',
          theme: theme,
        );
      }),
    );
  }
}
