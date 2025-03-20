import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';
import 'package:petfolio/app/core/common/features/usecases/usecase.dart';
import 'package:petfolio/app/core/shared/features/auth/domain/repositories/auth_repository.dart';

class UpdateHash extends Usecase<bool, UpdateHashParams> {
  final AuthRepository repository;

  UpdateHash({required this.repository});

  @override
  Future<Either<Failure, bool>> call(UpdateHashParams params) async {
    return await repository.updateHash(params.hash);
  }
}

class UpdateHashParams {
  final String hash;
  UpdateHashParams({required this.hash});
}
