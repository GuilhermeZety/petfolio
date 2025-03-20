// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:petfolio/app/app_module.dart';
import 'package:petfolio/app/app_widget.dart';
import 'package:petfolio/app/core/common/services/firebase/firebase_service.dart';
import 'package:petfolio/app/core/shared/current_session.dart';

CurrentSession session = CurrentSession();
late PackageInfo packageInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  packageInfo = await PackageInfo.fromPlatform();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  FirebaseService.initialize();
  await session.initialize();

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
