import 'package:flutter/material.dart';

import '../models/domain/article.dart';
import '../screens/details/details.dart';
import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/tutorial/tutorial.dart';

abstract class AppRoutes {
  static const tutorial = 'tutorial';
  static const login = 'login';
  static const home = 'home';
  static const details = 'details';
}

abstract class AppNavigation {
  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.tutorial:
        return AppPageRoute((_) => const TutorialScreen(), settings);
      case AppRoutes.home:
        return AppPageRoute((_) => const HomeScreen(), settings);
      case AppRoutes.login:
        return AppPageRoute((_) => const LoginScreen(), settings);
      case AppRoutes.details:
        return AppPageRoute(
          (context) => DetailsScreen(article: settings.arguments as Article),
          settings,
        );
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
