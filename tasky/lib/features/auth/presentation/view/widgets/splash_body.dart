import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import '../../../../../core/utils/constants/images.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppAssets.splash,
        height: 45.h,
      ).jelloIn(null),
    );
  }
}
