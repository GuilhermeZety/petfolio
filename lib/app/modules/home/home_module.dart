import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/modules/home/presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (args) => const HomePage(),
      transition: TransitionType.fadeIn,
      duration: 500.ms,
    );

    super.routes(r);
  }
}
