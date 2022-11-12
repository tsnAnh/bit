import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../data/local/local.dart';
import '../../data/local/local_storage_key.dart';

class AuthenticationCubit extends HydratedCubit<String?> {
  AuthenticationCubit(this.localStorage) : super(null);

  final LocalStorage localStorage;

  void setToken(String token) {
    localStorage.setString(LocalStorageKey.token, token);
    emit(token);
  }

  void unsetToken() {
    localStorage.remove(LocalStorageKey.token);
    emit(null);
  }

  @override
  String? fromJson(Map<String, dynamic> json) =>
      json[LocalStorageKey.token] as String?;

  @override
  Map<String, dynamic>? toJson(String? state) => {LocalStorageKey.token: state};
}
