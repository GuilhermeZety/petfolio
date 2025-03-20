import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';
import 'package:petfolio/app/core/common/services/treater/treater_service.dart';
import 'package:petfolio/app/core/shared/features/auth/data/datasources/datasource/auth_datasource.dart';
import 'package:petfolio/app/core/shared/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, String>> login(String document) async {
    return TreaterService()<String>(
      () async {
        return await datasource.login(document);
      },
      online: true,
      errorIdentification: 'Erro ao logar',
    );
  }

  @override
  Future<Either<Failure, bool>> updateHash(String hash) async {
    return TreaterService()<bool>(
      () async {
        return await datasource.updateHash(hash);
      },
      online: true,
      errorIdentification: 'Erro ao atualizar o hash',
    );
  }
}
