import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: AppColors.textPrimary,
      size: AppSizes.iconMd,
    ),
    actionsIconTheme: IconThemeData(
      color: AppColors.textPrimary,
      size: AppSizes.iconMd,
    ),
    titleTextStyle: TextStyle(
      fontSize: AppSizes.fontSizeLg,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
  );
}
