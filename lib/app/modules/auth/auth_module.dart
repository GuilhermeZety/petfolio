import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/modules/auth/data/datasources/datasource/auth_datasource_impl.dart';
import 'package:petfolio/app/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:petfolio/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:petfolio/app/modules/auth/domain/usecases/login.dart';
import 'package:petfolio/app/modules/auth/presentation/pages/auth_page.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<AuthRepository>(() => AuthRepositoryImpl(datasource: AuthDatasourceImpl(requestService: Modular.get())));

    i.addLazySingleton<Login>(() => Login(repository: Modular.get()));
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (args) => const AuthPage(), transition: TransitionType.fadeIn, duration: 700.ms);
    super.routes(r);
  }
}
