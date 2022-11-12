import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/dtos/publication_dto.dart';
import '../../../../models/dtos/user_dto.dart';

abstract class MediumDataSource {
  Future<Either<DataSourceError, UserJson>> getUserInfo();

  Future<Either<DataSourceError, List<PublicationJson>>> getPublications();
}
