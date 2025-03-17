import 'league.dart';

class Sport {
  String key;
  String title;
  String icon;
  List<League> leagues;

  Sport({
    required this.key,
    required this.title,
    required this.icon,
    required this.leagues,
  });
}
