import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/core/common/services/connection/connection_service.dart';
import 'package:petfolio/app/core/common/services/connection/connection_service_impl.dart';
import 'package:petfolio/app/core/common/services/requests/dio_request_service.dart';
import 'package:petfolio/app/core/common/services/requests/request_service.dart';
import 'package:petfolio/app/modules/apresentation/presentation/pages/apresentation_page.dart';
import 'package:petfolio/app/modules/auth/auth_module.dart';
import 'package:petfolio/app/modules/home/home_module.dart';
import 'package:petfolio/app/modules/not_connection/presentation/pages/not_connection_page.dart';
import 'package:petfolio/app/modules/not_found/presentation/pages/not_found_page.dart';
import 'package:petfolio/app/modules/splash/splash_module.dart';
import 'package:petfolio/app/ui/components/nav_bar.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<ConnectionService>(() => ConnectionServiceImpl());
    i.addSingleton<RequestService>(() => DioRequestService());
    i.addSingleton<AppNavBarController>(() => AppNavBarController());
  }

  @override
  void routes(RouteManager r) {
    // MODULES
    r.module(
      '/',
      module: SplashModule(),
      transition: TransitionType.fadeIn,
      duration: 500.ms,
    );
    r.module(
      '/auth/',
      module: AuthModule(),
      transition: TransitionType.fadeIn,
      duration: 700.ms,
    );
    r.module(
      '/home/',
      module: HomeModule(),
      transition: TransitionType.fadeIn,
      duration: 500.ms,
    );
    //CHILDS
    r.child(
      '/not_connection/',
      child: (args) => const NotConnectionPage(),
      transition: TransitionType.fadeIn,
      duration: 800.ms,
    );
    r.child(
      '/apresentation/',
      child: (args) => const ApresentationPage(),
      transition: TransitionType.fadeIn,
      duration: 800.ms,
    );
    r.wildcard(
      child: (args) => const NotFoundPage(),
      transition: TransitionType.fadeIn,
      duration: 800.ms,
    );
  }
}
