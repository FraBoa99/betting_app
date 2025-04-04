// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:betting_app/logic/cubit/home/sport_cubit.dart';
import 'package:betting_app/presentation/all_widget/widgets_screen/league_square.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
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
                spacing: 15,
                children: state.leagueList.map((league) {
                  return GestureDetector(
                    onTap: () {
                      context.read<SportCubit>().selectedLeague(league);
                    },
                    child: LeagueWidget(
                      leagueKey: league.key,
                      leagueFlag: league.image,
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
