import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/styles.dart';

class AppTextFieldTheme {
  AppTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    isDense: true,
    errorMaxLines: 3,
    hintStyle: Styles.font14LightGrayRegular,
    fillColor: Colors.white,
    filled: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
    floatingLabelStyle: const TextStyle()
        .copyWith(color: AppColors.textPrimary.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusXLg),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusXLg),
      borderSide: const BorderSide(width: 1.3, color: AppColors.borderPrimary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusXLg),
      borderSide: const BorderSide(width: 1.3, color: AppColors.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusXLg),
      borderSide: const BorderSide(width: 1.3, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.borderRadiusXLg),
      borderSide: const BorderSide(width: 1.3, color: Colors.red),
    ),
  );
}
