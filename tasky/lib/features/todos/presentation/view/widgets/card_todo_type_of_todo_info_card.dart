import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/styles.dart';

class CardTodoTypeOfTodoInfoCard extends StatelessWidget {
  const CardTodoTypeOfTodoInfoCard({
    super.key,
    required this.taskType,
    this.isSelected = false,
  });

  final String taskType;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.xs),
      decoration: BoxDecoration(
        color: taskType.toLowerCase() == "waiting"
            ? AppColors.waitingDarkColor
            : taskType.toLowerCase() == "onprogress"
                ? AppColors.onprogressDarkColor
                : AppColors.finishedDarkColor,
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusSm),
      ),
      child: Text(
        taskType,
        style: Styles.font12DarkMedium.copyWith(
          color: taskType.toLowerCase() == "waiting"
              ? AppColors.waitingDarkColor
              : taskType.toLowerCase() == "onprogress"
                  ? AppColors.onprogressDarkColor
                  : AppColors.finishedDarkColor,
        ),
      ),
    );
  }
}
