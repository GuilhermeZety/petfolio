import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';
import 'package:petfolio/app/core/common/features/usecases/usecase.dart';
import 'package:petfolio/app/core/shared/features/user/domain/repositories/user_repository.dart';

class RefreshToken extends Usecase<bool, NoParams> {
  final UserRepository repository;

  RefreshToken({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.refreshToken();
  }
}
