import 'package:dio/dio.dart';

import '../../local/local.dart';
import '../../local/local_storage_key.dart';

class AuthenticationInterceptor extends Interceptor {
  final LocalStorage localStorage;

  AuthenticationInterceptor(this.localStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${localStorage.getString(LocalStorageKey.token)}';
    handler.next(options);
  }
}
