// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/constants/app_assets.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';
import 'package:petfolio/app/core/shared/models/user_model.dart';
import 'package:petfolio/app/modules/home/presentation/dialogs/logout_confirmation_modal.dart';
import 'package:petfolio/app/ui/components/appbars/back_app_bar.dart';
import 'package:petfolio/app/ui/components/image_cached.dart';
import 'package:petfolio/app/ui/components/nav_bar.dart';
import 'package:petfolio/app/ui/components/panel.dart';
import 'package:petfolio/app/ui/components/panel_background.dart';
import 'package:petfolio/app/ui/components/refresh_page.dart';
import 'package:petfolio/main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AppNavBarController navController = Modular.get();
  UserModel user = session.user!;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: RefreshPage(
        onRefresh: () async {
          // if (await Modular.get<ConnectionService>().isConnected) {
          //   var resp = await Modular.get<RefreshToken>()(NoParams());
          //   if (resp.isSuccess) {
          //     Toasting.success(
          //       context,
          //       title: 'session_updated'.t,
          //       description: 'access_and_user_data_updated_successfully'.t,
          //     );
          //   }
          //   if (resp.isFailure) {
          //     var failure = resp.fold((l) => l, (r) => null);

          //     if (failure is TokenExpiredFailure) {
          //       await session.tokenExpired(context: context);
          //     }
          //   }
          //   if (mounted) setState(() {});
          // }
        },
        displacement: 100,
        child: Stack(
          children: [
            Column(
              children: [
                BackAppBar(
                  backAction: () {
                    navController.changePage(0);
                  },
                  suffix: SvgPicture.asset(
                    AppAssets.svgs.logo,
                    width: 50,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                PanelBackground(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${'Versão'}: ${packageInfo.version}',
                          style: const TextStyle(color: AppColors.grey_400),
                        ),
                      ).pRight(24),
                      const Gap(8),
                      SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        child: Column(
                          children: [
                            const Gap(36),
                            _buildMyDataSection(),
                            const Gap(12),
                            _buildLogoutButton(),
                            Gap(80 + context.mq.padding.bottom),
                          ],
                        ),
                      ).expanded(),
                    ],
                  ),
                ).slideFade(true, range: 0.01, fadeInit: 1).expanded(),
              ],
            ),
            Positioned(
              top: context.safeArea(AxisDirection.up) + 30,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.changeOpacity(0.05),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ImageCached(url: user.avatarUrl, width: 110, height: 110),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMyDataSection() {
    return const Panel(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Meus Dados',
            style: TextStyle(fontSize: 20, fontWeight: AppFonts.bold),
          ),
          Gap(4),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return TextButton(
      onPressed: () {
        LogoutConfirmationModal.show(context);
      },
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 14),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: const Text(
        'logout',
        style: TextStyle(
          fontSize: 14,
          fontWeight: AppFonts.bold,
          color: AppColors.red_400,
        ),
      ),
    );
  }
}
