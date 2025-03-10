import 'package:betting_app/modules/auth/screen/auth_start_screen.dart';
import 'package:betting_app/modules/auth/screen/password_reset_screen.dart';
import 'package:betting_app/modules/auth/screen/phone_auth_screen.dart';
import 'package:betting_app/modules/auth/screen/registration_flow.dart';
import 'package:betting_app/modules/home/screen/home.dart';
import 'package:betting_app/modules/settings/screen/bookmakers_settings.dart';
import 'package:betting_app/modules/settings/screen/settings.dart';
import 'package:betting_app/modules/settings/screen/sports_settings.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  //Login routes
  static const String login = '/login';
  static const String phoneLogin = '/phoneLogin';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgotPassword';

  //Home routes
  static const String home = '/home';
  static const String myBet = '/myBet';
  static const String ticket = '/ticket';
  static const String football = '/football';
  static const String basket = '/basket';
  static const String boxe = '/boxe';
  static const String tennis = '/tennis';

  //Settings routes
  static const String settings = '/settings';
  static const String settingsTheme = '/settings/theme';
  static const String settingSport = '/settings/sport';
  static const String settingsBookmaker = '/settings/bookmaker';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const AuthStartScreen());
      case phoneLogin:
        return MaterialPageRoute(builder: (_) => const PhoneLogin());
      case signup:
        return MaterialPageRoute(builder: (_) => RegistrationFlow());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case home:
        return MaterialPageRoute(
            builder: (_) => Home(
                  localUser: null,
                ));
      case settings:
        return MaterialPageRoute(builder: (_) => Settings());
      // case settingsTheme:
      //   return MaterialPageRoute(builder: (_) => SettingsTheme());
      case settingsBookmaker:
        return MaterialPageRoute(builder: (_) => const BookmakersSettings());
      case settingSport:
        return MaterialPageRoute(builder: (_) => const SportsSettings());
      default:
        return MaterialPageRoute(builder: (_) => const AuthStartScreen());
    }
  }
}
