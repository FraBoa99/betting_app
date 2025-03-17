import 'package:betting_app/logic/cubit/navigation/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  void navigateToHome() => emit(NavigationHome());
  void navigateToLogin() => emit(NavigationLogin());
  void navigateToRegister() => emit(NavigationRegister());
  void navigateToProfile() => emit(NavigationProfile());
}
