import 'package:flutter/material.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/ui/components/shimed_box.dart';

class Panel extends StatelessWidget {
  final EdgeInsets padding;
  final Widget? child;
  final double? width;
  final double? height;
  final bool withShadow;
  final bool isLoading;
  final Border? border;
  final BorderRadius? radius;
  final Color? color;
  final Color? splashColor;
  final Function()? onTap;
  final Function()? onLongPress;
  final bool? clickable;

  const Panel({
    super.key,
    this.padding = const EdgeInsets.all(20),
    this.child,
    this.withShadow = true,
    this.isLoading = false,
    this.width,
    this.height,
    this.border,
    this.onTap,
    this.onLongPress,
    this.clickable,
    this.color,
    this.splashColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return ShimmedBox(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
      );
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: border,
        borderRadius: radius ?? BorderRadius.circular(10),
        boxShadow:
            withShadow
                ? [
                  BoxShadow(
                    color: AppColors.black.changeOpacity(0.06),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ]
                : [],
      ),
      child: Material(
        color: color ?? context.colorScheme.secondaryContainer,
        borderRadius: radius ?? BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          enableFeedback: true,
          onLongPress: onLongPress,
          borderRadius: radius ?? BorderRadius.circular(10),
          splashColor: splashColor ?? context.colorScheme.primary.changeOpacity(0.1),
          overlayColor: WidgetStateProperty.all<Color>(
            splashColor?.changeOpacity(0.5) ??
                context.colorScheme.primary.changeOpacity(0.1),
          ),
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
