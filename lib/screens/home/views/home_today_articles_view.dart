import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/extensions/context.dart';
import '../../../l10n/l10n.dart';
import '../../../navigation/navigation.dart';
import '../../../widgets/article_item_view.dart';
import '../bloc/home_bloc.dart';

class HomeTodayArticlesListView extends StatelessWidget {
  const HomeTodayArticlesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TodayArticlesText(),
        _TodayArticlesList(),
      ],
    );
  }
}

class _TodayArticlesList extends StatelessWidget {
  const _TodayArticlesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 2,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.articles.length,
          itemBuilder: (context, index) {
            final article = state.articles[index];
            return ArticleItemView(
              key: Key(article.guid),
              article: article,
              onItemClicked: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.details, arguments: article);
              },
            );
          },
        );
      },
    );
  }
}

class _TodayArticlesText extends StatelessWidget {
  const _TodayArticlesText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        context.l10n.text_today_articles.toLowerCase(),
        style: context.textTheme.titleMedium?.copyWith(
          color: context.theme.brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
      ),
    );
  }
}
