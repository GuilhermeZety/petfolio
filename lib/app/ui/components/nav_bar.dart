import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/constants/app_routes.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';
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
        height: 75 + context.mq.padding.bottom,
        decoration: BoxDecoration(
          color: context.colorScheme.secondaryContainer,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
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
            Stack(
              children: [
                Row(
                  children: [
                    AnimatedContainer(
                      width: context.width / 2,
                      margin: EdgeInsets.only(
                        left: controller.index.value < 1 ? 0 : context.width / 2,
                      ),
                      duration: duration,
                      curve: Curves.easeOut,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                          bottomLeft:
                              controller.index.value == 0
                                  ? Radius.zero
                                  : const Radius.circular(10),
                          bottomRight:
                              controller.index.value == 1
                                  ? Radius.zero
                                  : const Radius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _buildNavItem(0, 'home', Icons.home_outlined).expanded(),
                    _buildNavItem(1, 'profile', Icons.person_outlined).expanded(),
                  ],
                ),
              ],
            ).expanded(),
            Gap(context.mq.padding.bottom),
          ],
        ),
      ).hero('nav_complete'),
    );
  }

  Widget _buildNavItem(int index, String title, IconData icon) {
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: duration,
                child: Icon(
                  icon,
                  key: ValueKey(controller.index.value == index),
                  color:
                      controller.index.value == index
                          ? AppColors.white
                          : context.isDark
                          ? AppColors.primary.lighten(0.1)
                          : AppColors.primary,
                  size: 24,
                ),
              ),
              const Gap(12),
              AnimatedDefaultTextStyle(
                style: TextStyle(
                  color:
                      controller.index.value == index
                          ? AppColors.white
                          : context.isDark
                          ? AppColors.primary.lighten(0.1)
                          : AppColors.primary,
                  fontWeight: AppFonts.bold,
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
