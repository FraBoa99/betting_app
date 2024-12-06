import 'package:betting_app/constants/list_of_league.dart';
import 'package:betting_app/models/league.dart';
import 'package:betting_app/models/sport.dart';

class SportList {
  static final soccer =
      Sport(key: '', title: 'Calcio', icon: '', leagues: soccerLeague);
  static final basket =
      Sport(key: '', title: 'Basket', icon: '', leagues: basketLeague);
  static final tennis =
      Sport(key: '', title: 'Tennis', icon: '', leagues: tennisLeague);
  static final football =
      Sport(key: '', title: 'Football', icon: '', leagues: footballLeague);

  static final List<League> soccerLeague = [
    LeagueSoccer.serieA,
    LeagueSoccer.bundesliga,
    LeagueSoccer.championsLeague,
    LeagueSoccer.eredivise,
    LeagueSoccer.europaLeague,
    LeagueSoccer.laLiga,
    LeagueSoccer.ligue1,
    LeagueSoccer.mls
  ];

  static final List<League> basketLeague = [
    LeagueBasket.euroleague,
    LeagueBasket.nba,
    LeagueBasket.nccab,
    LeagueBasket.wnba,
  ];

  static final List<League> tennisLeague = [
    LeagueTennis.atpAustralian,
    LeagueTennis.atpFrenchopen,
    LeagueTennis.atpUsOpen,
    LeagueTennis.atpWimbledon,
  ];

  static final List<League> footballLeague = [
    LeagueAmericanFootball.cfl,
    LeagueAmericanFootball.ncaaf,
    LeagueAmericanFootball.nfl,
    LeagueAmericanFootball.nflSuperBowl,
    LeagueAmericanFootball.ufl,
  ];
}
