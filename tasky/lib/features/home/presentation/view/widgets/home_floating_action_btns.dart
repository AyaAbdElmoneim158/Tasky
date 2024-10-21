import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images.dart';
import '../../../../../core/utils/constants/sizes.dart';

Column buildHomeFloatingActionBtns() {
  return Column(
    children: [
      Container(
        color: AppColors.onprogressDarkColor,
        width: 50.w,
        height: 50.h,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: SvgPicture.asset(
              AppAssets.barCodeIcon,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
      ),
      Container(
        color: AppColors.onprogressDarkColor,
        width: 64.w,
        height: 64.h,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              MdiIcons.plus,
              size: AppSizes.iconLg,
            ),
          ),
        ),
      )
    ],
  );
}
