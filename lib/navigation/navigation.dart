import 'package:flutter/material.dart';

import '../screens/home/home.dart';
import '../screens/login/login.dart';

abstract class AppRoutes {
  static const login = 'login';
  static const home = 'home';
}

abstract class AppNavigation {
  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return AppPageRoute((_) => const HomeScreen(), settings);
      case AppRoutes.login:
        return AppPageRoute((_) => const LoginScreen(), settings);
      default:
        throw 'Cannot find destination route';
    }
  }
}

/// This function ensures the RouteSettings parameter will be pass into a destination route
/// to make sure every destination has a settings
// ignore: non_constant_identifier_names
MaterialPageRoute<T> AppPageRoute<T>(
  Widget Function(BuildContext context) builder,
  RouteSettings settings, {
  bool maintainState = true,
  bool fullscreenDialog = false,
}) =>
    MaterialPageRoute(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
