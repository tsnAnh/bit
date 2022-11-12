import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/dtos/publication_dto.dart';
import '../../../../models/dtos/user_dto.dart';
import '../../data_sources/medium/medium_data_source.dart';
import '../api.dart';
import '../api_path.dart';

class MediumAuthApi extends Api implements MediumDataSource {
  MediumAuthApi(super.dio);

  @override
  Future<Either<DataSourceError, List<PublicationJson>>> getPublications() =>
      withTimeoutRequest(
        () async {
          final data = await dio.get(ApiPath.publications(''));
          return (data.data as List<dynamic>)
              .map((e) => PublicationJson.fromJson(e))
              .toList();
        },
      );

  @override
  Future<Either<DataSourceError, UserJson>> getUserInfo() {
    return withTimeoutRequest(() async {
      final data = await dio.get(ApiPath.me);
      print(data.headers['Authorization']);
      return UserJsonWrapper.fromJson(data.data).data;
    });
  }
}
