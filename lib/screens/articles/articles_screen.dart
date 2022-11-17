import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/domain/publication.dart';
import 'bloc/articles_cubit.dart';
import 'views/articles_screen_view.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({
    Key? key,
    required this.publication,
  }) : super(key: key);

  final Publication publication;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ArticlesCubit(context.read())..fetchArticles(publication.url),
      child: Scaffold(
        appBar: AppBar(
          title: Text(publication.name),
        ),
        body: const ArticlesScreenView(),
      ),
    );
  }
}
