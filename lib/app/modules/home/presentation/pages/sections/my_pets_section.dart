import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/shared/models/user_model.dart';
import 'package:petfolio/app/ui/components/appbars/back_app_bar.dart';
import 'package:petfolio/app/ui/components/itens/pet_item.dart';
import 'package:petfolio/app/ui/components/nav_bar.dart';
import 'package:petfolio/main.dart';

class MyPetsSection extends StatefulWidget {
  const MyPetsSection({super.key});

  @override
  State<MyPetsSection> createState() => _MyPetsSectionState();
}

class _MyPetsSectionState extends State<MyPetsSection> {
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
          BackAppBar(
            title: 'Seus Pets',
            onBack: () {
              Modular.get<AppNavBarController>().changePage(0);
              //
            },
          ),
          _myPets.expanded(),
        ],
      ),
    );
  }

  Widget get _myPets {
    var pets = session.user!.pets;
    return ListView.separated(
      itemBuilder: (context, index) {
        return PetItem(pet: pets[index]).pH(16);
      },
      separatorBuilder: (_, _) => const Gap(8),
      itemCount: pets.length,
      padding: EdgeInsets.zero,
    );
  }
}
