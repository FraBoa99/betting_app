import 'package:betting_app/constants/assets/nations_flag_assets.dart';
import 'package:betting_app/constants/list_of_bookmakers.dart';
import 'package:betting_app/models/league.dart';

final bookmakersEu = [
  BookmakerListEurope.betfair,
  BookmakerListEurope.everygame,
  BookmakerListEurope.sport888,
  BookmakerListEurope.unibet,
  BookmakerListEurope.williamhill,
];

final bookmakersUs = [
  BookmakerListUs.betus,
  BookmakerListUs.bovada,
  BookmakerListUs.espnbet,
  BookmakerListUs.fanduel,
  BookmakerListUs.williamhill,
];

final bookmakersAu = [
  BookmakersListAu.betfair,
  BookmakersListAu.playup,
  BookmakersListAu.sportsbet,
  BookmakersListAu.topsport,
  BookmakersListAu.unibet,
];

//CALCIO
class LeagueSoccer {
  static final serieA = League(
      key: 'soccer_italy_serie_a',
      title: 'Serie A',
      image: NationsFlagAssets.italyFlag,
      region: 'eu',
      bookmakers: bookmakersEu);
  static final laLiga = League(
      key: 'soccer_spain_la_liga',
      title: 'La Liga',
      image: NationsFlagAssets.spainFlag,
      region: 'eu',
      bookmakers: bookmakersEu);
  static final ligue1 = League(
      key: 'soccer_france_ligue_one',
      title: 'Ligue 1',
      image: NationsFlagAssets.franceFlag,
      region: 'eu',
      bookmakers: bookmakersEu);
  static final bundesliga = League(
      key: 'soccer_germany_bundesliga',
      title: 'Bundesliga',
      image: NationsFlagAssets.germanyFlag,
      region: 'eu',
      bookmakers: bookmakersEu);
  static final eredivise = League(
      key: 'soccer_netherlands_eredivisie',
      title: 'Eredivise',
      image: NationsFlagAssets.netherlandsFlag,
      region: 'eu',
      bookmakers: bookmakersEu);
  static final championsLeague = League(
      key: 'soccer_uefa_champs_league',
      title: 'UEFA Champions',
      image: NationsFlagAssets.europeFlag,
      region: 'eu',
      bookmakers: bookmakersEu);
  static final europaLeague = League(
      key: 'soccer_uefa_europa_league',
      title: 'UEFA Europe',
      image: NationsFlagAssets.europeFlag,
      region: 'eu',
      bookmakers: bookmakersEu);
  static final mls = League(
      key: 'soccer_usa_mls',
      title: 'MLS',
      region: 'us',
      image: NationsFlagAssets.usaFlag,
      bookmakers: bookmakersUs);
}

//BASKET
class LeagueBasket {
  static final nba = League(
      key: 'basketball_nba',
      title: 'NBA',
      region: 'us',
      image: NationsFlagAssets.usaFlag,
      bookmakers: bookmakersUs);
  static final wnba = League(
      key: 'basketball_wnba',
      title: 'WNBA',
      region: 'us',
      image: NationsFlagAssets.usaFlag,
      bookmakers: bookmakersUs);
  static final nccab = League(
      key: 'key',
      title: 'basketball_ncaab',
      region: 'us',
      image: NationsFlagAssets.usaFlag,
      bookmakers: bookmakersUs);
  static final euroleague = League(
      key: 'basketball_euroleague',
      title: 'Euroleague',
      region: 'us',
      image: NationsFlagAssets.usaFlag,
      bookmakers: bookmakersEu);
}

//TENNIS
class LeagueTennis {
  static final atpAustralian = League(
      key: 'tennis_atp_aus_open_singles',
      title: 'ATP Australian Open',
      region: 'au',
      image: NationsFlagAssets.australiaFlag,
      bookmakers: bookmakersAu);
  static final atpUsOpen = League(
      key: 'tennis_atp_us_open',
      title: 'ATP US Open',
      region: 'us',
      image: NationsFlagAssets.usaFlag,
      bookmakers: bookmakersUs);
  static final atpWimbledon = League(
      key: 'tennis_atp_wimbledon',
      title: 'ATP Wimbledon',
      region: 'eu',
      image: NationsFlagAssets.englangFlag,
      bookmakers: bookmakersEu);
  static final atpFrenchopen = League(
      key: 'tennis_atp_french_open',
      title: 'ATP French Open',
      region: 'eu',
      image: NationsFlagAssets.franceFlag,
      bookmakers: bookmakersEu);
}

//FOOTBALL AMERICANO
class LeagueAmericanFootball {
  static final cfl = League(
      key: 'americanfootball_cfl',
      title: 'CFL',
      region: 'us',
      image: NationsFlagAssets.usaFlag,
      bookmakers: bookmakersUs);
  static final ncaaf = League(
      key: 'americanfootball_ncaaf',
      title: 'NCAAF',
      region: 'us',
      image: NationsFlagAssets.usaFlag,
      bookmakers: bookmakersUs);
  static final nfl = League(
      key: 'americanfootball_nfl',
      title: 'NFL',
      region: 'us',
      image: NationsFlagAssets.usaFlag,
      bookmakers: bookmakersUs);
  static final nflSuperBowl = League(
      key: 'americanfootball_nfl_super_bowl_winner',
      title: 'NFL Super Bowl',
      region: 'us',
      image: NationsFlagAssets.usaFlag,
      bookmakers: bookmakersUs);
  static final ufl = League(
      key: 'americanfootball_ufl',
      title: 'UFL',
      region: 'us',
      image: NationsFlagAssets.usaFlag,
      bookmakers: bookmakersUs);
}
