import 'package:betting_app/bloc/settings/bookmakers_cubit.dart';
import 'package:betting_app/core/navigation/app_routes.dart';
import 'package:betting_app/widgets/settings/bookmaker/bookmaker_square.dart';
import 'package:betting_app/widgets/settings/bookmaker/nation_square.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmakersSettings extends StatefulWidget {
  const BookmakersSettings({super.key});

  @override
  State<StatefulWidget> createState() => _BookmakersSettingsState();
}

class _BookmakersSettingsState extends State<BookmakersSettings> {
  bool isGridDisabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 38, 43, 46),
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
          isGridDisabled = state.visual == VisualOptions.custom ? false : true;
          return Column(
            children: [
              ListTile(
                title: const Text('Standard'),
                subtitle: const Text(
                    'Bookmakers will be chosen in alphabetical order'),
                leading: Radio<VisualOptions>(
                  value: VisualOptions.alphabetical,
                  groupValue: state.visual,
                  onChanged: (VisualOptions? options) {
                    context.read<BookmakersCubit>().setVisual(options!);
                    setState(() {
                      isGridDisabled = true;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Custom'),
                leading: Radio<VisualOptions>(
                  value: VisualOptions.custom,
                  groupValue: state.visual,
                  onChanged: (VisualOptions? options) {
                    context.read<BookmakersCubit>().setVisual(options!);
                    setState(() {
                      isGridDisabled = false;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 15),
                child: Opacity(
                  opacity: isGridDisabled ? 0.04 : 1.00,
                  child: IgnorePointer(
                    ignoring: isGridDisabled,
                    child: const Row(
                      children: [
                        NationSquare(nameNation: CountryOptions.eu),
                        SizedBox(
                          width: 20,
                        ),
                        NationSquare(nameNation: CountryOptions.us),
                        SizedBox(
                          width: 20,
                        ),
                        NationSquare(nameNation: CountryOptions.au),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Opacity(
                  opacity: isGridDisabled ? 0.04 : 1.00,
                  child: IgnorePointer(
                    ignoring: isGridDisabled,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 0.0,
                        crossAxisSpacing: 0.0,
                      ),
                      itemCount: state.bookmakersList.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: BookmakerSquare(
                            bookmaker: state.bookmakersList[index],
                            bookmakerCountry: state.country,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
