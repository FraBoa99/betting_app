import 'dart:convert';

import 'package:betting_app/models/apiModels/bookmakers_api.dart';

class Odds {
  final String id;
  final String sportKey;
  final String sportTitle;
  final String commenceTime;
  final String homeTeam;
  final String awayTeam;
  final List<BookmakersApi> bookmakers;

  Odds({
    required this.id,
    required this.sportKey,
    required this.sportTitle,
    required this.commenceTime,
    required this.homeTeam,
    required this.awayTeam,
    required this.bookmakers,
  });

  factory Odds.fromMap(Map<String, dynamic> map) {
    return Odds(
      id: map['id'] ?? '',
      sportKey: map['sport_key'] ?? '',
      sportTitle: map['sport_title'] ?? '',
      commenceTime: map['commenceTime'] ?? '',
      homeTeam: map['home_team'] ?? '',
      bookmakers: (map['bookmakers'] as List<dynamic>)
          .map((item) => BookmakersApi.fromMap(item as Map<String, dynamic>))
          .toList(),
      awayTeam: map['away_team'] ?? '',
    );
  }

  factory Odds.fromJson(String source) => Odds.fromMap(json.decode(source));
}
