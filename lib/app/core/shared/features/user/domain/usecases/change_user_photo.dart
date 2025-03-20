import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';
import 'package:petfolio/app/core/common/features/usecases/usecase.dart';
import 'package:petfolio/app/core/shared/features/user/domain/repositories/user_repository.dart';

class ChangeUserPhoto extends Usecase<bool, ChangeUserPhotoParams> {
  final UserRepository repository;

  ChangeUserPhoto({required this.repository});

  @override
  Future<Either<Failure, bool>> call(ChangeUserPhotoParams params) async {
    return await repository.changeUserPhoto(params.path);
  }
}

class ChangeUserPhotoParams {
  final String path;
  ChangeUserPhotoParams({required this.path});
}
