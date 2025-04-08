import 'package:betting_app/core/config/theme/app_colors.dart';
import 'package:betting_app/logic/cubit/user/user_cubit.dart';
import 'package:betting_app/logic/cubit/user/user_state.dart';
import 'package:betting_app/presentation/all_screen/home_screens/guest_view.dart';
import 'package:betting_app/presentation/all_screen/home_screens/home_view.dart';
import 'package:betting_app/presentation/all_widget/widget/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../all_widget/widget/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: AppColors.bgHome,
          appBar: const CustomAppBar(),
          body: const Stack(children: [
            SafeArea(
                bottom: false,
                child: UserState is UserLoaded ? HomeView() : GuestView()),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomNavigationBar(),
            )
          ]),
        );
      },
    );
  }
}
