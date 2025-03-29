// 📦 Package imports:
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import 'package:betting_app/data/models/local_user.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserUpdating extends UserState {
  final LocalUser user;

  const UserUpdating(this.user);

  @override
  List<Object?> get props => [user];
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final LocalUser? user;

  const UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class UserDeleted extends UserState {
  final String userId;
  final String confirmationCode;
  final DateTime timestamp;

  const UserDeleted({
    required this.userId,
    required this.confirmationCode,
    required this.timestamp,
  });
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object?> get props => [message];
}

class UserNotFound extends UserState {
  final bool relogin;

  const UserNotFound(
    this.relogin,
  );
}
