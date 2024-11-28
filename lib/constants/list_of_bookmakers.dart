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
