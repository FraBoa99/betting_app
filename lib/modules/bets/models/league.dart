import 'bookmaker.dart';

class League {
  String key;
  String title;
  String image;
  String region;
  List<Bookmaker> bookmakers;

  League({
    required this.key,
    required this.title,
    required this.image,
    required this.region,
    required this.bookmakers,
  });
}
