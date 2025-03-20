import 'package:flutter/material.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';

class FinalListIndicator extends StatelessWidget {
  const FinalListIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Container(width: 80, height: 5, decoration: BoxDecoration(color: context.colorScheme.tertiaryContainer, borderRadius: BorderRadius.circular(4)))],
    ).pTop(8);
  }
}
