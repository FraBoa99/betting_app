import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {}

class NavigationHome extends NavigationState {}

class NavigationLogin extends NavigationState {}

class NavigationSignupPage extends NavigationState {}

class NavigationCreateAccountPage extends NavigationState {}

class NavigationSettingPage extends NavigationState {}

class NavigationProfile extends NavigationState {}

class NavigationLoading extends NavigationState {}

class NavigationAuthenticated extends NavigationState {}

class NavigationUnauthenticated extends NavigationState {}

class NavigationError extends NavigationState {
  final String message;
  const NavigationError(this.message);
}
