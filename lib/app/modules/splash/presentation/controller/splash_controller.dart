// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/core/common/constants/app_routes.dart';
import 'package:petfolio/app/core/common/services/connection/connection_service.dart';
import 'package:petfolio/main.dart';

class SplashController {
  Future<void> init(BuildContext context) async {
    await Future.delayed(2.seconds);

    if (session.isLogged()) {
      // await appGlobalData.update();
      if (session.forceResync) {
        Modular.to.pushNamedAndRemoveUntil(AppRoutes.sync, (_) => false);
        return;
      }
      session.getSession();
      Modular.to.pushNamedAndRemoveUntil(AppRoutes.home, (_) => false);
    } else {
      if (await Modular.get<ConnectionService>().isConnected) {
        Modular.to.pushNamedAndRemoveUntil(AppRoutes.auth, (_) => false);
      } else {
        Modular.to.pushNamedAndRemoveUntil(AppRoutes.notConnection, (_) => false);
      }
    }
  }
}
