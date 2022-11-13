import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webfeed/domain/rss_image.dart';

part 'article_dtos.g.dart';
part 'article_dtos.freezed.dart';

@freezed
class PublicationWithArticlesJson with _$PublicationWithArticlesJson {
  const factory PublicationWithArticlesJson({
    required List<ArticleJson> items,
  }) = _PublicationWithArticlesJson;

  factory PublicationWithArticlesJson.fromJson(Map<String, Object?> json) =>
      _$PublicationWithArticlesJsonFromJson(json);
}

@freezed
class ArticleJson with _$ArticleJson {
  const factory ArticleJson({
    required String title,
    required String pubDate,
    required String link,
    required String guid,
    required String author,
    required String thumbnail,
    required String description,
    required String content,
    required List<String> categories,
    required String publication, required String publicationImage,
}) = _ArticleJson;

  factory ArticleJson.fromJson(Map<String, Object?> json) =>
      _$ArticleJsonFromJson(json);
}
