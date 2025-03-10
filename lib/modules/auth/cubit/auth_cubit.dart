import 'package:betting_app/modules/auth/repository/auth_repository.dart';
import 'package:betting_app/modules/user/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  late String _verificationId;

  AuthCubit(this._authRepository, this._userRepository) : super(AuthInitial());

  void emitCurrentState() {
    emit(state);
  }

  Future<void> checkAuthStatus() async {
    final user = await _authRepository.getCurrentUser();
    if (user != null) {
      //emit(AuthSuccess());
    } else {
      emit(AuthUnauthenticated());
    }
  }

  User? get currentUser {
    final state = this.state;
    if (state is AuthSuccess) {
      return state.firebaseUser;
    }
    return null;
  }

  // === PHONE SIGN IN (SEND CODE)===
  Future<void> sendCode(String phoneNumber) async {
    emit(AuthLoading());
    try {
      _verificationId = await _authRepository.verifyPhoneNumber(phoneNumber);
      //emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // === PHONE SIGN IN (OTP SIGN IN)===
  Future<void> signInWithOTP(String otp) async {
    emit(AuthLoading());
    try {
      await _authRepository.signInWithOTP(_verificationId, otp);
      //emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // === EMAIL SIGN IN ===
  Future<void> signInWithEmail(String email, String password) async {
    try {
      emit(AuthLoading());
      final firebaseUser =
          await _authRepository.signInWithEmail(email, password);
      if (firebaseUser != null) {
        if (await _userRepository.isUserRegistered(firebaseUser.uid)) {
          emit(AuthSuccess(firebaseUser, false, 'email'));
        } else {
          emit(AuthSuccess(firebaseUser, true, 'email'));
        }
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // === EMAIL CREATE ACCOUNT ===
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
      final firebaseUser = await _authRepository.signInWithGoogle();
      if (firebaseUser != null) {
        if (await _userRepository.isUserRegistered(firebaseUser.uid)) {
          emit(AuthSuccess(firebaseUser, false, 'google'));
        } else {
          emit(AuthSuccess(firebaseUser, true, 'google'));
        }
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

// === FACEBOOK ===
  Future<void> signinWithFacebook() async {
    try {
      emit(AuthLoading());
      final fbUser = await _authRepository.signinWithFacebook();
      //emit(AuthSuccess());
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
