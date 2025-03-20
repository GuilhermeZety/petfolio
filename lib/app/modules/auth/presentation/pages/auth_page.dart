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
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

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
      OverlayUIUtils.setOverlayStyle(barDark: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: ScaffoldGradientBackground(
        floatingActionButton: _debugFloatingActionButton(),
        gradient: AppColors.gradient,
        body: SizedBox(
          width: context.width,
          height: context.height,
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.svgs.logoIcon,
                      width: 160,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ).hero('logo_icon'),
                    const Gap(16),
                    SvgPicture.asset(
                      AppAssets.svgs.logoName,
                      width: 160,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ).hero('logo_name'),
                  ],
                ).expanded(),
                Container(
                  width: context.width,
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondaryContainer,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.changeOpacity(0.15),
                        blurRadius: 20,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'access'.capitalize(),
                          style: context.textTheme.titleLarge!.copyWith(
                            fontSize: 36,
                            fontWeight: AppFonts.bold,
                          ),
                        ),
                        Text(
                          'welcome_back_insert_your_data_to_access',
                          style: context.textTheme.bodySmall!,
                        ),
                        const Gap(32),
                        Input.email(
                          controller.emailController,
                          hint: 'insert_your_email',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validation: InputValidations.emailValidation,
                          onChange: (_) {
                            if (mounted) setState(() {});
                          },
                        ),
                        const Gap(12),
                        Input.password(
                          controller.passwordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validation:
                              (value) => InputValidations.simpleInputValidation(
                                value,
                                minLengh: 3,
                              ),
                          hint: 'insert_your_password_here',
                          onChange: (_) {
                            if (mounted) setState(() {});
                          },
                        ),
                        const Gap(12),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                FocusScope.of(context).unfocus();

                                UrlLauncherUtils.to(
                                  context,
                                  'https://amaggi.w2o.com.br/forgot-password',
                                );
                              },
                              child: const Text(
                                'forgot_my_password',
                                style: TextStyle(
                                  color: AppColors.grey_500,
                                  fontWeight: AppFonts.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(40),
                        Button(
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            await controller.login(context);
                          },
                          child: Text('access'.capitalize()),
                        ).expandedH(),
                        Gap(context.safeArea(AxisDirection.down)),
                      ],
                    ).p(32),
                  ),
                ).slideFade(true, fadeInit: 0.6, range: 0.2, delay: 0.microseconds),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget? _debugFloatingActionButton() {
    if (!kDebugMode) {
      return null;
    }
    var accessData = ('dadasd@sdaasd.com', 'senha');

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
