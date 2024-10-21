import 'package:flutter/material.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../../../../core/utils/constants/styles.dart';

Container buildProfileCard(
    BuildContext context, String title, dynamic subTitle) {
  return Container(
    padding: EdgeInsets.all(AppSizes.sm),
    decoration: Styles.profileCardDecoration(),
    child: Column(
      children: [
        //* Name -------------------------------------------------------------->
        Text(
          title,
          style: Styles.font14GrayRegular,
          textAlign: TextAlign.start,
        ).zoomIn(750),
        verticalSpace(AppSizes.spaceBtwItems / 3),
        Text(
          subTitle.toString(),
          style: Styles.font24BlackBold(context),
          textAlign: TextAlign.start,
        ).zoomIn(750),
      ],
    ),
  );
}
