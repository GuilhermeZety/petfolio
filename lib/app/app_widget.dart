import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/core/common/theme/app_theme.dart';
import 'package:petfolio/app/core/common/utils/overlay_ui_utils.dart';
import 'package:signals/signals_flutter.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with SignalsMixin {
  @override
  void initState() {
    OverlayUIUtils.setOverlayStyle(barDark: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Petfólio',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
