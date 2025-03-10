import 'package:betting_app/modules/user/cubit/user_state.dart';
import 'package:betting_app/modules/user/cubit/model/local_user.dart';
import 'package:betting_app/modules/user/repository/user_repository.dart';
import 'package:bloc/bloc.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit(this.userRepository) : super(const UserInitial());

  Future<void> createUser(LocalUser user) async {
    emit(const UserInitial());
    try {
      await userRepository.createUser(user);
      emit(UserLoaded(user));
    } catch (e) {
      UserError(e.toString(), false);
      rethrow;
    }
  }

  Future<void> updateUser(LocalUser user) async {
    if (state is UserLoaded) {
      final currentUser = (state as UserLoaded).user;
      if (currentUser != null) {
        emit(UserUpdating(currentUser));
      } else {
        emit(const UserError(
            'Updating failed, you are not loged in. Please login', true));
      }
      try {
        await userRepository.updateUser(user);
        emit(UserLoaded(user));
      } catch (e) {
        UserError(e.toString(), false);
        rethrow;
      }
    }
  }

  Future<void> loadUser(String uid) async {
    emit(const UserLoading());
    try {
      final user = await userRepository.getUser();
      if (user != null) {
        emit(UserLoaded(user));
      } else {
        emit(const UserNotFound(true));
      }
    } catch (e) {
      emit(UserError(e.toString(), true));
      rethrow;
    }
  }

  Future<void> deleteUser(String uid) async {
    try {
      await userRepository.deleteUser(uid);
    } catch (e) {
      throw Exception('Errore durante l\'eliminazione dell\'utente: $e');
    }
  }

  Future<bool> isUserRegistered(String uid) async {
    return await userRepository.isUserRegistered(uid);
  }
}
