import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';
import 'package:petfolio/app/core/common/features/usecases/usecase.dart';
import 'package:petfolio/app/modules/auth/domain/repositories/auth_repository.dart';

class Login extends Usecase<bool, LoginParams> {
  final AuthRepository repository;

  Login({required this.repository});

  @override
  Future<Either<Failure, bool>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({required this.email, required this.password});
}
