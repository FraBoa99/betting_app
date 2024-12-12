import 'package:betting_app/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthInitial());

  Future<void> checkAuthStatus() async {
    final user = await _authRepository.getCurrentUser();
    if (user != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthUnauthenticated());
    }
  }

  // === EMAIL ===
  Future<void> signInWithEmail(String email, String password) async {
    try {
      emit(AuthLoading());
      await _authRepository.signInWithEmail(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  //EMAIL
  Future<void> createAccountWithEmail(String email, String password) async {
    try {
      emit(AuthLoading());
      await _authRepository.createUserWithEmail(email, password);
      emit(AccountCreate());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

// === GOOGLE ===
  Future<void> signInWithGoogle() async {
    try {
      emit(AuthLoading());
      final ggUser = await _authRepository.signInWithGoogle();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

// === FACEBOOK ===
  Future<void> signinWithFacebook() async {
    try {
      emit(AuthLoading());
      final fbUser = await _authRepository.signinWithFacebook();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      emit(AuthLoading());
      await _authRepository.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
