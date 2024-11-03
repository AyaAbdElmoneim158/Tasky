import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/constants/images.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../../../../core/utils/routing/routes.dart';

List<Widget> buildTodoActionsBtns(context) => [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.profileView);
        },
        icon: SvgPicture.asset(
          AppAssets.profileIcon,
          width: 24.w,
          height: 24.h,
        ),
      ),
      horizontalSpace(AppSizes.spaceBtwItems / 2),
      // IconButton(
      //   onPressed: () {
      //     context.showConfirmationDialog;
      //   },
      //   icon: SvgPicture.asset(
      //     AppAssets.exitIcon,
      //     width: 24.w,
      //     height: 24.h,
      //   ),
      // ),
    ];
