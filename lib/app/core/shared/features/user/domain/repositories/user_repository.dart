import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';
import 'package:petfolio/app/core/shared/features/user/data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, bool>> refreshToken();
  Future<Either<Failure, UserModel>> getUserInfo();
  Future<Either<Failure, bool>> changeUserPhoto(String path);
  Future<Either<Failure, bool>> editUser(UserModel user);
}
