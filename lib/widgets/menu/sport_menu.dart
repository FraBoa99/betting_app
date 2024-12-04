import 'package:betting_app/bloc/ui/sport_cubit.dart';
import 'package:betting_app/widgets/menu/square/sport_square.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Sports { calcio, basket, tennis, football }

class SportMenu extends StatelessWidget {
  final List<String> sportList = Sports.values.map((e) => e.name).toList();

  SportMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: sportList.map((sport) {
        return Row(
          children: [
            GestureDetector(
                onTap: () {
                  context.read<SportCubit>().selectedSport(sport);
                  print('Hai premuto $sport');
                },
                child: SportSquare(sportName: sport)),
            const SizedBox(
              width: 15,
            )
          ],
        );
      }).toList(),
    );
  }
}
