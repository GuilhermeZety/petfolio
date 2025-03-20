import 'package:petfolio/app/core/shared/features/user/data/models/user_model.dart';

abstract class UserDatasource {
  Future<bool> refreshToken();
  Future<UserModel> getUserInfo();
  Future<bool> changeUserPhoto(String path);
  Future<bool> editUser(UserModel user);
}
