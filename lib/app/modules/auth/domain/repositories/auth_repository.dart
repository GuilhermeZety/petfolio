import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/features/fp.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(String email, String password);
}
