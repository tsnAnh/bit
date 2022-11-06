import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'app_flavor.dart';
import 'bootstrap.dart';
import 'data/remote/dio.dart';
import 'di/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dioClient = DioClient(baseUrl: AppFlavor.production.baseUrl);

  final serviceLocator = ServiceLocator.instance;
  serviceLocator.registerSingleton(dioClient);
  serviceLocator.configureNetworkModule(AppFlavor.production);

  bootstrap();
}
