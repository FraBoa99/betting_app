import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User firebaseUser;
  final String provider;
  final bool newUser;

  AuthSuccess(this.firebaseUser, this.newUser, this.provider);
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(
    this.message,
  );
}

class AccountCreate extends AuthState {}
