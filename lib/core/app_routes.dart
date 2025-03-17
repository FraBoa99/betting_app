import 'package:betting_app/presentation/screen/auth_screens/auth_start_screen.dart';
import 'package:betting_app/presentation/screen/auth_screens/password_reset_screen.dart';
import 'package:betting_app/presentation/screen/auth_screens/phone_auth_screen.dart';
import 'package:betting_app/presentation/screen/auth_screens/registration_pages_screen.dart';
import 'package:betting_app/presentation/screen/home.dart';
import 'package:betting_app/presentation/screen/setting_screens/bookmakers_settings.dart';
import 'package:betting_app/presentation/screen/setting_screens/settings.dart';
import 'package:betting_app/presentation/screen/setting_screens/sports_settings.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String profile = '/profile';

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
      case home:
        return MaterialPageRoute(builder: (_) => Home());
      case profile:
        return MaterialPageRoute(builder: (_) => const AuthStartScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const AuthStartScreen());
      case phoneLogin:
        return MaterialPageRoute(builder: (_) => const PhoneLogin());
      case signup:
        return MaterialPageRoute(builder: (_) => RegistrationPagesScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case settings:
        return MaterialPageRoute(builder: (_) => Settings());
      case settingsBookmaker:
        return MaterialPageRoute(builder: (_) => const BookmakersSettings());
      case settingSport:
        return MaterialPageRoute(builder: (_) => const SportsSettings());
      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
