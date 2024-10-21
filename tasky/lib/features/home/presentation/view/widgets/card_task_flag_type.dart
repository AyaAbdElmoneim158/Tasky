import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images.dart';
import '../../../../../core/utils/constants/styles.dart';

class CardTaskFlagType extends StatelessWidget {
  const CardTaskFlagType({
    super.key,
    required this.taskType,
  });

  final String taskType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          taskType.toLowerCase() == "medium"
              ? AppAssets.purpleFlagIcon
              : taskType.toLowerCase() == "low"
                  ? AppAssets.blueFlagIcon
                  : AppAssets.redFlagIcon,
          width: 16.w,
          height: 16.h,
        ),
        Text(
          taskType,
          style: Styles.font16GrayRegular.copyWith(
            color: taskType.toLowerCase() == "medium"
                ? AppColors.onprogressDarkColor
                : taskType.toLowerCase() == "low"
                    ? AppColors.finishedDarkColor
                    : AppColors.waitingDarkColor,
          ),
        ),
      ],
    );
  }
}
