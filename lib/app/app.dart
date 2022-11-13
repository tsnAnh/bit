import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/authentication/authentication_cubit.dart';
import '../blocs/user/user_cubit.dart';
import '../di/service_locator.dart';
import '../domain/domain.dart';
import '../l10n/l10n.dart';
import '../navigation/navigation.dart';
import '../theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MediumRepository>(
          create: (BuildContext context) =>
              ServiceLocator.instance.inject<MediumRepository>(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthenticationCubit(ServiceLocator.instance.inject()),
          ),
          BlocProvider<UserCubit>(
            create: (context) =>
                UserCubit(context.read(), ServiceLocator.instance.inject()),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: AppNavigation.onGeneratedRoute,
      initialRoute: context.read<AuthenticationCubit>().state != null
          ? AppRoutes.home
          : AppRoutes.login,
    );
  }
}
