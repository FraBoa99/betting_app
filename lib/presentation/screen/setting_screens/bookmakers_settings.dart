import 'package:betting_app/core/app_routes.dart';
import 'package:betting_app/logic/cubit/settings/bookmakers_cubit.dart';
import 'package:betting_app/presentation/widget/bookmakers/bookmaker_square.dart';
import 'package:betting_app/presentation/widget/bookmakers/nation_square.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmakersSettings extends StatefulWidget {
  const BookmakersSettings({super.key});

  @override
  State<StatefulWidget> createState() => _BookmakersSettingsState();
}

class _BookmakersSettingsState extends State<BookmakersSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Bookmakers',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
            },
          )
        ],
      ),
      body: BlocBuilder<BookmakersCubit, BookmakersState>(
        builder: (context, state) {
          return Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: NationSquare(nameNation: CountryOptions.eu)),
                  Expanded(child: NationSquare(nameNation: CountryOptions.us)),
                  Expanded(child: NationSquare(nameNation: CountryOptions.au)),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 0, right: 0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 130),
                    itemCount: state.bookmakersList.length,
                    itemBuilder: (context, index) {
                      return BookmakerSquare(
                        bookmaker: state.bookmakersList[index],
                        bookmakerCountry: state.country,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
