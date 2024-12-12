import 'package:betting_app/cubits/betting/betting_cubit.dart';
import 'package:betting_app/models/apiModels/odds.dart';
import 'package:betting_app/navigation/app_routes.dart';
import 'package:betting_app/navigation/cubit/navigation_cubit.dart';
import 'package:betting_app/screen/home/menu/league_menu.dart';
import 'package:betting_app/screen/home/menu/sport_menu.dart';
import 'package:betting_app/screen/home/widgets/bet_event_odds_list_title.dart';
import 'package:betting_app/utils/string_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  bool isLoggedIn = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color.fromARGB(247, 209, 214, 209),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child:
                      Text('', style: Theme.of(context).textTheme.bodyMedium)),
              ListTile(
                title: Text('Settings',
                    style: Theme.of(context).textTheme.bodyMedium),
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.settings);
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          flexibleSpace: Container(),
          title: const Text('App di scommesse'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu)),
          actions: [
            IconButton(
              icon: Icon(isLoggedIn ? Icons.account_circle : Icons.login),
              onPressed: () {},
            )
          ],
        ),
        //BOTTOM NAVIGATION BAR
        bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
            builder: (context, selectedIndex) {
          return BottomNavigationBar(
            iconSize: 20,
            currentIndex: selectedIndex,
            onTap: (index) {
              context.read<NavigationCubit>().navigateTo(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'My Bet',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Ticket',
              ),
            ],
          );
        }),
        body: BlocListener<NavigationCubit, int>(
          listener: (context, selectedIndex) {
            switch (selectedIndex) {
              case 0:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
            }
          },
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.grey,
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
                      BlocConsumer<BettingCubit, BettingCubitState>(
                          listener: (context, state) {
                            switch (state) {
                              case BettingCubitInitial():
                                const Center(
                                    child: CircularProgressIndicator());
                              case BettingCubitLoading():
                                const Center(
                                  child: CircularProgressIndicator(),
                                );
                              case BettingCubitError():
                                const Text('Error');
                            }
                          },
                          bloc: context.read<BettingCubit>(),
                          builder: (context, state) {
                            List<Odds> oddsList = [];
                            if (state is BettingCubitLoaded) {
                              oddsList = state.oddsList;
                              return SizedBox(
                                height: 500,
                                width: 380,
                                child: ListView.builder(
                                  itemCount: oddsList.length,
                                  itemBuilder: (context, index) {
                                    final odd = oddsList[index];
                                    if (oddsList[index].bookmakers.isNotEmpty) {
                                      final bookmaker =
                                          oddsList[index].bookmakers[0];
                                      if (bookmaker.market.isNotEmpty) {
                                        final market = bookmaker.market[0];
                                        if (market.outcomes.isNotEmpty &&
                                            market.outcomes.length > 1) {
                                          final stringHelper = StringHelpers();

                                          return BetEventOddsListTitle(
                                            date: DateTime.tryParse(
                                                odd.commenceTime),
                                            team1: odd.homeTeam,
                                            team2: odd.awayTeam,
                                            tournament: stringHelper
                                                .getFirstWordBeforeScore(
                                                    odd.sportTitle),
                                            odd1: market.outcomes
                                                .firstWhere(
                                                  (outcome) =>
                                                      outcome.name ==
                                                      odd.homeTeam,
                                                )
                                                .price,
                                            odd2: market.outcomes
                                                .firstWhere(
                                                  (outcome) =>
                                                      outcome.name ==
                                                      odd.awayTeam,
                                                )
                                                .price,
                                            oddX: (market.outcomes.any(
                                                    (element) =>
                                                        element.name == 'Draw'))
                                                ? market.outcomes
                                                    .firstWhere((outcome) =>
                                                        outcome.name == 'Draw')
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
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
