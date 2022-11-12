import '../../common/either.dart';
import '../../common/error.dart';
import '../../models/domain/publication.dart';
import '../../models/domain/user.dart';

abstract class MediumRepository {
  Future<Either<DataSourceError, User>> getUserInfo();

  Future<Either<DataSourceError, List<Publication>>> getPublications();
}
