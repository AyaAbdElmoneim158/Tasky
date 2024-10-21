import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/constants/styles.dart';
import 'card_task_flag_type.dart';
import 'card_task_type_of_task_info_card.dart';

Widget buildTaskInfoCard() {
  return SizedBox.shrink(
    // height: 96.h,
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,

      children: [
        Expanded(
          flex: 3,
          child: CircleAvatar(
            radius: AppSizes.borderRadiusXLg * 3,
            backgroundImage: AssetImage(AppAssets.logo),
          ),
        ),
        horizontalSpace(AppSizes.spaceBtwItems),
        SizedBox.shrink(
          // height: 72.h,
          child: Expanded(
            flex: 8,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        AppStrings.loremText,
                        style: Styles.font16BlackBold,
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const CardTaskTypeOfTaskInfoCard(taskType: "Waiting"),
                  ],
                ),
                Text(
                  AppStrings.loremText,
                  style: Styles.font14GrayRegular.copyWith(
                    color: AppColors.textPrimary.withOpacity(0.6),
                  ),
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CardTaskFlagType(taskType: "Low"),
                    Text("30/12/2023", style: Styles.font12GrayRegular),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              MdiIcons.dotsVertical,
              size: AppSizes.iconMd,
            ),
          ),
        ),
      ],
    ),
  );
}
