// ignore_for_file: use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
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
        child: Column(
          spacing: 16,
          children: [
            BackAppBar(
              title: 'Perfil',
              showMore: false,
              onBack: () {
                Modular.get<AppNavBarController>().changePage(0);
              },
              // suffix: SvgPicture.asset(
              //   AppAssets.svgs.logo,
              //   width: 50,
              //   colorFilter: const ColorFilter.mode(
              //     AppColors.white,
              //     BlendMode.srcIn,
              //   ),
              // ),
            ),
            _myData.pH(16).expandedH(),
            _buildAddress.pH(16).expandedH(),
            _buildLogoutButton(),
            Gap(80 + context.mq.padding.bottom),
          ],
        ),
      ),
    );
  }

  Widget get _myData => Panel(
    child: Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                //TODO: Change Photo
              },
              child: Badge(
                label: const Icon(Icons.edit, size: 12, color: Colors.white),
                padding: const EdgeInsets.all(4),
                backgroundColor: AppColors.primary,
                child: ImageCached(
                  url: session.user?.avatarUrl,
                  radius: 16,
                  width: 80,
                  height: 80,
                  //
                ),
              ),
            ),
            const Gap(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  '${session.user?.name}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey_800,
                  ),
                  maxLines: 2,
                ).expandedH(),

                Text(
                  '+55 ${UtilBrasilFields.obterTelefone(session.user?.phone.replaceAll('+55', '') ?? '')}',
                  style: const TextStyle(fontSize: 12),
                ),
                Text('${session.user?.email}', style: const TextStyle(fontSize: 12)),
              ],
            ).expanded(),
          ],
        ),
        const Gap(16),
        Panel(
          color: context.colorScheme.primaryContainer,
          onTap: () {
            //
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Gap(16),
              Text(
                'Editar meus dados',
                style: TextStyle(
                  fontWeight: AppFonts.semiBold,
                  color: AppColors.grey_500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.grey_500,
                size: 16,
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget get _buildAddress => Panel(
    onTap: () {
      //
    },
    child: Column(
      children: [
        Row(
          children: [
            const Icon(Icons.place_rounded, color: AppColors.grey_800, size: 16),
            const Gap(4),
            const Text(
              'Endereço',
              style: TextStyle(fontWeight: AppFonts.bold, color: AppColors.grey_800),
            ).expanded(),

            const Icon(Icons.edit_rounded, color: AppColors.primary, size: 16),
          ],
        ),
        const Gap(16),
        Text(
          session.user?.address.address ?? '',
          style: const TextStyle(color: AppColors.grey_400),
        ).expandedH(),
      ],
    ),
  );

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
        'Sair do app',
        style: TextStyle(
          fontSize: 14,
          fontWeight: AppFonts.bold,
          color: AppColors.red_400,
        ),
      ),
    );
  }
}
