import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/modules/splash/presentation/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  void binds(Injector i) {
    //
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (args) => const SplashPage(), transition: TransitionType.fadeIn, duration: 500.ms);
    super.routes(r);
  }
}
