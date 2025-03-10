import 'package:betting_app/modules/bets/models/odds.dart';
import 'package:betting_app/modules/bets/repository/odds_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BettingCubitState {}

class BettingCubitInitial extends BettingCubitState {}

class BettingCubitError extends BettingCubitState {}

class BettingCubitLoading extends BettingCubitState {}

class BettingCubitLoaded extends BettingCubitState {
  final List<Odds> oddsList;
  BettingCubitLoaded({
    required this.oddsList,
  });

  BettingCubitLoaded copyWith({
    List<Odds>? oddsList,
  }) {
    return BettingCubitLoaded(
      oddsList: oddsList ?? this.oddsList,
    );
  }
}

class BettingCubit extends Cubit<BettingCubitState> {
  final OddsRepository repository;

  BettingCubit({
    required this.repository,
  }) : super(BettingCubitInitial());

  void fetchOdds(String sportKey, String regions, String? markets,
      String? eventId, String? bookmakers) async {
    emit(BettingCubitLoading());
    try {
      final odds = await repository.getOdds(
          sportKey, regions, markets, eventId, bookmakers);
      if (state is BettingCubitLoaded) {
        final currentState = state as BettingCubitLoaded;
        emit(currentState.copyWith(oddsList: odds));
      } else {
        emit(BettingCubitLoaded(oddsList: odds));
      }
    } catch (e) {
      emit(BettingCubitError());
    }
  }
}
