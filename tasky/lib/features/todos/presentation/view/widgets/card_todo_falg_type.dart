import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/styles.dart';

class CardTodoFlagType extends StatelessWidget {
  const CardTodoFlagType({
    super.key,
    required this.taskType,
    this.isSelected = false,
  });

  final String taskType;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.sm),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.textLightGrey,
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg * 2),
      ),
      child: Text(
        taskType,
        style: Styles.font16GrayRegular.copyWith(
          color: isSelected ? AppColors.white : AppColors.textDarkerGrey,
        ),
      ),
    );
  }
}
