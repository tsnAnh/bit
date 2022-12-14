part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserFetched extends UserState {
  final User user;

  const UserFetched(this.user);

  @override
  List<Object?> get props => [user];
}

class UserNotFetched extends UserState {
  const UserNotFetched(this.error);

  final DataSourceError error;

  @override
  List<Object?> get props => [];
}
