import 'dart:core';

import 'package:betting_app/core/repository/auth_repository.dart';
import 'package:betting_app/data/models/local_user.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  late String _verificationId;

  AuthCubit(this._authRepository) : super(AuthInitial());

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
      return state.user;
    }
    return null;
  }

  // === EMAIL CREATE ACCOUNT ===
  Future<void> createAccountWithEmail(LocalUser user, String password) async {
    emit(AuthLoading());
    try {
      final userCredential =
          await _authRepository.createUserWithEmail(user.email, password);

      if (userCredential != null && userCredential.user != null) {
        emit(AuthSuccess(userCredential.user!, 'email'));

        LocalUser newUser = user.copyWith(uid: userCredential.user!.uid);

        await _authRepository.saveUserToFirestore(newUser);
      } else {
        emit(AuthError(
            'Errore nella fase di regstrazione. Controllare la rete internet e riprovare.'));

        Future.delayed(const Duration(seconds: 2), () {
          emit(AuthInitial());
        });
      }
    } catch (e) {
      emit(AuthError(e.toString()));

      Future.delayed(const Duration(seconds: 2), () {
        emit(AuthInitial());
      });
    }
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

  // === PHONE SIGN IN (OTP SIGN IN)===  'sendCode()' è la funzione che invoca questo metodo.
  Future<void> signInWithOTP(String otp) async {
    try {
      final user = await _authRepository.signInWithOTP(_verificationId, otp);
      if (user != null) {
        emit(AuthSuccess(user, 'phone_number'));
      } else {
        emit(AuthError(
            'Errore durante il processo di login. Controllare la rete internet e riprovare.'));
        Future.delayed(const Duration(seconds: 2), () {
          emit(AuthInitial());
        });
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      Future.delayed(const Duration(seconds: 2), () {
        emit(AuthInitial());
      });
    }
  }

  // === EMAIL SIGN IN ===
  Future<void> signInWithEmail(String email, String password) async {
    try {
      emit(AuthLoading());
      final firebaseUser =
          await _authRepository.signInWithEmail(email, password);
      if (firebaseUser != null) {
        emit(AuthSuccess(firebaseUser, 'email'));
      } else {
        emit(AuthError('Utente non trovato'));
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

// === GOOGLE ===
  /*
  Future<void> signInWithGoogle() async {
     emit(AuthLoading());
    try {
      final firebaseUser = await _authRepository.signInWithGoogle();
      if (firebaseUser != null) {
        if (await _userRepository.isUserRegistered(firebaseUser.uid)) {
          emit(AuthSuccess(firebaseUser, 'google'));
        } else {
          emit(AuthSuccess(firebaseUser, 'google'));
        }
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }*/
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

  Future<void> signOutAccount() async {
    emit(AuthLoading());
    try {
      await _authRepository.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(AuthInitial());
    }
  }
}
