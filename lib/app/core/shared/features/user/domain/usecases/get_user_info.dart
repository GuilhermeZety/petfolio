import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';
import 'package:petfolio/app/core/common/features/usecases/usecase.dart';
import 'package:petfolio/app/core/shared/features/user/data/models/user_model.dart';
import 'package:petfolio/app/core/shared/features/user/domain/repositories/user_repository.dart';

class GetUserInfo extends Usecase<UserModel, NoParams> {
  final UserRepository repository;

  GetUserInfo({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(NoParams params) async {
    return await repository.getUserInfo();
  }
}
