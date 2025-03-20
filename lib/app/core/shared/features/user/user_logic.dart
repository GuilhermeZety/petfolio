import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/core/shared/features/user/data/datasources/datasource/user_datasource.dart';
import 'package:petfolio/app/core/shared/features/user/data/datasources/datasource/user_datasource_impl.dart';
import 'package:petfolio/app/core/shared/features/user/data/repositories/user_repository_impl.dart';
import 'package:petfolio/app/core/shared/features/user/domain/repositories/user_repository.dart';
import 'package:petfolio/app/core/shared/features/user/domain/usecases/change_user_photo.dart';
import 'package:petfolio/app/core/shared/features/user/domain/usecases/edit_user.dart';
import 'package:petfolio/app/core/shared/features/user/domain/usecases/get_user_info.dart';
import 'package:petfolio/app/core/shared/features/user/domain/usecases/refresh_token.dart';

class UserLogic {
  static void binds(Injector i) {
    i.addLazySingleton<UserDatasource>(() => UserDatasourceImpl(requestService: Modular.get()));
    i.addLazySingleton<UserRepository>(() => UserRepositoryImpl(datasource: Modular.get()));
    i.addLazySingleton<RefreshToken>(() => RefreshToken(repository: Modular.get()));
    i.addLazySingleton<GetUserInfo>(() => GetUserInfo(repository: Modular.get()));
    i.addLazySingleton<EditUser>(() => EditUser(repository: Modular.get()));
    i.addLazySingleton<ChangeUserPhoto>(() => ChangeUserPhoto(repository: Modular.get()));
  }
}
