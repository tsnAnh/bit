import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../common/colors.dart';
import '../../../common/extensions/extensions.dart';
import '../../../l10n/l10n.dart';
import '../../../models/domain/publication.dart';
import '../../../widgets/bit_circular_progress_bar.dart';
import '../bloc/home_bloc.dart';

class HomePublicationsView extends HookWidget {
  const HomePublicationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            context.l10n.text_publications.toLowerCase(),
            style: context.textTheme.titleMedium?.copyWith(
              color: context.theme.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
        const _PublicationListView(),
      ],
    );
  }
}

class _PublicationListView extends StatelessWidget {
  const _PublicationListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.publications.length,
            itemBuilder: (context, index) {
              return _PublicationView(
                publication: state.publications[index],
              );
            },
          ),
        );
      },
    );
  }
}

class _PublicationView extends StatelessWidget {
  const _PublicationView({
    Key? key,
    required this.publication,
  }) : super(key: key);

  final Publication publication;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        color: Colors.white.withOpacity(.2),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: publication.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}