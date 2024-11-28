import 'package:betting_app/bloc/navigation/navigation_cubit.dart';
import 'package:betting_app/bloc/rest/betting_cubit.dart';
import 'package:betting_app/core/navigation/app_routes.dart';
import 'package:betting_app/models/apiModels/odds.dart';
import 'package:betting_app/utils/string_helper.dart';
import 'package:betting_app/widgets/betting/bet_event_odds_list_title.dart';
import 'package:betting_app/widgets/menu/league_menu.dart';
import 'package:betting_app/widgets/menu/sport_menu.dart';
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
              const DrawerHeader(child: Text('Menu laterale')),
              ListTile(
                title: const Text('Opzione 1'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.settings);
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 43, 159, 47),
              Color.fromARGB(255, 62, 153, 63)
            ])),
          ),
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
        body: BlocListener<NavigationCubit, int>(
          listener: (context, selectedIndex) {
            switch (selectedIndex) {
              case 0:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
            }
          },
          child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 43, 159, 47),
                        Color.fromARGB(255, 62, 153, 63)
                      ]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(200, 60),
                          bottomRight: Radius.elliptical(200, 60)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SportMenu(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      const LeagueMenu(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: BlocBuilder<BettingCubit, BettingCubitState>(
                              bloc: context.read<BettingCubit>(),
                              builder: (context, state) {
                                List<Odds> oddsList = [];
                                switch (state) {
                                  case BettingCubitInitial():
                                    return const Text('initial');
                                  case BettingCubitLoading():
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  case BettingCubitError():
                                    return const Text('Error');
                                  case BettingCubitLoaded():
                                    oddsList = state.oddsList;
                                    return ListView.builder(
                                      itemCount: oddsList.length,
                                      itemBuilder: (context, index) {
                                        final odd = oddsList[index];
                                        if (oddsList[index]
                                            .bookmakers
                                            .isNotEmpty) {
                                          final bookmaker =
                                              oddsList[index].bookmakers[0];
                                          if (bookmaker.market.isNotEmpty) {
                                            final market = bookmaker.market[0];
                                            if (market.outcomes.isNotEmpty &&
                                                market.outcomes.length >= 2) {
                                              //Controllo per verificare se ci sono almeno  tipi di pronostici nell'array(1,X,2)
                                              final stringHelper =
                                                  StringHelpers();
                                              return BetEventOddsListTitle(
                                                date: 'Today',
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
                                                            element.name ==
                                                            'Draw'))
                                                    ? market.outcomes
                                                        .firstWhere((outcome) =>
                                                            outcome.name ==
                                                            'Draw')
                                                        .price
                                                    : null,
                                              );
                                            }
                                          }
                                        }
                                        return null;
                                      },
                                    );
                                  default:
                                    return const Text('errore');
                                }
                              }),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),

        //BOTTOM NAVIGATION BAR
        bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
            builder: (context, selectedIndex) {
          return BottomNavigationBar(
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
        }));
  }
}
