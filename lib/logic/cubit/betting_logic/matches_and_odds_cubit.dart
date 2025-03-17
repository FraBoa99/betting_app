import 'package:betting_app/core/repository/odds_repository.dart';
import 'package:betting_app/data/models/odds.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MatchesAndOddsState {}

class MatchesAndOddsInitial extends MatchesAndOddsState {}

class MatchesAndOddsError extends MatchesAndOddsState {}

class MatchesAndOddsLoading extends MatchesAndOddsState {}

class MatchesAndOddsLoaded extends MatchesAndOddsState {
  final List<Odds> oddsList;
  MatchesAndOddsLoaded({
    required this.oddsList,
  });

  MatchesAndOddsLoaded copyWith({
    List<Odds>? oddsList,
  }) {
    return MatchesAndOddsLoaded(
      oddsList: oddsList ?? this.oddsList,
    );
  }
}

class BettingCubit extends Cubit<MatchesAndOddsState> {
  final OddsRepository repository;

  BettingCubit({
    required this.repository,
  }) : super(MatchesAndOddsInitial());

  void fetchOdds(String sportKey, String regions, String? markets,
      String? eventId, String? bookmakers) async {
    emit(MatchesAndOddsLoading());
    try {
      final odds = await repository.getOdds(
          sportKey, regions, markets, eventId, bookmakers);
      if (state is MatchesAndOddsLoaded) {
        final currentState = state as MatchesAndOddsLoaded;
        emit(currentState.copyWith(oddsList: odds));
      } else {
        emit(MatchesAndOddsLoaded(oddsList: odds));
      }
    } catch (e) {
      emit(MatchesAndOddsError());
    }
  }
}
