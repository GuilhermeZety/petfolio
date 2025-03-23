import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/shared/models/user_model.dart';
import 'package:petfolio/app/ui/components/appbars/home_app_bar.dart';
import 'package:petfolio/app/ui/components/nav_bar.dart';
import 'package:petfolio/app/ui/components/panel_background.dart';
import 'package:petfolio/main.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  AppNavBarController navController = Modular.get();
  UserModel user = session.user!;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeAppBar(),
          _modules.expanded().animate().slideY(begin: 0.01, end: 0),
        ],
      ),
    );
  }

  Widget get _modules => const PanelBackground(
    child: SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Gap(16)],
      ),
    ),
  );
}
