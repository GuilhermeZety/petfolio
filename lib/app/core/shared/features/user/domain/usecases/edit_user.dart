import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';
import 'package:petfolio/app/core/common/features/usecases/usecase.dart';
import 'package:petfolio/app/core/shared/features/user/data/models/user_model.dart';
import 'package:petfolio/app/core/shared/features/user/domain/repositories/user_repository.dart';

class EditUser extends Usecase<bool, EditUserParams> {
  final UserRepository repository;

  EditUser({required this.repository});

  @override
  Future<Either<Failure, bool>> call(EditUserParams params) async {
    return await repository.editUser(params.user);
  }
}

class EditUserParams {
  final UserModel user;
  EditUserParams({required this.user});
}
