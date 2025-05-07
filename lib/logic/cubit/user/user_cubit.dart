// 🎯 Dart imports:
import 'dart:async';

// 🌎 Project imports:
import 'package:betting_app/core/repository/user_repository.dart';
import 'package:betting_app/data/models/local_user.dart';
import 'package:betting_app/logic/cubit/authentication/auth_cubit.dart';
import 'package:betting_app/logic/cubit/authentication/auth_state.dart';
import 'package:betting_app/logic/cubit/user/user_state.dart';
// 📦 Package imports:
import 'package:bloc/bloc.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  final AuthCubit authCubit;
  late final StreamSubscription authSubscription;

  UserCubit({required this.userRepository, required this.authCubit})
      : super(const UserInitial()) {
    // Stream in ascolto su AuthCubit.
    authSubscription = authCubit.stream.listen((authState) {
      _handleAuthState(authState);
    });

    scheduleMicrotask(() => _handleAuthState(authCubit.state));
  }

  @override
  Future<void> close() {
    authSubscription.cancel();
    return super.close();
  }

  Future<void> updateUser(LocalUser user) async {
    if (state is UserLoaded) {
      final currentUser = (state as UserLoaded).user;
      if (currentUser != null) {
        emit(UserUpdating(currentUser));
      } else {
        emit(const UserError(
            'Updating failed, you are not loged in. Please login'));
      }
      try {
        //await userRepository.updateUser(user);
        emit(UserLoaded(user));
      } catch (e) {
        UserError(e.toString());
        rethrow;
      }
    }
  }

  Future<void> deleteUser(String uid) async {
    try {
      await userRepository.deleteUser(uid);
    } catch (e) {
      throw Exception('Errore durante l\'eliminazione dell\'utente: $e');
    }
  }

  void _handleAuthState(AuthState authState) async {
    if (authState is AuthSuccess) {
      try {
        await _loadUser();
      } catch (e) {
        emit(const UserError(
            'Errore nel caricamento dei dati. Chiudere e riaprire l app'));
        Future.delayed(const Duration(seconds: 2), () {
          emit(const UserInitial());
        });
      }
    } else {
      emit(const UserInitial());
    }
  }

  Future<void> _loadUser() async {
    emit(const UserLoading());
    try {
      String? uid;

      switch (authCubit.state) {
        case AuthSuccess(:final user):
          uid = user.uid;
        default:
          uid = null;
      }

      if (uid == null) {
        emit(const UserNotFound(false));
        return;
      }

      final user = await userRepository.getUserById(uid);
      if (user != null) {
        emit(UserLoaded(user));
      } else {
        emit(const UserNotFound(false));
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
