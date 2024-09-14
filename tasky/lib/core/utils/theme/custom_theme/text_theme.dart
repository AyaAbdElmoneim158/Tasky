import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeXXLg,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeXLg,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeLg,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeMd,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeMd,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeMd,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeSm,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeSm,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeSm,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeXSm,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: AppSizes.fontSizeXSm,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondary,
    ),
  );
}
