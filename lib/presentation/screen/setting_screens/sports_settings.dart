import 'package:betting_app/data/constants/list_of_sports.dart';
import 'package:betting_app/logic/cubit/settings/sports_settings_cubit.dart';
import 'package:betting_app/presentation/widget/widgets/bookmaker_league_square.dart';
import 'package:betting_app/presentation/widget/widgets/setting_sport_square.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsSettings extends StatefulWidget {
  const SportsSettings({super.key});

  @override
  State<StatefulWidget> createState() => _SportsSettings();
}

class _SportsSettings extends State<SportsSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Sports',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {},
          )
        ],
      ),
      body: BlocBuilder<SportsSettingsCubit, SportsSettingsState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(child: SportSquare(sport: SportList.soccer)),
                  Expanded(child: SportSquare(sport: SportList.basket)),
                  Expanded(child: SportSquare(sport: SportList.tennis)),
                  Expanded(child: SportSquare(sport: SportList.football))
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 0, right: 0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 140),
                    itemCount: state.leagueList.length,
                    itemBuilder: (context, index) {
                      return BookmakerLeagueSquare(
                        league: state.leagueList[index],
                        sport: state.sport,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
