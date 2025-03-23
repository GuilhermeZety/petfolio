import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/constants/app_assets.dart';
import 'package:petfolio/app/core/common/constants/app_routes.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:signals/signals_flutter.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, this.pop = false, this.forceTo = false});

  final bool pop;
  final bool forceTo;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SignalsMixin {
  AppNavBarController controller = Modular.get();
  Duration duration = 300.ms;

  @override
  void initState() {
    effect(() {
      var value = controller.index.value;
      log(value.toString());
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.primaryContainer,
      child: Container(
        height: 70 + context.mq.padding.bottom,
        decoration: BoxDecoration(
          color: context.colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.changeOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, -1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                _buildNavItem(
                  0,
                  'Inicio',
                  null,
                  icon: Icons.pets_rounded,
                ).expanded(),
                _buildNavItem(1, 'Meus Pets', AppAssets.svgs.pet).expanded(),
                _buildNavItem(
                  2,
                  'Store',
                  AppAssets.svgs.shoppingBag,
                  forceHeight: true,
                ).expanded(),
                _buildNavItem(
                  3,
                  'Profile',
                  AppAssets.svgs.profile,
                  forceHeight: true,
                ).expanded(),
              ],
            ).expanded(),
            Gap(context.mq.padding.bottom),
          ],
        ),
      ).hero('nav_complete'),
    );
  }

  Widget _buildNavItem(
    int index,
    String title,
    String? svg, {
    IconData? icon,
    bool forceHeight = false,
  }) {
    return GestureDetector(
      onTap: () {
        if (widget.forceTo) {
          Modular.to.pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
        } else if (widget.pop) {
          Modular.to.pop();
        }
        controller.changePage(index);
      },
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: duration,
                child: Builder(
                  builder: (context) {
                    if (icon != null) {
                      return Icon(
                        icon,
                        key: ValueKey(controller.index.value.toString()),
                        color:
                            controller.index.value == index
                                ? AppColors.primary
                                : AppColors.grey_400,
                        size: 24,
                      );
                    }

                    return SvgPicture.asset(
                      svg!,
                      key: ValueKey(controller.index.value.toString()),
                      colorFilter: ColorFilter.mode(
                        controller.index.value == index
                            ? AppColors.primary
                            : AppColors.grey_400,
                        BlendMode.srcIn,
                      ),
                      width: 24,
                      height: forceHeight ? 24 : null,
                    );
                  },
                ),
              ),
              const Gap(4),
              AnimatedDefaultTextStyle(
                style: TextStyle(
                  fontSize: 10,
                  color:
                      controller.index.value == index
                          ? AppColors.primary
                          : AppColors.grey_400,
                ),
                duration: duration,
                child: Text(title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppNavBarController {
  final index = signal(0);
  final PageController pageController = PageController();

  void changePage(int page) {
    pageController.animateToPage(page, duration: 300.ms, curve: Curves.easeInOut);
    index.value = page;
  }

  void onPageChanged(int page) {
    index.value = page;
  }
}
