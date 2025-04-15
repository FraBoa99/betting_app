// 📦 Package imports:
// 🌎 Project imports:
import 'package:betting_app/core/repository/odds_repository.dart';
import 'package:betting_app/data/constants/list_of_league.dart';
import 'package:betting_app/data/constants/list_of_sports.dart';
import 'package:betting_app/data/models/league.dart';
import 'package:betting_app/data/models/sport.dart';
import 'package:betting_app/logic/cubit/betting_logic/matches_and_odds_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportState {
  final Sport selectedSport;
  final League selectedLeague;
  final List<League> leagueList;

  SportState({
    required this.selectedSport,
    required this.selectedLeague,
    required this.leagueList,
  });

  SportState copyWith({
    Sport? selectedSport,
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
            selectedSport: SportList.soccer,
            selectedLeague: LeagueSoccer
                .serieA, //Da cambiare in futuro con logica di preferenza utente
            leagueList: SportList.soccer.leagues));

  void selectedSport(Sport sport) {
    emit(state.copyWith(
        selectedSport: sport, leagueList: sport.leagues, selectedLeague: null));
  }

  void selectedLeague(League league) {
    emit(state.copyWith(selectedLeague: league));
    bettingCubit.fetchOdds(
        league.key, league.region, null, null, league.bookmakers.first.key);
  }
}
