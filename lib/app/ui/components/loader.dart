import 'package:flutter/material.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.size, this.inverted = false, this.strokeWidth});

  final double? size;
  final double? strokeWidth;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 30,
      width: size ?? 30,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        strokeCap: StrokeCap.round,
        color: inverted ? AppColors.white : AppColors.primary,
        backgroundColor: inverted ? AppColors.primary : context.colorScheme.secondaryContainer,
      ),
    );
  }
}
