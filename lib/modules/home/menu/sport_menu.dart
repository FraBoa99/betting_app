import 'package:betting_app/modules/bets/models/sport.dart';
import 'package:betting_app/modules/home/cubit/sport_cubit.dart';
import 'package:betting_app/modules/home/widgets/sport_square.dart';
import 'package:betting_app/resources/list_of_sports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportMenu extends StatelessWidget {
  final List<Sport> sportList = [
    SportList.soccer,
    SportList.basket,
    SportList.tennis,
    SportList.football,
  ];

  SportMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: sportList.map((sport) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: GestureDetector(
                  onTap: () {
                    context.read<SportCubit>().selectedSport(sport);
                  },
                  child: SportSquare(sportName: sport.title)),
            ),
          ],
        );
      }).toList(),
    );
  }
}
