import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';
import 'package:petfolio/app/core/shared/models/pet_model.dart';
import 'package:petfolio/app/ui/components/image_cached.dart';
import 'package:petfolio/app/ui/components/panel.dart';
import 'package:petfolio/app/ui/components/tag.dart';

class PetItem extends StatelessWidget {
  const PetItem({super.key, required this.pet});

  final PetModel pet;

  @override
  Widget build(BuildContext context) {
    return Panel(
      child: Row(
        children: [
          ImageCached(url: pet.photo, width: 90, height: 90, radius: 8),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pet.name ?? 'sem nome',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: AppFonts.bold,
                  color: AppColors.grey_900,
                  //
                ),
              ),
              Text(
                '${pet.corPrimaria}/${pet.corSecundaria}',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              const Gap(4),
              Tag(
                value: pet.animal ?? 'animal',
                color: AppColors.primary,
                //
              ),
            ],
          ),
        ],
      ),
    );
  }
}
