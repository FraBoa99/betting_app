import 'package:betting_app/modules/home/cubit/sport_cubit.dart';
import 'package:betting_app/modules/home/widgets/league_square.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeagueMenu extends StatelessWidget {
  const LeagueMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportCubit, SportState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: state.leagueList.map((league) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: GestureDetector(
                      onTap: () {
                        context.read<SportCubit>().selectedLeague(league);
                      },
                      child: LeagueSquare(
                        leagueName: league.title,
                        leagueFlag: league.image,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
