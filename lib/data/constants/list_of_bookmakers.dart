import 'package:betting_app/assets/assets.dart';
import 'package:betting_app/data/models/bookmaker.dart';

class BookmakerListEurope {
  static final sport888 = Bookmaker(
      key: 'sport888',
      regionKey: 'eu',
      title: 'Sport 888',
      image: Assets.imagesIconsLogoSport888Logo);
  static final betfair = Bookmaker(
      key: 'betfair_ex_eu', regionKey: 'eu', title: 'Betfair', image: null);
  static final everygame = Bookmaker(
      key: 'everygame', regionKey: 'eu', title: 'everygame', image: null);
  static final unibet = Bookmaker(
      key: 'unibet_eu',
      regionKey: 'eu',
      title: 'Unibet',
      image: Assets.imagesIconsLogoUnibetLogo);
  static final williamhill = Bookmaker(
      key: 'williamhill', regionKey: 'eu', title: 'Williamhill', image: null);

  static List<Bookmaker> euBookmakersList = [
    BookmakerListEurope.sport888,
    BookmakerListEurope.betfair,
    BookmakerListEurope.everygame,
    BookmakerListEurope.unibet,
    BookmakerListEurope.williamhill
  ];
}

class BookmakerListUs {
  static final williamhill = Bookmaker(
      key: 'williamhill_us',
      regionKey: 'us',
      title: 'Williamhill USA',
      image: null);
  static final bovada =
      Bookmaker(key: 'bovada', regionKey: 'us', title: 'Bovada', image: null);
  static final fanduel = Bookmaker(
      key: 'fanduel',
      regionKey: 'us',
      title: 'Fanduel',
      image: Assets.imagesIconsLogoFanduelLogo);
  static final betus =
      Bookmaker(key: 'betus', regionKey: 'us', title: 'Betus', image: null);
  static final espnbet = Bookmaker(
      key: 'espnbet',
      regionKey: 'us',
      title: 'Espnbet',
      image: Assets.imagesIconsLogoEspnLogo);

  static List<Bookmaker> usBookmakersList = [
    BookmakerListUs.betus,
    BookmakerListUs.bovada,
    BookmakerListUs.espnbet,
    BookmakerListUs.fanduel,
    BookmakerListUs.williamhill
  ];
}

class BookmakersListAu {
  static final betfair = Bookmaker(
      key: 'betfair_ex_au',
      regionKey: 'au',
      title: 'Betfair AU',
      image: Assets.imagesIconsLogoBetfairLogo);
  static final sportsbet = Bookmaker(
      key: 'sportsbet', regionKey: 'au', title: 'Sportsbet', image: null);
  static final unibet = Bookmaker(
      key: 'unibet',
      regionKey: 'au',
      title: 'Unibet',
      image: Assets.imagesIconsLogoUnibetLogo);
  static final topsport = Bookmaker(
      key: 'topsport', regionKey: 'au', title: 'Topsport', image: null);
  static final playup =
      Bookmaker(key: 'playup', regionKey: 'au', title: 'Playup', image: null);

  static List<Bookmaker> auBookmakersList = [
    BookmakersListAu.betfair,
    BookmakersListAu.playup,
    BookmakersListAu.sportsbet,
    BookmakersListAu.topsport,
    BookmakersListAu.unibet
  ];
}
