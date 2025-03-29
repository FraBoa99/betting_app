// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  List<String> options = ['Theme', 'Sport', 'Bookmakers'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 38, 43, 46),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 38, 43, 46),
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                context.read<NavigationCubit>().navigateToWrappedHome();
              },
            )
          ],
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.grey, // Colore del separatore
              thickness: 1, // Spessore del separatore
              indent: 16, // Distanza dal bordo sinistro
              endIndent: 16, // Distanza dal bordo destro
            );
          },
          itemCount: options.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: ListTile(
                leading: Text(
                  options[index],
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
              onTap: () {
                switch (index) {
                  case 0:
                    break;
                  case 1:
                  case 2:
                  default:
                }
              },
            );
          },
        ));
  }
}
