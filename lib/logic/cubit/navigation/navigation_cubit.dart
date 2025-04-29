// 📦 Package imports:
// 🌎 Project imports:
import 'package:betting_app/logic/cubit/navigation/bottom_nav_cubit.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final BottomNavCubit _bottomNavCubit;
  NavigationCubit(this._bottomNavCubit) : super(NavigationWrappedHome());

  void navigateToWrappedHome() {
    _bottomNavCubit.setIndex(0);
    emit(NavigationWrappedHome());
  }

  void navigateToProfile() {
    emit(NavigationProfile());
    _bottomNavCubit.setIndex(3);
  }

  void navigateToUserHome() => emit(NavigationUserHome());
  void navigateToGuestHome() => emit(NavigationGuestHome());
  void navigateToLogin() => emit(NavigationLogin());
  void navigateToSignupPage() => emit(NavigationSignupPage());

  void navigateToCrateAccount() => emit(NavigationCreateAccountPage());
  void navigateToSettings() => emit(NavigationSettingPage());
}
