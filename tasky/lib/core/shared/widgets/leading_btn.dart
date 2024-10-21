import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/constants/images.dart';

IconButton buildLeadingBtn(BuildContext context) {
  return IconButton(
    onPressed: () => Navigator.pop(context),
    icon: SvgPicture.asset(
      AppAssets.arrowLeftDark,
      width: 18.w,
      height: 12.h,
    ),
  );
}
