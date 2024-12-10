import 'package:betting_app/screen/home/screen/home.dart';
import 'package:betting_app/screen/settings/screen/bookmakers_settings.dart';
import 'package:betting_app/screen/settings/screen/settings.dart';
import 'package:betting_app/screen/settings/screen/sports_settings.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/home';
  static const String myBet = '/myBet';
  static const String ticket = '/ticket';
  static const String football = '/football';
  static const String basket = '/basket';
  static const String boxe = '/boxe';
  static const String tennis = '/tennis';

  //Settings route
  static const String settings = '/settings';
  static const String settingsTheme = '/settings/theme';
  static const String settingSport = '/settings/sport';
  static const String settingsBookmaker = '/settings/bookmaker';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => Home());
      case settings:
        return MaterialPageRoute(builder: (_) => Settings());
      // case settingsTheme:
      //   return MaterialPageRoute(builder: (_) => SettingsTheme());
      case settingsBookmaker:
        return MaterialPageRoute(builder: (_) => const BookmakersSettings());
      case settingSport:
        return MaterialPageRoute(builder: (_) => const SportsSettings());
      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
