// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// 🌎 Project imports:
import 'package:betting_app/constants/assets/assets.dart';
import 'package:betting_app/data/models/bookmaker.dart';
import 'package:betting_app/logic/cubit/settings/bookmakers_cubit.dart';

class BookmakerSquare extends StatefulWidget {
  final Bookmaker bookmaker;
  final CountryOptions bookmakerCountry;

  const BookmakerSquare({
    super.key,
    required this.bookmaker,
    required this.bookmakerCountry,
  });

  @override
  State<StatefulWidget> createState() => _BookmakerSquareState();
}

class _BookmakerSquareState extends State<BookmakerSquare> {
  var isSelected = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isSelected = context
            .watch<BookmakersCubit>()
            .state
            .selectedBookmaker[widget.bookmakerCountry] ==
        widget.bookmaker;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmakersCubit, BookmakersState>(
        builder: (context, state) {
      return GestureDetector(
        child: Column(
          children: [
            SizedBox(
              width: 110,
              height: 100,
              child: Card(
                color: isSelected
                    ? const Color.fromARGB(255, 212, 244, 54)
                    : Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      width: 60,
                      height: 60,
                      widget.bookmaker.image ?? Assets.appFileError,
                    ),
                  ],
                ),
              ),
            ),
            Text(widget.bookmaker.title),
          ],
        ),
        onTap: () {
          context
              .read<BookmakersCubit>()
              .setBookmaker(widget.bookmaker, widget.bookmakerCountry);
          setState(() {
            isSelected = !isSelected;
          });
        },
      );
    });
  }
}
