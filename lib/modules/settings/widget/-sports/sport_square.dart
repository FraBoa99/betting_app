import 'package:betting_app/modules/bets/models/sport.dart';
import 'package:betting_app/modules/settings/cubit/sports_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportSquare extends StatelessWidget {
  final Sport sport;
  const SportSquare({super.key, required this.sport});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportsSettingsCubit, SportsSettingsState>(
        builder: (context, state) {
      return GestureDetector(
        child: Container(
          height: 45,
          color: sport == state.sport
              ? const Color.fromARGB(255, 212, 244, 54)
              : Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 8.2,
                    spreadRadius: 1.5,
                  ),
                ]),
                child: Text(sport.title.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ],
          ),
        ),
        onTap: () {
          context.read<SportsSettingsCubit>().setSport(sport);
        },
      );
    });
  }
}
