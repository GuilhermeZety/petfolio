import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/constants/app_assets.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';

class ShopSection extends StatefulWidget {
  const ShopSection({super.key});

  @override
  State<ShopSection> createState() => _ShopSectionState();
}

class _ShopSectionState extends State<ShopSection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.svgs.playCat, width: 200),
          const SizedBox(height: 16),
          const Text(
            'Novidade chegando!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.grey_800,
            ),
          ),
          const Gap(16),
          const Text(
            'Em breve, uma loja cheia de produtos incríveis para o seu pet. Fique ligado!',
            style: TextStyle(fontSize: 14, color: AppColors.grey_500),
            textAlign: TextAlign.center,
          ).pH(context.width * .1),
        ],
      ),
    );
  }
}
