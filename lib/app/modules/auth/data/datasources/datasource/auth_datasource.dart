import 'package:petfolio/app/core/shared/models/user_model.dart';

abstract class AuthDatasource {
  Future<UserModel> login(String email, String password);
}
