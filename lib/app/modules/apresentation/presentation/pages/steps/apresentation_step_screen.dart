import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';

class ApresentationStepScreen extends StatelessWidget {
  const ApresentationStepScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });
  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge,
        ).pOnly(top: context.height * 0.08).slideFade(false, delay: 100.ms),
        Center(
          child: SvgPicture.asset(image, width: 200),
        ).pH(32).slideFade(false, delay: 200.ms),

        Text(subtitle).slideFade(false, delay: 300.ms),
      ],
    ).pH(32);
  }
}
