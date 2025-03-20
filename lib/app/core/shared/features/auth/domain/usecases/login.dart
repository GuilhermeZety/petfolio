import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';
import 'package:petfolio/app/core/common/features/usecases/usecase.dart';
import 'package:petfolio/app/core/shared/features/auth/domain/repositories/auth_repository.dart';

class Login extends Usecase<String, LoginParams> {
  final AuthRepository repository;

  Login({required this.repository});

  @override
  Future<Either<Failure, String>> call(LoginParams params) async {
    return await repository.login(params.document);
  }
}

class LoginParams {
  final String document;
  LoginParams({required this.document});
}
