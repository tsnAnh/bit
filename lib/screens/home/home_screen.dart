import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../blocs/user/user_cubit.dart';
import 'views/home_screen_app_bar.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(context.read())..getUserInfo(),
      child: Scaffold(
        appBar: const HomeScreenAppBar(),
        body: SafeArea(
          child: Container(),
        ),
      ),
    );
  }
}
