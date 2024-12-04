import 'package:betting_app/bloc/settings/bookmakers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NationSquare extends StatelessWidget {
  final CountryOptions nameNation;
  const NationSquare({required this.nameNation, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmakersCubit, BookmakersState>(
        builder: (context, state) {
      return GestureDetector(
        child: SizedBox(
          height: 50,
          width: 50,
          child: Card(
            color: nameNation == state.country ? Colors.red : Colors.white,
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                // SvgPicture.asset(e) DA AGGIUNGERE
                Center(child: Text(nameNation.name)),
              ],
            ),
          ),
        ),
        onTap: () {
          context.read<BookmakersCubit>().setCountry(nameNation);
        },
      );
    });
  }
}
