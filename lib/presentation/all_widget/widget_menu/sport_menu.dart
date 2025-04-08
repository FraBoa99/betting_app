// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:betting_app/data/constants/list_of_sports.dart';
import 'package:betting_app/data/models/sport.dart';
import 'package:betting_app/logic/cubit/home/sport_cubit.dart';
import 'package:betting_app/presentation/all_widget/widgets_screen/sport_square.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
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
              padding: const EdgeInsets.symmetric(horizontal: 8),
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
