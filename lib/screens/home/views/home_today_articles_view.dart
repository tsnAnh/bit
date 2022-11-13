import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/extensions/context.dart';
import '../../../l10n/l10n.dart';
import '../../../navigation/navigation.dart';
import '../bloc/home_bloc.dart';

class HomeTodayArticlesListView extends StatelessWidget {
  const HomeTodayArticlesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            context.l10n.text_today_articles.toLowerCase(),
            style: context.textTheme.titleMedium?.copyWith(
              color: context.theme.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
        BlocBuilder<HomeBloc, HomeState>(
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
                final imageUrl = state.publications.isNotEmpty
                    ? state.publications
                            .firstWhereOrNull((element) =>
                                element.name.contains(article.publication))
                            ?.imageUrl ??
                        ''
                    : '';
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
                        Positioned.fill(
                          child: Container(
                            color: (context.theme.brightness == Brightness.light
                                    ? Colors.white
                                    : Colors.black)
                                .withOpacity(.4),
                          ),
                        ),
                        Positioned.fill(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        article.publication.split('-')[0],
                                        style: TextStyle(
                                          color: context.theme.brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      article.title,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: context.theme.brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
