import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';

class CustomStepIndicator extends StatelessWidget {
  const CustomStepIndicator({super.key, this.backgroundColor, this.height, this.indicatorColor, required this.percentage});

  final double? height;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 5,
      decoration: BoxDecoration(color: backgroundColor ?? context.colorScheme.tertiaryContainer, borderRadius: BorderRadius.circular(4)),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              AnimatedContainer(
                duration: 300.ms,
                decoration: BoxDecoration(color: indicatorColor ?? (context.isDark ? AppColors.secondary : AppColors.secondary), borderRadius: BorderRadius.circular(4)),
                width: constraints.maxWidth * percentage,
              ),
            ],
          );
        },
      ),
    );
  }
}
