import 'package:betting_app/constants/list_of_league.dart';
import 'package:betting_app/models/league.dart';

class SportList {
  static final List<League> soccer = [
    LeagueSoccer.serieA,
    LeagueSoccer.bundesliga,
    LeagueSoccer.championsLeague,
    LeagueSoccer.eredivise,
    LeagueSoccer.europaLeague,
    LeagueSoccer.laLiga,
    LeagueSoccer.ligue1,
    LeagueSoccer.mls
  ];

  static final List<League> basket = [
    LeagueBasket.euroleague,
    LeagueBasket.nba,
    LeagueBasket.nccab,
    LeagueBasket.wnba,
  ];

  static final List<League> tennis = [
    LeagueTennis.atpAustralian,
    LeagueTennis.atpFrenchopen,
    LeagueTennis.atpUsOpen,
    LeagueTennis.atpWimbledon,
  ];

  static final List<League> football = [
    LeagueAmericanFootball.cfl,
    LeagueAmericanFootball.ncaaf,
    LeagueAmericanFootball.nfl,
    LeagueAmericanFootball.nflSuperBowl,
    LeagueAmericanFootball.ufl,
  ];
}
