import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(String email, String password);
}
