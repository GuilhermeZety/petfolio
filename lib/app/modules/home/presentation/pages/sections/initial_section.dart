import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/shared/models/user_model.dart';
import 'package:petfolio/app/ui/components/appbars/home_app_bar.dart';
import 'package:petfolio/app/ui/components/image_cached.dart';
import 'package:petfolio/app/ui/components/nav_bar.dart';
import 'package:petfolio/app/ui/components/panel.dart';
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
    return SizedBox(
      child: Column(
        spacing: 16,
        children: [
          const HomeAppBar(),
          _myPets,
          //
        ],
      ),
    );
  }

  Widget get _myPets {
    var pets = session.user!.pets;
    return _buildMenu(
      'Seus Pets',
      () {
        Modular.get<AppNavBarController>().changePage(1);
      },
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              spacing: 4,
              children: [
                Panel(
                  onTap: () {},
                  width: 60,
                  height: 60,
                  color: context.colorScheme.primary.changeOpacity(0.1),
                  border: Border.all(
                    color: context.colorScheme.primary.changeOpacity(0.5),
                  ),
                  radius: BorderRadius.circular(8),
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Icon(Icons.add, color: context.colorScheme.primary),
                  ),
                ),
                const Text(
                  'Adicionar',
                  style: TextStyle(fontSize: 12, color: AppColors.black),
                ),
              ],
            ),
            ...pets.map(
              (e) => Panel(
                width: 60,
                padding: const EdgeInsets.all(0),
                child: Column(
                  spacing: 4,
                  children: [
                    ImageCached(url: e.photo, width: 60, height: 60, radius: 8),
                    AutoSizeText(
                      e.name ?? 'sem nome',
                      style: const TextStyle(fontSize: 12, color: AppColors.black),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              //
            ),
          ],
        ),
      ),
    ).pH(16).expandedH();
  }

  Widget _buildMenu(String title, dynamic Function() onSeeAll, Widget child) {
    return Panel(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.grey_800,
                  fontWeight: FontWeight.bold,
                ),
              ).expanded(),
              Panel(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                border: Border.all(color: AppColors.grey_300),
                radius: BorderRadius.circular(100),
                onTap: onSeeAll,
                child: const Text('Ver Mais'),
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}
