// 🐦 Flutter imports:

// 🌎 Project imports:
import 'package:betting_app/logic/cubit/user/user_cubit.dart';
import 'package:betting_app/logic/cubit/user/user_state.dart';
import 'package:betting_app/presentation/all_screen/home_screens/guest_home.dart.dart';
import 'package:betting_app/presentation/all_screen/home_screens/user_home.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
// 📦 Package imports:
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
