// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:betting_app/data/constants/list_of_league.dart';
import 'package:betting_app/data/models/league.dart';
import 'package:betting_app/logic/cubit/betting_logic/matches_and_odds_cubit.dart';
import 'package:betting_app/logic/cubit/home/sport_cubit.dart';
import 'package:betting_app/presentation/all_widget/widget/home/main_card.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class GuestView extends StatefulWidget {
  const GuestView({super.key});

  @override
  State<StatefulWidget> createState() => _GuestViewState();
}

class _GuestViewState extends State<GuestView> {
  final League defaultLeague = LeagueSoccer.serieA;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SportCubit>().selectedLeague(defaultLeague);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // SportMenu(),
        const Spacer(),
        BlocBuilder<BettingCubit, MatchesAndOddsState>(
          builder: (context, state) {
            if (state is MatchesAndOddsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MatchesAndOddsLoaded) {
              return MainCard(oddsList: state.oddsList);
            } else if (state is MatchesAndOddsError) {
              return const Center(
                  child: Text('Errore nel caricamento delle quote'));
            } else {
              return const Center(child: Text('Nessun dato disponibile'));
            }
          },
        ),
      ],
    );
  }
}
