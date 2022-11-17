import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../common/extensions/extensions.dart';
import '../models/domain/article.dart';

class ArticleItemView extends StatelessWidget {
  const ArticleItemView({
    Key? key,
    required this.article, required this.onItemClicked,
  }) : super(key: key);

  final Article article;
  final VoidCallback onItemClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemClicked,
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
