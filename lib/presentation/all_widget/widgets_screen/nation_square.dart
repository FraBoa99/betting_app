// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:betting_app/logic/cubit/settings/bookmakers_cubit.dart';

class NationSquare extends StatelessWidget {
  final CountryOptions nameNation;
  const NationSquare({required this.nameNation, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmakersCubit, BookmakersState>(
        builder: (context, state) {
      return GestureDetector(
        child: Container(
          height: 45,
          color: nameNation == state.country
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
                child: Text(nameNation.name.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ],
          ),
        ),
        onTap: () {
          context.read<BookmakersCubit>().setCountry(nameNation);
        },
      );
    });
  }
}
