// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:betting_app/core/config/screen_size_config.dart';
import 'package:betting_app/core/navigation/app_router.dart';
import 'package:betting_app/core/repository/odds_repository.dart';
import 'package:betting_app/core/repository/user_repository.dart';
import 'package:betting_app/core/utils/service_locator.dart';
import 'package:betting_app/logic/cubit/app_theme/theme_cubit.dart';
import 'package:betting_app/logic/cubit/app_theme/theme_state.dart';
import 'package:betting_app/logic/cubit/authentication/auth_cubit.dart';
import 'package:betting_app/logic/cubit/betting_logic/matches_and_odds_cubit.dart';
import 'package:betting_app/logic/cubit/home/sport_cubit.dart';
import 'package:betting_app/logic/cubit/navigation/bottom_nav_cubit.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';
import 'package:betting_app/logic/cubit/settings/bookmakers_cubit.dart';
import 'package:betting_app/logic/cubit/settings/sports_settings_cubit.dart';
import 'package:betting_app/logic/cubit/user/user_cubit.dart';
import 'package:betting_app/logic/utils/firebase_options.dart';
// 📦 Package imports:
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
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => UserCubit(
          userRepository: getIt<UserRepository>(),
          authCubit: getIt<AuthCubit>()),
    ),
    BlocProvider(
      create: (context) => getIt<AuthCubit>(),
    ),
    BlocProvider(create: (context) => ThemeCubit()),
    BlocProvider(create: (context) => getIt<BottomNavCubit>()),
    BlocProvider(create: (context) => NavigationCubit(getIt<BottomNavCubit>())),
    BlocProvider(create: (context) => BookmakersCubit()),
    BlocProvider(create: (context) => SportsSettingsCubit()),
    BlocProvider(
        create: (context) => BettingCubit(repository: getIt<OddsRepository>())),
    BlocProvider(
      create: (context) => SportCubit(context.read<BettingCubit>(),
          repository: getIt<OddsRepository>()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          theme: state.themeData,
          routerConfig: createRouter(context),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
