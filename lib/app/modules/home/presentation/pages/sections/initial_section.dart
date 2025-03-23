import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/core/shared/models/user_model.dart';
import 'package:petfolio/app/ui/components/appbars/home_app_bar.dart';
import 'package:petfolio/app/ui/components/nav_bar.dart';
import 'package:petfolio/main.dart';

class InitialSection extends StatefulWidget {
  const InitialSection({super.key});

  @override
  State<InitialSection> createState() => _InitialSectionState();
}

class _InitialSectionState extends State<InitialSection> {
  AppNavBarController navController = Modular.get();
  UserModel user = session.user!;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        children: [
          HomeAppBar(),
          //
        ],
      ),
      //
    );
  }
}
