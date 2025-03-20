import 'package:betting_app/logic/cubit/navigation/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationHome());

  void navigateToHome() => emit(NavigationHome());
  void navigateToLogin() => emit(NavigationLogin());
  void navigateToSignupPage() => emit(NavigationSignupPage());
  void navigateToProfile() => emit(NavigationProfile());
  void navigateToCrateAccount() => emit(NavigationCreateAccountPage());
}
