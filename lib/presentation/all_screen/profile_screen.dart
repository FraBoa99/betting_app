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
                  ),
                ),
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<NavigationCubit>().navigateToSettings();
                    },
                    icon: const Icon(Icons.settings, color: Colors.white),
                  )
                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, right: 12.0, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi ${user?.name ?? 'Default name'}!',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Divider(
                        color: Color.fromARGB(255, 106, 105, 105),
                        thickness: 0.55,
                        indent: 5,
                        endIndent: 15,
                      ),
                      const SizedBox(height: 22),
                      StatItem(
                          label: 'Balance',
                          value: '${user?.balance ?? '0,00'} €'),
                      StatItem(
                          label: 'Total bets placed',
                          value: '${user?.betsCount ?? '0'}'),
                      StatItem(
                          label: 'Won bets',
                          value: '${user?.winningBets ?? '0'}'),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String label;
  final String value;

  const StatItem({
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
