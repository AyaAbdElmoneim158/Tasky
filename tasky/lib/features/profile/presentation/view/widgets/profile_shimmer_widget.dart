import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/utils/constants/sizes.dart';
import 'package:tasky/core/utils/constants/spacing.dart';
import '../../../../../core/shared/shimmer_effect.dart';

class ProfileShimmerWidget extends StatelessWidget {
  const ProfileShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppShimmerEffect(
          width: double.infinity,
          height: 50.h,
        ),
        verticalSpace(AppSizes.sm),
        AppShimmerEffect(
          width: double.infinity,
          height: 50.h,
        ),
        verticalSpace(AppSizes.sm),
        AppShimmerEffect(
          width: double.infinity,
          height: 50.h,
        ),
        verticalSpace(AppSizes.sm),
        AppShimmerEffect(
          width: double.infinity,
          height: 50.h,
        ),
        verticalSpace(AppSizes.sm),
        AppShimmerEffect(
          width: double.infinity,
          height: 50.h,
        ),
        verticalSpace(AppSizes.xl),
      ],
    );
  }
}
