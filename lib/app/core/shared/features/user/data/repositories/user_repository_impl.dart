import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';
import 'package:petfolio/app/core/common/services/treater/treater_service.dart';
import 'package:petfolio/app/core/shared/features/user/data/datasources/datasource/user_datasource.dart';
import 'package:petfolio/app/core/shared/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDatasource datasource;

  UserRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, bool>> changeUserPhoto(String path) async {
    return TreaterService()<bool>(
      () async {
        return await datasource.changeUserPhoto(path);
      },
      online: true,
      errorIdentification: 'Erro ao atualizar foto do usuário',
    );
  }
}
