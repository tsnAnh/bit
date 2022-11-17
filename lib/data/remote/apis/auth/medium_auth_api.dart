import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/dtos/article_dtos.dart';
import '../../../../models/dtos/publication_dto.dart';
import '../../../../models/dtos/user_dto.dart';
import '../../../local/local.dart';
import '../../../local/local_storage_key.dart';
import '../../data_sources/medium/medium_data_source.dart';
import '../api.dart';
import '../api_path.dart';
import 'package:webfeed/webfeed.dart';

class MediumAuthApi extends Api implements MediumDataSource {
  MediumAuthApi(super.dio, this.storage);

  final LocalStorage storage;

  @override
  Future<Either<DataSourceError, List<PublicationJson>>> getPublications() =>
      withTimeoutRequest(
        () async {
          final userId = storage.getString(LocalStorageKey.userId) ?? '';
          final data = await dio.get(ApiPath.publications(userId));
          return PublicationJsonWrapper.fromJson(data.data).data;
        },
      );

  @override
  Future<Either<DataSourceError, UserJson>> getUserInfo() {
    return withTimeoutRequest(() async {
      final data = await dio.get(ApiPath.me);
      return UserJsonWrapper.fromJson(data.data).data;
    });
  }

  @override
  Future<Either<DataSourceError, List<ArticleJson>>> getArticles(
    List<String> publicationUrls,
    bool shuffled,
  ) async {
    return withTimeoutRequest(() async {
      List<ArticleJson> articles = [];
      final futures = publicationUrls.map((e) async {
        var elements = e.split('/');
        elements.insert(3, 'feed');
        final url = elements.join('/');
        final xmlString = (await dio.get(url)).data;
        final rss = RssFeed.parse(xmlString);
        final articlesJson = rss.items?.map((e) {
              final imageUrl = e.content?.images
                  .firstWhere((element) => element.startsWith('https://'));
              if (imageUrl == null) return null;
              return ArticleJson(
                title: e.title ?? '',
                description: e.description ?? '',
                author: e.author ?? '',
                categories:
                    e.categories?.map((e) => e.toString()).toList() ?? [],
                content: e.content.toString(),
                guid: e.guid ?? '',
                link: e.link ?? '',
                pubDate: e.pubDate.toString(),
                thumbnail: imageUrl,
                publication: rss.title ?? '',
                publicationImage: rss.image?.url ?? '',
              );
            }).toList() ??
            [];
        articles = [
          ...articles,
          ...articlesJson
              .where((element) => element != null)
              .map((e) => e!)
              .toList()
        ];
      }).toList();
      await Future.wait(futures);

      if (shuffled) articles.shuffle();
      return articles;
    });
  }
}
