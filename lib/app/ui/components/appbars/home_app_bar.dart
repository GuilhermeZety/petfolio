import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/constants/app_assets.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';
import 'package:petfolio/app/core/common/utils/overlay_ui_utils.dart';
import 'package:petfolio/main.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    OverlayUIUtils.setOverlayStyle(barDark: false);
    return Column(
      children: [
        Container(
          height: context.safeArea(AxisDirection.up) + 94,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(context.safeArea(AxisDirection.up)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          '${'hello'}, ${session.user!.name.split(' ').first}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: AppColors.white,
                            fontWeight: AppFonts.bold,
                          ),
                        ),
                      ).hero('app_title'),
                      Text(
                        'good_work_day',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.white.changeOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    AppAssets.svgs.logoIcon,
                    width: 50,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ).hero('small_logo'),
                ],
              ).pH(24),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
