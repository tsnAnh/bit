import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../navigation/navigation.dart';
import '../../../widgets/article_item_view.dart';
import '../../../widgets/bit_circular_progress_bar.dart';
import '../bloc/articles_cubit.dart';

class ArticlesScreenView extends StatelessWidget {
  const ArticlesScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        if (state is ArticlesInitial) {
          return const BitCircularProgressBar();
        } else if (state is ArticlesError) {
          return Container();
        } else {
          final articlesFetched = state as ArticlesFetched;
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 2),
            itemCount: articlesFetched.articles.length,
            itemBuilder: (context, index) {
              final article = articlesFetched.articles[index];
              return ArticleItemView(
                key: Key(articlesFetched.articles[index].guid),
                article: articlesFetched.articles[index],
                onItemClicked: () => Navigator.of(context)
                    .pushNamed(AppRoutes.details, arguments: article),
              );
            },
          );
        }
      },
    );
  }
}
