// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';

class PanelBackground extends StatelessWidget {
  const PanelBackground({super.key, this.child, this.width, this.height, this.padding});

  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.colorScheme.primaryContainer, borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      padding: padding ?? const EdgeInsets.only(top: 24, left: 24, right: 24),
      constraints: BoxConstraints(maxWidth: context.width),
      width: width ?? context.width,
      height: height ?? context.height,
      child: child,
    );
  }
}
