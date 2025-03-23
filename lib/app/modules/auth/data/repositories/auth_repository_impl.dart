import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';
import 'package:petfolio/app/core/common/services/treater/treater_service.dart';
import 'package:petfolio/app/modules/auth/data/datasources/datasource/auth_datasource.dart';
import 'package:petfolio/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:petfolio/main.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    return TreaterService()<bool>(
      () async {
        var loggedUser = await datasource.login(email, password);

        await session.prefs.setString('user', loggedUser.toJson());

        return true;
      },
      online: true,
      errorIdentification: 'Erro ao logar',
    );
  }
}
