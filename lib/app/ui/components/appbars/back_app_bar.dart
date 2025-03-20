import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/constants/app_assets.dart';
import 'package:petfolio/app/core/common/constants/app_routes.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';
import 'package:petfolio/app/core/common/utils/overlay_ui_utils.dart';
import 'package:petfolio/app/core/shared/modal/have_sure_modal.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.suffix,
    this.suffixIcon,
    this.backAction,
    this.showBackText = false,
    this.confirmPop = false,
  });

  final String? title;
  final String? subtitle;
  final Widget? suffix;
  final IconData? suffixIcon;
  final void Function()? backAction;
  final bool showBackText;
  final bool confirmPop;

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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed:
                            backAction ??
                            () async {
                              if (confirmPop) {
                                var popped = await const HaveSureModal(
                                  text: 'confirm_exit_message',
                                ).show(context);

                                if (popped == true) {
                                  if (Modular.to.canPop()) {
                                    Modular.to.pop();
                                    return;
                                  } else {
                                    Modular.to.pushNamedAndRemoveUntil(
                                      AppRoutes.home,
                                      (_) => false,
                                    );
                                  }
                                }
                                return;
                              } else {
                                if (Modular.to.canPop()) {
                                  Modular.to.pop();
                                  return;
                                }
                              }
                            },
                        tooltip: 'back',
                        icon: const Icon(
                          Icons.keyboard_arrow_left_rounded,
                          color: AppColors.white,
                        ),
                      ),
                      if (showBackText)
                        const Text('back', style: TextStyle(color: AppColors.white)),
                    ],
                  ),
                  //
                  if (title != null)
                    Column(
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Text(
                            title!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: AppFonts.bold,
                              color: AppColors.white,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ).hero('app_title').expandedH(),
                        if (subtitle != null)
                          Text(
                            subtitle!,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: AppFonts.bold,
                              color: AppColors.white.changeOpacity(0.6),
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ).expandedH(),
                      ],
                    ).pH(8).expanded(),
                  suffix ??
                      (suffixIcon == null
                          ? SvgPicture.asset(
                            AppAssets.svgs.logoIcon,
                            width: 40,
                            colorFilter: const ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ).hero('small_logo').pRight(16)
                          : Icon(suffixIcon, color: AppColors.white).pRight(8)),
                ],
              ).pLeft(4).pRight(8),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 94);
}
