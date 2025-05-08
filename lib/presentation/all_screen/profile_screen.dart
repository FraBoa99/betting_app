import 'package:betting_app/logic/cubit/navigation/navigation_cubit.dart';
import 'package:betting_app/logic/cubit/user/user_cubit.dart';
import 'package:betting_app/logic/cubit/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is! UserLoaded) {
          context.read<NavigationCubit>().navigateToGuestHome();
        }
      },
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            final user = state.user;
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 38, 43, 46),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 38, 43, 46),
                leading: IconButton(
                    onPressed: () {
                      context.read<NavigationCubit>().navigateToWrappedHome();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                title: const Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        context.read<NavigationCubit>().navigateToSettings();
                      },
                      icon: const Icon(Icons.settings, color: Colors.white))
                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, right: 12.0, top: 15),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Ciao ${user?.name ?? 'Default name'}!',
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        color: Color.fromARGB(
                            255, 106, 105, 105), // Colore del separatore
                        thickness: 0.55, // Spessore del separatore
                        indent: 5, // Distanza dal bordo sinistro
                        endIndent: 15, // Distanza dal bordo destro
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Balance',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Text(
                            '${user?.balance ?? '0,00 €'} €',
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Total bets placed',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          const Spacer(),
                          Text(
                            '${user?.betsCount ?? '0'}',
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          // Se l'utente è ancora in stato di loading o altro, non fare niente
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
