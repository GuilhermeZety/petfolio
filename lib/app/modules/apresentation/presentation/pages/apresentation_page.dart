import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:petfolio/app/core/common/constants/app_assets.dart';
import 'package:petfolio/app/core/common/constants/app_routes.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/modules/apresentation/presentation/controller/apresentation_page_controller.dart';
import 'package:petfolio/app/modules/apresentation/presentation/pages/steps/apresentation_step_screen.dart';
import 'package:petfolio/app/ui/components/button.dart';
import 'package:petfolio/main.dart';
import 'package:signals/signals_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ApresentationPage extends StatefulWidget {
  const ApresentationPage({super.key});

  @override
  State<ApresentationPage> createState() => _ApresentationPageState();
}

class _ApresentationPageState extends State<ApresentationPage> {
  final controller = ApresentationPageController();
  final showBack = signal(false);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller.initiated = true;
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  if (value == 0) {
                    showBack.value = false;
                  } else {
                    showBack.value = true;
                  }
                  if (mounted) setState(() {});
                },
                children: [
                  ApresentationStepScreen(
                    title: 'Seu pet sempre com você!',
                    image: AppAssets.svgs.girlCat,
                    subtitle:
                        'Mantenha todas as informações do seu pet organizadas em um só lugar. Vacinas, consultas e muito mais!',
                  ),
                  ApresentationStepScreen(
                    title: 'Perdeu? Achou!',
                    image: AppAssets.svgs.tutorQr,
                    subtitle:
                        'Com o pingente QR code, qualquer pessoa pode ajudar a encontrar seu pet e entrar em contato com você rapidamente.',
                  ),
                  ApresentationStepScreen(
                    title: 'Tudo na palma da mão!',
                    image: AppAssets.svgs.girlCat2,
                    subtitle:
                        'Acompanhe o histórico do seu pet, receba lembretes e tenha tudo sempre acessível. Simples assim!',
                  ),
                ],
              ).expanded(),
              SmoothPageIndicator(
                controller: controller.pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: context.colorScheme.primary,
                  dotColor: AppColors.grey_200,
                ),
              ).pOnly(bottom: 24, top: 48).slideFade(true, delay: 400.ms),
              _bottomButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomButton() {
    String buttonText = 'Vamos lá';
    if (controller.initiated) {
      if ((controller.pageController.page ?? 0) > 0.5) {
        buttonText = 'Próximo';
      }
      if ((controller.pageController.page ?? 0) > 1) {
        buttonText = 'Acessar!';
      }
    }
    return Watch.builder(
      builder: (context) {
        bool show = showBack.value;
        double buttonBackWidth = show ? (context.width - 64 - 12) * 0.2 : 0;
        double buttonWidth =
            show ? (context.width - 64 - 12) * 0.8 : context.width - 64;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button.secondary(
                width: buttonBackWidth,
                onPressed: () async {
                  controller.pageController
                      .animateToPage(
                        controller.pageController.page!.toInt() - 1,
                        duration: 500.ms,
                        curve: Curves.easeInOut,
                      )
                      .then((_) {
                        if (mounted) setState(() {});
                      });
                },
                child:
                    show
                        ? Icon(
                          Icons.arrow_back,
                          size: 16,
                          color: context.colorScheme.primary,
                        )
                        : const SizedBox(),
              ).pRight(show ? 12 : 0),
              Button(
                width: buttonWidth,
                onPressed: () async {
                  if ((controller.pageController.page ?? 0) < 2) {
                    controller.pageController
                        .animateToPage(
                          controller.pageController.page!.toInt() + 1,
                          duration: 500.ms,
                          curve: Curves.easeInOut,
                        )
                        .then((_) {
                          if (mounted) setState(() {});
                        });
                    return;
                  }
                  session.prefs.setBool('apresentation', true);
                  Modular.to.pushNamedAndRemoveUntil(AppRoutes.auth, (_) => false);
                },
                child: Text(buttonText),
              ),
            ],
          ).slideFade(true, delay: 500.ms).pOnly(right: 32, left: 32, bottom: 32),
        ).expandedH();
      },
    );
  }
}
