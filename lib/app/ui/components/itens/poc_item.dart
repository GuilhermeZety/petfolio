import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/ui/components/panel.dart';

class PocItem extends StatelessWidget {
  const PocItem({super.key, required this.poc});

  final Map<String, dynamic> poc;

  @override
  Widget build(BuildContext context) {
    return Panel(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                poc['numero'],
                style: TextStyle(
                  color: context.isDark ? AppColors.primaryLight : AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                poc['tipo'],
                style: const TextStyle(
                  color: AppColors.secondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.right,
              ).expanded(),
            ],
          ),
          const Gap(4),
          _buildItem('company', poc['empresa']),
          _buildItem('sector', poc['setor']),
          _buildItem('sub_sector', poc['sub_setor']),
        ],
      ),
    );
  }

  Widget _buildItem(String title, String value) {
    return Text.rich(
      TextSpan(
        text: '$title: ',
        style: const TextStyle(fontSize: 13),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
