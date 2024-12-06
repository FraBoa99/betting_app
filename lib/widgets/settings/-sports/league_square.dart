import 'package:betting_app/bloc/settings/sports_settings_cubit.dart';
import 'package:betting_app/models/league.dart';
import 'package:betting_app/models/sport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeagueSquare extends StatefulWidget {
  final League league;
  final Sport sport;

  const LeagueSquare({
    super.key,
    required this.league,
    required this.sport,
  });

  @override
  State<StatefulWidget> createState() => _BookmakerSquareState();
}

class _BookmakerSquareState extends State<LeagueSquare> {
  var isSelected = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isSelected = context
            .watch<SportsSettingsCubit>()
            .state
            .selectedLeague[widget.sport] ==
        widget.league;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsSettingsCubit, SportsSettingsState>(
        builder: (context, state) {
      return GestureDetector(
        child: Column(
          children: [
            SizedBox(
              width: 110,
              height: 100,
              child: Card(
                color: isSelected
                    ? const Color.fromARGB(255, 212, 244, 54)
                    : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /* SvgPicture.asset(
                      width: 60,
                      height: 60,
                      widget.bookmaker.image ?? Assets.imagesAppFileError,
                    ),*/
                  ],
                ),
              ),
            ),
            Text(widget.league.title),
          ],
        ),
        onTap: () {
          context
              .read<SportsSettingsCubit>()
              .setLeague(widget.sport, widget.league);
          setState(() {
            isSelected = !isSelected;
          });
        },
      );
    });
  }
}
