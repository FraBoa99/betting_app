// 📦 Package imports:
// 🌎 Project imports:
import 'package:betting_app/logic/cubit/authentication/auth_cubit.dart';
import 'package:betting_app/logic/cubit/authentication/auth_state.dart';
import 'package:betting_app/logic/cubit/navigation/bottom_nav_cubit.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_state.dart';
import 'package:betting_app/logic/cubit/user/user_cubit.dart';
import 'package:betting_app/logic/cubit/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final BottomNavCubit bottomNavCubit;
  final AuthCubit authCubit;
  final UserCubit userCubit;

  NavigationCubit(
      {required this.bottomNavCubit,
      required this.authCubit,
      required this.userCubit})
      : super(NavigationWrappedHome());

  void navigateToWrappedHome() {
    bottomNavCubit.setIndex(0);
    emit(NavigationWrappedHome());
  }

  void navigateToProfileIfAuthenticated() {
    if (authCubit.state is AuthSuccess && userCubit.state is UserLoaded) {
      emit(NavigationProfile());
      bottomNavCubit.setIndex(3);
    } else {
      emit(NavigationSignupPage());
    }
  }

  void navigateToUserHome() => emit(NavigationUserHome());
  void navigateToGuestHome() => emit(NavigationGuestHome());

  void navigateToLogin() => emit(NavigationLogin());
  void navigateToSignupPage() => emit(NavigationSignupPage());
  void navigateToCrateAccount() => emit(NavigationCreateAccountPage());

  void navigateToSettings() => emit(NavigationSettingPage());
}
