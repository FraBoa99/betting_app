import 'package:betting_app/logic/cubit/authentication/auth_cubit.dart';
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
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(user?.name ?? 'Default name'),
                    IconButton(
                        onPressed: () {
                          context.read<AuthCubit>().signOut();
                        },
                        icon: const Icon(Icons.logout))
                  ],
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
