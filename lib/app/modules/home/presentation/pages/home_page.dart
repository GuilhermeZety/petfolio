import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/modules/home/presentation/pages/modules/initial_page.dart';
import 'package:petfolio/app/modules/home/presentation/pages/profile/profile_page.dart';
import 'package:petfolio/app/ui/components/nav_bar.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppNavBarController navController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: ScaffoldGradientBackground(
        gradient: AppColors.gradient,
        bottomNavigationBar: const NavBar(),
        body: PageView(
          controller: navController.pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: navController.onPageChanged,
          children: const [InitialPage(), ProfilePage()],
        ),
      ),
    );
  }
}
