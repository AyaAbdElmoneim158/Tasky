import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../../../../core/utils/constants/styles.dart';

Container buildProfileCard(
  BuildContext context,
  String? title,
  String? subTitle,
) {
  return Container(
    width: double.infinity,
    // height: 100,
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
    decoration: Styles.profileCardDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //* title -------------------------------------------------------------->
        Text(
          title ?? "title",
          style: Styles.font12LightGrayMedium,
        ).zoomIn(750),
        verticalSpace(AppSizes.spaceBtwItems / 3),
        //* subTitle ----------------------------------------------------------->
        Text(
          subTitle ?? "subTitle",
          style: Styles.font18DarkerGreyMedium,
        ).zoomIn(750),
      ],
    ),
  );
}
