import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/constants/app_assets.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/utils/overlay_ui_utils.dart';
import 'package:petfolio/app/modules/splash/presentation/controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashController splashController = SplashController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      OverlayUIUtils.setOverlayStyle(barDark: !context.isDark);
      splashController.init(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Center(child: _logoAnimated),
            Positioned(
              bottom: context.mq.padding.bottom + 24,
              left: 0,
              right: 0,
              child: Center(
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [SvgPicture.asset(AppAssets.svgs.desenvolvidoByTheme(context), width: 180)]),
                ),
              ),
            ).slideFade(true, duration: 500.ms),
          ],
        ).animate().fade(duration: 0.5.seconds),
      ),
    );
  }

  Widget get _logoAnimated => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(AppAssets.svgs.logoIcon, width: 180)
          .hero('logo_icon')
          .slideFade(false, duration: 500.ms)
          .animate(onComplete: (controller) => controller.repeat(reverse: true))
          .scaleXY(begin: 0.95, end: 1, duration: 2.seconds)
          .shimmer(color: AppColors.white.changeOpacity(0.3)),
      const Gap(16),
      SvgPicture.asset(AppAssets.svgs.logoName, width: 180)
          .hero('logo_name')
          .slideFade(true, duration: 500.ms)
          .animate(onComplete: (controller) => controller.repeat(reverse: true))
          .scaleXY(begin: 0.95, end: 1, duration: 2.seconds)
          .shimmer(color: AppColors.white.changeOpacity(0.3)),
    ],
  );
}
