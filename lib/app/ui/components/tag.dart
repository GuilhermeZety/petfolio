import 'package:flutter/material.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';

class Tag extends StatelessWidget {
  const Tag({super.key, required this.value, required this.color});

  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color.changeOpacity(0.1), borderRadius: BorderRadius.circular(5), border: Border.all(color: color, strokeAlign: BorderSide.strokeAlignOutside)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(value, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color)),
    );
  }
}
