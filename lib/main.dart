import 'package:betting_app/bloc/betting_cubit.dart';
import 'package:betting_app/core/-api/api_service.dart';
import 'package:betting_app/core/-theme/theme_manager.dart';
import 'package:betting_app/firebase_options.dart';
import 'package:betting_app/navigation/app_routes.dart';
import 'package:betting_app/navigation/cubit/navigation_cubit.dart';
import 'package:betting_app/repository/odds_repository.dart';
import 'package:betting_app/screen/home/cubit/sport_cubit.dart';
import 'package:betting_app/screen/settings/cubit/bookmakers_cubit.dart';
import 'package:betting_app/screen/settings/cubit/sports_settings_cubit.dart';
import 'package:betting_app/screen/settings/cubit/theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
