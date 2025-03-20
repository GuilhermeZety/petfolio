import 'package:flutter/material.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';
import 'package:petfolio/app/ui/components/panel.dart';

class ModuleItem extends StatelessWidget {
  const ModuleItem({super.key, required this.name, required this.itenForSync, required this.icon, this.onTap, this.color});

  final String name;
  final Widget icon;
  final Color? color;
  final int itenForSync;
  final dynamic Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Panel(
              border: Border.all(color: context.colorScheme.tertiaryContainer),
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Panel(
                    padding: const EdgeInsets.all(8),
                    withShadow: false,
                    color: color?.changeOpacity(0.2).lighten(context.isDark ? 0.5 : 0.2),
                    child: icon,
                    //
                  ),
                  Text(name, style: TextStyle(fontSize: 16, fontWeight: AppFonts.bold, color: context.textTheme.displayMedium?.color)),
                  const Icon(Icons.keyboard_arrow_right_rounded, color: AppColors.grey_600),
                ],
              ),
            ),
          ],
        ).pTop(itenForSync == 0 ? 0 : 8),
        if (itenForSync > 0)
          Container(
            margin: const EdgeInsets.only(left: 8),
            color: AppColors.red_400,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: Text('${itenForSync == 1 ? '1 item' : '$itenForSync itens'} a sincronizar', style: const TextStyle(color: AppColors.white, fontSize: 10)),
          ),
      ],
    );
  }
}
