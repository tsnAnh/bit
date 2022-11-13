import 'package:equatable/equatable.dart';

import '../dtos/article_dtos.dart';

class Article extends Equatable {
  final String title;
  final String pubDate;
  final String link;
  final String guid;
  final String author;
  final String thumbnail;
  final String description;
  final String content;
  final List<String> categories;
  final String publication;
  String? publicationImage;

  Article(
      this.title,
      this.pubDate,
      this.link,
      this.guid,
      this.author,
      this.thumbnail,
      this.description,
      this.content,
      this.categories,
      this.publication,
      this.publicationImage);

  @override
  List<Object?> get props => [
        title,
        pubDate,
        link,
        guid,
        author,
        thumbnail,
        description,
        content,
        categories,
        publication,
        publicationImage,
      ];

  factory Article.fromDTO(ArticleJson dto) => Article(
        dto.title,
        dto.pubDate,
        dto.link,
        dto.guid,
        dto.author,
        dto.thumbnail,
        dto.description,
        dto.content,
        dto.categories,
        dto.publication,
        dto.publicationImage,
      );
}
