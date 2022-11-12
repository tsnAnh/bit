import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import '../../models/domain/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.mediumRepository) : super(UserInitial());

  final MediumRepository mediumRepository;

  void getUserInfo() async {
    final userInfoEither = await mediumRepository.getUserInfo();
    userInfoEither.fold(
      ifLeft: (error) {
        emit(const UserNotFetched());
      },
      ifRight: (user) {
        emit(UserFetched(user));
      },
    );
  }
}
