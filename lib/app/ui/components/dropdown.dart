import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({
    super.key,
    this.selected,
    this.onTap,
    this.label,
    this.optional = false,
    this.disabled = false,
    this.action,
  });
  final String? label;
  final Widget? selected;
  final bool optional;
  final bool disabled;
  final Widget? action;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var newChild = selected ?? const Text('select');
    if (newChild is Text) {
      newChild =
          Text(newChild.data!, style: const TextStyle(fontSize: 16)).expanded();
    }

    return Stack(
      children: [
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (label != null) ...[
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: label!,
                        children: [
                          if (!optional)
                            TextSpan(
                              text: ' *',
                              style: TextStyle(color: context.colorScheme.error),
                            )
                          else
                            TextSpan(
                              text: ' (${'optional'})',
                              style: TextStyle(
                                color: AppColors.grey_500.changeOpacity(0.5),
                              ),
                            ),
                        ],
                      ),
                      style: TextStyle(
                        fontWeight: AppFonts.bold,
                        color: context.textTheme.titleMedium?.color,
                        fontSize: 15,
                      ),
                    ).expanded(),
                    if (action != null) action!,
                  ],
                ),
                const Gap(5),
              ],
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: disabled ? null : onTap,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: context.colorScheme.tertiaryContainer),
                    borderRadius: BorderRadius.circular(8),
                    color: context.colorScheme.primaryContainer,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  width: double.infinity,
                  child: Row(
                    children: [
                      newChild,
                      const Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (disabled)
          Positioned.fill(
            child: Container(
              color: context.colorScheme.secondaryContainer.changeOpacity(0.6),
            ),
          ),
      ],
    );
  }
}

Widget? selected(String? name) {
  return name == null
      ? null
      : Text(
        name,
        style: TextStyle(fontSize: 16, color: AppColors.primary.darken(0.3)),
      ).expanded();
}
