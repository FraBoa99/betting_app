// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:betting_app/data/models/odds.dart';
import 'package:betting_app/logic/cubit/betting_logic/matches_and_odds_cubit.dart';
import 'package:betting_app/logic/utils/string_helper.dart';
import 'package:betting_app/presentation/all_widget/widget/custom_app_bar.dart';
import 'package:betting_app/presentation/all_widget/widget/custom_navigation_bar.dart';
import 'package:betting_app/presentation/all_widget/widget_menu/league_menu.dart';
import 'package:betting_app/presentation/all_widget/widget_menu/sport_menu.dart';
import 'package:betting_app/presentation/all_widget/widgets_screen/bet_event_odds_list_title.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class GuestHome extends StatefulWidget {
  const GuestHome({super.key});

  @override
  State<StatefulWidget> createState() => _GuestHomeState();
}

class _GuestHomeState extends State<GuestHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(247, 0, 0, 0),
      appBar: const CustomAppBar(),
      bottomNavigationBar: const CustomNavigationBar(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 17, 17, 17),
              Color.fromARGB(255, 9, 9, 9),
              Color.fromARGB(255, 17, 17, 17),
            ], begin: Alignment.center, end: Alignment.bottomCenter)),
          ),
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 1,
              ),
              child: Column(
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
                          return OddsList(oddsList: state.oddsList);
                        } else {
                          return const Text('_');
                        }
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OddsList extends StatelessWidget {
  final List<Odds> oddsList;

  const OddsList({super.key, required this.oddsList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 380,
      child: ListView.builder(
        itemCount: oddsList.length,
        itemBuilder: (context, index) {
          final odd = oddsList[index];
          if (oddsList[index].bookmakers.isNotEmpty) {
            final bookmaker = oddsList[index].bookmakers[0];
            if (bookmaker.market.isNotEmpty) {
              final market = bookmaker.market[0];
              if (market.outcomes.isNotEmpty && market.outcomes.length > 1) {
                final stringHelper = StringHelpers();

                return BetEventOddsListTitle(
                  date: DateTime.tryParse(odd.commenceTime),
                  team1: odd.homeTeam,
                  team2: odd.awayTeam,
                  tournament:
                      stringHelper.getFirstWordBeforeScore(odd.sportTitle),
                  odd1: market.outcomes
                      .firstWhere(
                        (outcome) => outcome.name == odd.homeTeam,
                      )
                      .price,
                  odd2: market.outcomes
                      .firstWhere(
                        (outcome) => outcome.name == odd.awayTeam,
                      )
                      .price,
                  oddX:
                      (market.outcomes.any((element) => element.name == 'Draw'))
                          ? market.outcomes
                              .firstWhere((outcome) => outcome.name == 'Draw')
                              .price
                          : null,
                );
              }
            }
          }
          return null;
        },
      ),
    );
  }
}
