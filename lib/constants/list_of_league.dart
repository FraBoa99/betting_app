import 'package:betting_app/constants/list_of_bookmakers.dart';
import 'package:betting_app/models/league.dart';

class LeagueSoccer {
  final serieA = League(
      key: 'soccer_italy_serie_a',
      title: 'Serie A',
      image: '',
      bookmakers: [
        BookmakerListEurope.betfair,
        BookmakerListEurope.everygame,
        BookmakerListEurope.sport888,
        BookmakerListEurope.unibet,
        BookmakerListEurope.williamhill
      ]);
}
