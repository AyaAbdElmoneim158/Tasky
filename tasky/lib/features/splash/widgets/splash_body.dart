import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';

import '../../../core/shared/widgets/fade_in_image.dart';
import '../../../core/utils/constants/images.dart';

Center buildSplashBody() {
  return Center(
    child: AppFadeInImage(
      image: AppAssets.splash,
      //ToDo:: width: 127.w,
      height: 45.h,
    ).jelloIn(null),
  );
}
