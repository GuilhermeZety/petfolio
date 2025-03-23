import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
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
      body: Center(child: _logoAnimated.animate().fade(duration: 0.5.seconds)),
    );
  }

  Widget get _logoAnimated => SvgPicture.asset(AppAssets.svgs.logo, width: 180)
      .hero('logo_icon')
      .slideFade(false, duration: 500.ms)
      .animate(onComplete: (controller) => controller.repeat(reverse: true))
      .scaleXY(begin: 0.95, end: 1, duration: 2.seconds)
      .shimmer(color: AppColors.white.changeOpacity(0.3));
}
