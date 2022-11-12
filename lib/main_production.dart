import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_flavor.dart';
import 'bootstrap.dart';
import 'data/local/local.dart';
import 'data/remote/remote.dart';
import 'di/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPrefs = await SharedPreferences.getInstance();
  final serviceLocator = ServiceLocator.instance;
  serviceLocator.registerSingleton<LocalStorage>(LocalStorageImpl(sharedPrefs));
  serviceLocator
      .registerSingleton(AuthenticationInterceptor(serviceLocator.inject()));
  final dioClient = DioClient(
    baseUrl: AppFlavor.staging.baseUrl,
    authenticationInterceptor: serviceLocator.inject(),
  );

  serviceLocator.registerSingleton(dioClient);
  serviceLocator.configureNetworkModule(AppFlavor.production);

  bootstrap();
}
