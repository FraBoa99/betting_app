import 'package:betting_app/logic/cubit/user/user_cubit.dart';
import 'package:betting_app/logic/cubit/user/user_state.dart';
import 'package:betting_app/presentation/screen/home_screens/guest_home.dart.dart';
import 'package:betting_app/presentation/screen/home_screens/user_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          if (state.user != null) {
            var user = state.user!;
            return UserHome(user: user);
          } else {
            return const GuestHome();
          }
        } else {
          return const GuestHome();
        }
      },
    );
  }
}
