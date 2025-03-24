import 'package:flutter/material.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';
import 'package:petfolio/app/core/common/utils/overlay_ui_utils.dart';
import 'package:petfolio/app/ui/components/panel.dart';

class BackAppBar extends StatelessWidget {
  const BackAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.onMore,
    this.showMore = true,
    //
  });

  final String title;
  final void Function()? onBack;
  final void Function()? onMore;
  final bool showMore;

  @override
  Widget build(BuildContext context) {
    OverlayUIUtils.setOverlayStyle(barDark: true);
    return Column(
      children: [
        Panel(
          height: 72,
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Panel(
                onTap: onBack,
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(8),
                radius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 16,
                  color: AppColors.grey_600,
                ),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: AppFonts.semiBold),
              ),
              if (showMore)
                Panel(
                  onTap: onMore,
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  radius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                  child: const Icon(
                    Icons.more_vert_rounded,
                    size: 20,
                    color: AppColors.grey_600,
                  ),
                )
              else
                const SizedBox(width: 40),
            ],
          ),
        ).pOnly(top: context.safeArea(AxisDirection.up) + 16, right: 16, left: 16),
      ],
    );
  }
}
