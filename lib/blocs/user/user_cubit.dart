import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/error.dart';
import '../../data/local/local.dart';
import '../../data/local/local_storage_key.dart';
import '../../domain/domain.dart';
import '../../models/domain/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.mediumRepository, this.storage) : super(UserInitial());

  final MediumRepository mediumRepository;
  final LocalStorage storage;

  Future<void> getUserInfo() async {
    final userInfoEither = await mediumRepository.getUserInfo();
    userInfoEither.fold(
      ifLeft: (error) {
        emit(UserNotFetched(error));
      },
      ifRight: (user) async {
        await storage.setString(LocalStorageKey.userId, user.id);
        emit(UserFetched(user));
      },
    );
  }
}
