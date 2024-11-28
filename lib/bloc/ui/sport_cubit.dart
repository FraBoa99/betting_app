import 'package:betting_app/bloc/rest/betting_cubit.dart';
import 'package:betting_app/constants/list_of_league.dart';
import 'package:betting_app/constants/list_of_sports.dart';
import 'package:betting_app/models/league.dart';
import 'package:betting_app/repository/odds_repository.dart';
import 'package:betting_app/widgets/menu/sport_menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportState {
  final String selectedSport;
  final League selectedLeague;
  final List<League> leagueList;

  SportState({
    required this.selectedSport,
    required this.selectedLeague,
    required this.leagueList,
  });

  SportState copyWith({
    String? selectedSport,
    League? selectedLeague,
    List<League>? leagueList,
  }) {
    return SportState(
      selectedSport: selectedSport ?? this.selectedSport,
      selectedLeague: selectedLeague ?? this.selectedLeague,
      leagueList: leagueList ?? this.leagueList,
    );
  }
}

class SportCubit extends Cubit<SportState> {
  final BettingCubit bettingCubit;
  SportCubit(this.bettingCubit, {required OddsRepository repository})
      : super(SportState(
            selectedSport: 'Calcio',
            selectedLeague: LeagueSoccer
                .serieA, //Da cambiare in futuro con logica di preferenza utente
            leagueList: SportList.soccer));

  void selectedSport(String sport) {
    List<League> leagues = [];
    if (sport == Sports.calcio.name) {
      leagues = SportList.soccer;
    } else if (sport == Sports.basket.name) {
      leagues = SportList.basket;
    } else if (sport == Sports.tennis.name) {
      leagues = SportList.tennis;
    } else if (sport == Sports.football.name) {
      leagues = SportList.football;
    }

    emit(state.copyWith(
        selectedSport: sport, leagueList: leagues, selectedLeague: null));
  }

  void selectedLeague(League league) {
    emit(state.copyWith(selectedLeague: league));
    bettingCubit.fetchOdds(
        league.key, league.region, null, null, league.bookmakers.first.key);
  }
}
