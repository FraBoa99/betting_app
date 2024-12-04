import 'package:betting_app/bloc/settings/bookmakers_cubit.dart';
import 'package:betting_app/constants/assets/assets.dart';
import 'package:betting_app/models/bookmaker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BookmakerSquare extends StatelessWidget {
  final Bookmaker bookmaker;
  final CountryOptions bookmakerCountry;

  const BookmakerSquare(
      {super.key, required this.bookmaker, required this.bookmakerCountry});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmakersCubit, BookmakersState>(
        builder: (context, state) {
      return GestureDetector(
        child: SizedBox(
          width: 100,
          height: 75,
          child: Card(
            color: bookmaker == state.selectedBookmaker[bookmakerCountry]
                ? Colors.red
                : Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    width: 60,
                    height: 50,
                    bookmaker.image ?? Assets.imagesAppFileError,
                  ),
                ),
                Text(bookmaker.title),
              ],
            ),
          ),
        ),
        onTap: () {
          context
              .read<BookmakersCubit>()
              .setBookmaker(bookmaker, bookmakerCountry);
        },
      );
    });
  }
}
