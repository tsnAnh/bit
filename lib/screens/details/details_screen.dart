import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/domain/article.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Hero(
            tag: article.title,
            child: CachedNetworkImage(
              imageUrl: article.thumbnail,
              height: 240,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
