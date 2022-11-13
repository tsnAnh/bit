import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../blocs/user/user_cubit.dart';
import 'bloc/home_bloc.dart';
import 'views/home_publications_view.dart';
import 'views/home_screen_app_bar.dart';
import 'views/home_today_articles_view.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<UserCubit>().getUserInfo();
      return null;
    });
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(context.read())..add(LoadHome()),
        ),
      ],
      child: Scaffold(
        appBar: const HomeScreenAppBar(),
        body: ListView(
          children: const [
            HomePublicationsView(),
            SizedBox(
              height: 8,
            ),
            HomeTodayArticlesListView(),
          ],
        ),
      ),
    );
  }
}
