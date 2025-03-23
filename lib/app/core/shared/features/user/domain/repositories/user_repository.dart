import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';

abstract class UserRepository {
  Future<Either<Failure, bool>> changeUserPhoto(String path);
}
