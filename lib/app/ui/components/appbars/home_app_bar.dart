import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/utils/overlay_ui_utils.dart';
import 'package:petfolio/app/ui/components/image_cached.dart';
import 'package:petfolio/app/ui/components/panel.dart';
import 'package:petfolio/main.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    OverlayUIUtils.setOverlayStyle(barDark: true);
    return Column(
      children: [
        Panel(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageCached(
                    url: session.user?.avatarUrl,
                    width: 50,
                    height: 50,
                    radius: 10,
                  ),
                  const Gap(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olá, ${session.user?.name.split(' ').first}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.grey_800,
                        ),
                      ),
                      Text(
                        '${session.user?.address.cidade}, ${session.user?.address.pais}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Panel(
                    padding: const EdgeInsets.all(10),
                    radius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                    child: const Icon(
                      Icons.notifications_none_outlined,
                      size: 20,
                      color: AppColors.grey_500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ).pOnly(top: context.safeArea(AxisDirection.up) + 16, right: 16, left: 16),
      ],
    );
  }
}
