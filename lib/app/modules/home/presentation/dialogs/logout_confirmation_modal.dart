import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/constants/app_routes.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/utils/custom_dialog_utils.dart';
import 'package:petfolio/app/ui/components/button.dart';
import 'package:petfolio/app/ui/components/dialogs/custom_dialog.dart';
import 'package:petfolio/main.dart';

class LogoutConfirmationModal {
  const LogoutConfirmationModal();

  static Future show(BuildContext context) async {
    return showCustomDialog(
      context,
      child: CustomDialog(
        top: const Text(
          'Deseja realmente sair?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        bottom: Column(
          children: [
            Button(
              onPressed: () async {
                await session.logout();
                Modular.to.pushNamedAndRemoveUntil(AppRoutes.splash, (_) => false);
              },
              child: const Text('Sair'),
            ).expandedH(),
            const Gap(6),
            Button.secondary(
              onPressed: () async => Navigator.of(context).pop(),
              child: const Text('Agora não'),
            ).expandedH(),
          ],
        ),
        child: const Text(
          'Ao confirmar a saída, você não podera mais acessar o aplicativo, sendo necessário fazer o login novamente.',
          textAlign: TextAlign.center,
        ).p(20),
      ),
    );
  }
}
