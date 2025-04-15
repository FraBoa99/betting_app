// 🐦 Flutter imports:
// 🌎 Project imports:
import 'package:betting_app/data/constants/list_of_sports.dart';
import 'package:betting_app/data/models/sport.dart';
import 'package:betting_app/logic/cubit/home/sport_cubit.dart';
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
    final selectedSport = context.watch<SportCubit>().state.selectedSport;

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 25,
        children: sportList.map((sport) {
          return GestureDetector(
              onTap: () {
                context.read<SportCubit>().selectedSport(sport);
              },
              child: Text(
                sport.title,
                style: sport == selectedSport
                    ? const TextStyle(fontSize: 21, fontWeight: FontWeight.w700)
                    : const TextStyle(
                        fontSize: 21, fontWeight: FontWeight.w300),
              ));
        }).toList(),
      ),
    );
  }
}
