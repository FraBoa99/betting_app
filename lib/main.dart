import 'package:betting_app/core/app_routes.dart';
import 'package:betting_app/core/repository/auth_repository.dart';
import 'package:betting_app/core/repository/odds_repository.dart';
import 'package:betting_app/core/repository/user_repository.dart';
import 'package:betting_app/core/service_locator.dart';
import 'package:betting_app/core/theme_manager.dart';
import 'package:betting_app/logic/cubit/authentication/auth_cubit.dart';
import 'package:betting_app/logic/cubit/betting_logic/matches_and_odds_cubit.dart';
import 'package:betting_app/logic/cubit/home/sport_cubit.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';
import 'package:betting_app/logic/cubit/settings/bookmakers_cubit.dart';
import 'package:betting_app/logic/cubit/settings/sports_settings_cubit.dart';
import 'package:betting_app/logic/cubit/settings/theme_cubit.dart';
import 'package:betting_app/logic/cubit/user/user_cubit.dart';
import 'package:betting_app/logic/utils/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    debugPrint("Firebase initialization error: $e");
  }

  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(getIt<AuthRepository>()),
        ),
        BlocProvider(
          create: (context) => UserCubit(
              userRepository: getIt<UserRepository>(),
              authCubit: getIt<AuthCubit>()),
        ),
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => BookmakersCubit()),
        BlocProvider(create: (context) => SportsSettingsCubit()),
        BlocProvider(
            create: (context) =>
                BettingCubit(repository: getIt<OddsRepository>())),
        BlocProvider(
          create: (context) => SportCubit(context.read<BettingCubit>(),
              repository: getIt<OddsRepository>()),
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
