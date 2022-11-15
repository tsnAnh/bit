import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/extensions/context.dart';
import '../../../l10n/l10n.dart';
import '../../../models/domain/article.dart';
import '../../../navigation/navigation.dart';
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
            return _TodayArticleItem(key: Key(article.guid), article: article);
          },
        );
      },
    );
  }
}

class _TodayArticleItem extends StatelessWidget {
  const _TodayArticleItem({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.details, arguments: article);
      },
      child: Hero(
        tag: article.title,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 240,
              child: CachedNetworkImage(
                imageUrl: article.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
            const _TodayArticleItemBackgroundScrim(),
            _TodayArticleItemDetails(article: article)
          ],
        ),
      ),
    );
  }
}

class _TodayArticleItemDetails extends StatelessWidget {
  const _TodayArticleItemDetails({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TodayArticleItemTopDetails(article: article),
            const Spacer(),
            _TodayArticleItemBottomDetails(article: article)
          ],
        ),
      ),
    );
  }
}

class _TodayArticleItemBottomDetails extends StatelessWidget {
  const _TodayArticleItemBottomDetails({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          article.title,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: context.theme.brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _TodayArticleItemTopDetails extends StatelessWidget {
  const _TodayArticleItemTopDetails({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            article.publication.split('-')[0],
            style: TextStyle(
              color: context.theme.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class _TodayArticleItemBackgroundScrim extends StatelessWidget {
  const _TodayArticleItemBackgroundScrim({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: (context.theme.brightness == Brightness.light
                ? Colors.white
                : Colors.black)
            .withOpacity(.4),
      ),
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
