import 'package:betting_app/models/bookmaker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  //Save e Get tema Preferito
  Future<void> savePreferredTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferred_theme', theme);
  }

  Future<String?> getPreferredTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('preferred_theme');
  }

//Save e Get sport preferito.
  Future<void> savePreferredSport(String sport) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferred_sport', sport);
  }

  Future<String?> getPreferedSport() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('preffered_sport');
  }

  //Save e Get lega preferita.
  Future<void> savePreferredLeague(String sport, String lega) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferred_league_of_$sport', lega);
  }

  Future<String?> getPreferedLeague(String sport) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('preferred_league_of_$sport');
  }

  //Save e Get Bookmaker
  Future<void> savePreferredBookmaker(
      Bookmaker bookmaker, String country) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferred_bookmaker_$country', bookmaker.key);
  }

  Future<String?> getPreferedBookmaker(String country) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('preferred_bookmaker_$country');
  }
}
