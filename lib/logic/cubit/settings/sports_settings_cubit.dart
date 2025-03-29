// 📦 Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:betting_app/data/constants/list_of_sports.dart';
import 'package:betting_app/data/models/league.dart';
import 'package:betting_app/data/models/sport.dart';

class SportsSettingsState extends Equatable {
  final Sport sport;
  final List<League> leagueList;
  final Map<Sport, League> selectedLeague;

  const SportsSettingsState({
    required this.sport,
    required this.selectedLeague,
    required this.leagueList,
  });

  @override
  List<Object?> get props => [sport, selectedLeague];

  SportsSettingsState copyWith(
      {Sport? sport,
      List<League>? leagueList,
      Map<Sport, League>? selectedLeague}) {
    return SportsSettingsState(
        sport: sport ?? this.sport,
        leagueList: leagueList ?? this.leagueList,
        selectedLeague: selectedLeague ?? this.selectedLeague);
  }
}

class SportsSettingsCubit extends Cubit<SportsSettingsState> {
  SportsSettingsCubit()
      : super(SportsSettingsState(
          sport: SportList.soccer,
          selectedLeague: const <Sport, League>{},
          leagueList: SportList.soccer.leagues,
        ));

  void setSport(Sport sport) {
    emit(state.copyWith(sport: sport, leagueList: sport.leagues));
  }

  void setLeague(
    Sport sport,
    League league,
  ) {
    final entries = state.selectedLeague.entries.toList();
    entries.add(MapEntry(sport, league));
    final Map<Sport, League> leagueMap = Map.fromEntries(entries);
    emit(state.copyWith(selectedLeague: leagueMap));
    //Da salvare in preferenze utente
  }
}
