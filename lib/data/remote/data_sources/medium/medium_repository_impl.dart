import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../domain/repositories/medium_repository.dart';
import '../../../../models/domain/publication.dart';
import '../../../../models/domain/user.dart';
import 'medium_data_source.dart';

class MediumRepositoryImpl implements MediumRepository {
  final MediumDataSource mediumDataSource;

  const MediumRepositoryImpl(this.mediumDataSource);

  @override
  Future<Either<DataSourceError, List<Publication>>> getPublications() async =>
      (await mediumDataSource.getPublications())
          .map((values) => values.map(Publication.fromDTO).toList());

  @override
  Future<Either<DataSourceError, User>> getUserInfo() async =>
      (await mediumDataSource.getUserInfo())
          .map((value) => User.fromDTO(value));
}
