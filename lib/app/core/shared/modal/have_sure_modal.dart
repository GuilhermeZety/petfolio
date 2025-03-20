import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/utils/custom_dialog_utils.dart';
import 'package:petfolio/app/ui/components/button.dart';
import 'package:petfolio/app/ui/components/dialogs/custom_dialog.dart';
import 'package:petfolio/main.dart';

class HaveSureModal extends StatefulWidget {
  const HaveSureModal({super.key, this.text, this.remove = false});

  final String? text;
  final bool remove;
  Future<bool?> show(BuildContext context) {
    return showCustomDialog<bool>(context, child: this);
  }

  @override
  State<HaveSureModal> createState() => _HaveSureModalState();
}

class _HaveSureModalState extends State<HaveSureModal> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      top: const Text(
        'Tem Certeza?',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      bottom: Column(
        children: [
          Button(
            backgroundColor:
                widget.remove ? AppColors.red_500 : context.colorScheme.primary,
            onPressed: () async {
              Navigator.pop(context, true);
            },
            child: Text(
              widget.remove ? 'Remover' : 'Confirmar',
              style: TextStyle(fontSize: 14 * session.fontSize),
            ),
          ).expandedH(),
          const Gap(6),
          Button.secondary(
            onPressed: () async {
              Navigator.pop(context);
            },
            child: Text(
              'Cancelar',
              style: TextStyle(fontSize: 14 * session.fontSize),
            ),
          ).expandedH(),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.text != null) ...[
              Text(widget.text!, textAlign: TextAlign.center),
            ],
          ],
        ),
      ),
    );
  }
}
