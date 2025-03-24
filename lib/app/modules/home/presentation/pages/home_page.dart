import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/modules/home/presentation/pages/sections/initial_section.dart';
import 'package:petfolio/app/modules/home/presentation/pages/sections/my_pets_section.dart';
import 'package:petfolio/app/modules/home/presentation/pages/sections/profile_page.dart';
import 'package:petfolio/app/modules/home/presentation/pages/sections/shop_section.dart';
import 'package:petfolio/app/ui/components/nav_bar.dart';

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
      child: Scaffold(
        bottomNavigationBar: const NavBar(),
        body: PageView(
          controller: navController.pageController,
          physics: const NeverScrollableScrollPhysics(),
          // onPageChanged: navController.onPageChanged,
          children: [
            const InitialSection(),
            const MyPetsSection(),
            const ShopSection(),
            const ProfilePage(),
            //
          ],
        ),
      ),
    );
  }
}
