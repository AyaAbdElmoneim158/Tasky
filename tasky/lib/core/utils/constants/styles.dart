import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/utils/constants/sizes.dart';

import 'colors.dart';

class Styles {
  Styles._();
  static TextStyle font244BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle font24BlackBold(BuildContext context) => Theme.of(context).textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle font14BlackRegular(BuildContext context) => Theme.of(context).textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w400,
      );

  static TextStyle font14LightGrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textHintGray,
  );

  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textGray,
  );

  static TextStyle font14PurpleBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.primary,
  );

  static TextStyle font16GrayBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.textPrimary.withOpacity(0.6),
  );

  static TextStyle font16BlackBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle font12GrayRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.textSecondary,
    height: 18,
  );

  static TextStyle font16GrayRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font12DarkMedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font19PurpleMedium = TextStyle(
    fontSize: 19.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.primary,
  );

  static TextStyle font12MainPurpleMedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.primary,
  );

  static TextStyle font19WhiteBold = TextStyle(
    fontSize: 19.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );

  static TextStyle font12LightGrayMedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.textDarkerGrey,
    height: 16,
  );

  static TextStyle font18DarkerGreyMedium = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.textDarkerGrey,
    height: 24,
  );

  static BoxDecoration profileCardDecoration() {
    return BoxDecoration(
      color: AppColors.profileCard,
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
    );
  }
}

class FontWeightHelper {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}
