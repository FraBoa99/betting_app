import 'package:betting_app/logic/cubit/navigation/bottom_nav_cubit.dart';
import 'package:betting_app/logic/cubit/navigation/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final BottomNavCubit _bottomNavCubit;
  NavigationCubit(this._bottomNavCubit) : super(NavigationWrappedHome());

  void navigateToWrappedHome() {
    _bottomNavCubit.setIndex(0);
    emit(NavigationWrappedHome());
  }

  void navigateToUserHome() => emit(NavigationUserHome());
  void navigateToGuestHome() => emit(NavigationGuestHome());
  void navigateToLogin() => emit(NavigationLogin());
  void navigateToSignupPage() => emit(NavigationSignupPage());
  void navigateToProfile() => emit(NavigationProfile());
  void navigateToCrateAccount() => emit(NavigationCreateAccountPage());
  void navigateToSettings() => emit(NavigationSettingPage());
}
