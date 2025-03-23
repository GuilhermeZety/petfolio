// ignore_for_file: unused_element, use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/constants/app_assets.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/string_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';
import 'package:petfolio/app/core/common/utils/input_validations.dart';
import 'package:petfolio/app/core/common/utils/overlay_ui_utils.dart';
import 'package:petfolio/app/core/common/utils/toasting.dart';
import 'package:petfolio/app/core/common/utils/url_launcher_utils.dart';
import 'package:petfolio/app/modules/auth/presentation/controller/auth_page_controller.dart';
import 'package:petfolio/app/ui/components/button.dart';
import 'package:petfolio/app/ui/components/inputs/input.dart';
import 'package:petfolio/app/ui/components/panel.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final controller = AuthPageController();
  //
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      OverlayUIUtils.setOverlayStyle(barDark: true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        floatingActionButton: _debugFloatingActionButton(),
        // gradient: AppColors.gradient,
        body: SafeArea(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Olá,',
                          style: context.textTheme.titleLarge!,
                        ).pOnly(top: context.height * 0.08),
                        Text(
                          'Bem vindo de volta!',
                          style: context.textTheme.titleLarge!.copyWith(
                            fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                    const Gap(8),
                    Text(
                      // 'welcome_back_insert_your_data_to_access',
                      'Acesse sua conta e mantenha todas as informações do seu pet sempre à mão. Simples, seguro e rápido!',
                      style: context.textTheme.bodySmall!,
                    ),
                  ],
                ).slideFade(false, delay: 200.ms),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(32),
                    Input.email(
                      controller.emailController,
                      hint: 'E-mail',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validation: InputValidations.emailValidation,
                      onChange: (_) {
                        if (mounted) setState(() {});
                      },
                    ).slideFade(false, delay: 300.ms),
                    const Gap(12),
                    Input.password(
                      controller.passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validation:
                          (value) => InputValidations.simpleInputValidation(
                            value,
                            minLengh: 3,
                          ),
                      hint: 'Senha',
                      onChange: (_) {
                        if (mounted) setState(() {});
                      },
                    ).slideFade(false, delay: 350.ms),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            FocusScope.of(context).unfocus();

                            UrlLauncherUtils.to(context, '//');
                          },
                          icon: const Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(color: AppColors.grey_400),
                          ),
                        ),
                      ],
                    ).slideFade(false, delay: 400.ms),
                    _orButton,
                    const Gap(12),
                    _oauthButton.expandedH(),
                  ],
                ),
                const Gap(24),
                _dontHaveAccount,
                _acessButton.expandedH(),
                // Gap(context.safeArea(AxisDirection.down)),
              ],
            ).pH(32),
          ),
        ),
      ),
    );
  }

  Widget get _orButton => Row(
    children: [
      const Divider(color: AppColors.grey_200).expanded(),
      const Text('ou', style: TextStyle(color: AppColors.grey_300)).pH(8),
      const Divider(color: AppColors.grey_200).expanded(),
    ],
  ).slideFade(false, delay: 500.ms);

  Widget get _oauthButton => Panel(
    onTap: () {},
    radius: BorderRadius.circular(100),
    border: Border.all(color: AppColors.grey_200),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(AppAssets.svgs.google),
        const Text(
          'Google',
          style: TextStyle(fontWeight: AppFonts.semiBold, color: AppColors.primary),
        ),
        const Gap(20),
      ],
    ),
  ).slideFade(true, delay: 550.ms);
  Widget get _dontHaveAccount => IconButton(
    onPressed: () {
      //
    },
    icon: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          TextSpan(
            text: 'Ainda não possui conta? ',
            children: [
              TextSpan(
                text: 'Criar uma conta',
                style: TextStyle(
                  color: context.colorScheme.primary,
                  fontWeight: AppFonts.semiBold,
                  decoration: TextDecoration.underline,
                  decorationColor: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          //
        ),
      ],

      //
    ),
  ).slideFade(true, delay: 600.ms);

  Widget get _acessButton => Button(
    onPressed: () async {
      FocusScope.of(context).unfocus();
      await controller.login(context);
    },
    child: Text('Acessar'.capitalize()),
  ).slideFade(true, delay: 700.ms).pBottom(32);

  Widget? _debugFloatingActionButton() {
    if (!kDebugMode) {
      return null;
    }
    var accessData = ('pedro.fabreu97@gmail.com', 'senha123');

    return FloatingActionButton(
      heroTag: 'debug',
      onPressed: () {
        controller.emailController.text = accessData.$1;
        controller.passwordController.text = accessData.$2;
        if (mounted) setState(() {});
        Toasting.success(context, title: 'access_data_inserted');
      },
      backgroundColor: AppColors.secondary,
      child: const Icon(Icons.bug_report),
    );
  }
}
