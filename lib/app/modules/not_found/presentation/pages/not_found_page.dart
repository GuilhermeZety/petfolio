import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/constants/app_assets.dart';
import 'package:petfolio/app/core/common/constants/app_routes.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';
import 'package:petfolio/app/ui/components/button.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Gap(10),
                Column(
                  children: [
                    Container(
                      width: context.width - 40,
                      height: context.width - 40,
                      constraints: const BoxConstraints(
                        maxWidth: 300,
                        maxHeight: 300,
                      ),
                      child: SvgPicture.asset(AppAssets.svgs.notFound),
                    ),
                    const Text(
                      'page_not_found',
                      style: TextStyle(fontWeight: AppFonts.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(10),
                    const Text(
                      'this_page_does_not_exist_or_was_removed',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Button(
                  onPressed:
                      () async => Modular.to.pushNamedAndRemoveUntil(
                        AppRoutes.splash,
                        (_) => false,
                      ),
                  child: const Text('back_to_home_screen'),
                ).pBottom(24).expandedH(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
