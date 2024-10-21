import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: AppColors.primary),
      padding: EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems - 1),
      textStyle: buttonTextStyle(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg - 2),
      ),
    ),
  );

  static TextStyle buttonTextStyle() {
    return TextStyle(
      fontSize: AppSizes.fontSizeMd,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      height: 20,
      letterSpacing: 0.2,
    );
  }
}
