import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/core/shared/features/auth/data/datasources/datasource/auth_datasource_impl.dart';
import 'package:petfolio/app/core/shared/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:petfolio/app/core/shared/features/auth/domain/repositories/auth_repository.dart';
import 'package:petfolio/app/core/shared/features/auth/domain/usecases/login.dart';
import 'package:petfolio/app/core/shared/features/auth/domain/usecases/update_hash.dart';

class AuthLogic {
  static void binds(Injector i) {
    i.addLazySingleton<AuthRepository>(() => AuthRepositoryImpl(datasource: AuthDatasourceImpl(requestService: Modular.get())));

    i.addLazySingleton<Login>(() => Login(repository: Modular.get()));
    i.addLazySingleton<UpdateHash>(() => UpdateHash(repository: Modular.get()));
  }
}
