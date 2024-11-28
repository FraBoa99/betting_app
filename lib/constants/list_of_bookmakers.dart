import 'package:betting_app/models/bookmaker.dart';

class BookmakerListEurope {
  static final sport888 = Bookmaker(
      key: 'sport888', regionKey: 'eu', title: 'Sport 888', image: '');
  static final betfair = Bookmaker(
      key: 'betfair_ex_eu', regionKey: 'eu', title: 'Betfair', image: '');
  static final everygame = Bookmaker(
      key: 'everygame', regionKey: 'eu', title: 'everygame', image: '');
  static final unibet = Bookmaker(
      key: 'unibet_eu', regionKey: 'eu', title: 'Unibet', image: 'image');
  static final williamhill = Bookmaker(
      key: 'williamhill', regionKey: 'eu', title: 'Williamhill', image: '');
}

class BookmakerListUs {
  static final williamhill = Bookmaker(
      key: 'williamhill_us',
      regionKey: 'us',
      title: 'Williamhill USA',
      image: '');
  static final bovada =
      Bookmaker(key: 'bovada', regionKey: 'us', title: 'Bovada', image: '');
  static final fanduel =
      Bookmaker(key: 'fanduel', regionKey: 'us', title: 'Fanduel', image: '');
  static final betus =
      Bookmaker(key: 'betus', regionKey: 'us', title: 'Betus', image: '');
  static final espnbet =
      Bookmaker(key: 'espnbet', regionKey: 'us', title: 'Espnbet', image: '');
}

class BookmakersListAu {
  static final betfair = Bookmaker(
      key: 'betfair_ex_au', regionKey: 'au', title: 'Betfair AU', image: '');
  static final sportsbet = Bookmaker(
      key: 'sportsbet', regionKey: 'au', title: 'Sportsbet', image: '');
  static final unibet =
      Bookmaker(key: 'unibet', regionKey: 'au', title: 'Unibet', image: '');
  static final topsport =
      Bookmaker(key: 'topsport', regionKey: 'au', title: 'Topsport', image: '');
  static final playup =
      Bookmaker(key: 'playup', regionKey: 'au', title: 'Playup', image: '');
}
