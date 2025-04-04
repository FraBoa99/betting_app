// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:betting_app/logic/cubit/betting_logic/matches_and_odds_cubit.dart';
import 'package:betting_app/presentation/all_widget/widget/home/main_card.dart';
import 'package:betting_app/presentation/all_widget/widget_menu/league_menu.dart';
import 'package:betting_app/presentation/all_widget/widget_menu/sport_menu.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _UserHomeState();
}

class _UserHomeState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SportMenu(),
          ],
        ),
        const SizedBox(
          height: 250,
        ),
        const LeagueMenu(),
        const SizedBox(
          height: 30,
        ),
        BlocConsumer<BettingCubit, MatchesAndOddsState>(
            listener: (context, state) {
              switch (state) {
                case MatchesAndOddsInitial():
                  const Center(child: CircularProgressIndicator());
                case MatchesAndOddsLoading():
                  const Center(
                    child: CircularProgressIndicator(),
                  );
                case MatchesAndOddsError():
                  const Text('Error');
              }
            },
            bloc: context.read<BettingCubit>(),
            builder: (context, state) {
              if (state is MatchesAndOddsLoading ||
                  state is MatchesAndOddsInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MatchesAndOddsLoaded) {
                return MainCard(oddsList: state.oddsList);
              } else {
                return const Text('_');
              }
            }),
      ],
    );
  }
}
