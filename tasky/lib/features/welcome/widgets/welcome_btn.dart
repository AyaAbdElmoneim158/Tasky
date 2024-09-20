import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/constants/images.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/constants/spacing.dart';
import '../../../core/utils/helpers/helper_functions.dart';

Padding buildWelcomeBtn(
  BuildContext context,
  void Function()? onPressed,
) {
  return Padding(
    padding: EdgeInsets.all(AppSizes.defaultPadding),
    child: SizedBox(
      width: AppHelperFunctions.screenWidth(context),
      child: ElevatedButton(
        onPressed: () {
          onPressed!();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Let’s Start"),
            horizontalSpace(AppSizes.sm),
            SvgPicture.asset(
              AppAssets.arrowLeftLight,
              width: 18.w,
              height: 12.h,
            ),
          ],
        ),
      ),
    ),
  );
}
