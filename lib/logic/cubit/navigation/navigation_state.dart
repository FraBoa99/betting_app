abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationHome extends NavigationState {}

class NavigationLogin extends NavigationState {}

class NavigationRegister extends NavigationState {}

class NavigationProfile extends NavigationState {}

class NavigationLoading extends NavigationState {}

class NavigationAuthenticated extends NavigationState {}

class NavigationUnauthenticated extends NavigationState {}

class NavigationError extends NavigationState {
  final String message;
  NavigationError(this.message);
}
