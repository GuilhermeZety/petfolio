import 'package:flutter/material.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';

class ShimmedBox extends StatelessWidget {
  const ShimmedBox({super.key, this.height, this.width, this.margin, this.padding});

  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(color: AppColors.black.changeOpacity(0.1), borderRadius: BorderRadius.circular(0)),
    ).shim();
  }
}
