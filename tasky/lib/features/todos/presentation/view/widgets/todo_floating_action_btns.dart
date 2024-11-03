import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../../../../core/utils/routing/router.dart';
import '../../../../../core/utils/routing/routes.dart';

Column buildTodoFloatingActionBtns(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      SizedBox(
        width: 50.w,
        height: 50.h,
        child: FloatingActionButton(
          backgroundColor: AppColors.lightPrimary,
          shape: const CircleBorder(),
          heroTag: "heroTag1",
          onPressed: () {
            // Navigator.pushNamed(context, Routes.barcodeScanner);
          },
          child: SvgPicture.asset(
            AppAssets.barCodeIcon,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ),
      verticalSpace(AppSizes.spaceBtwItems),
      SizedBox(
        width: 64.w,
        height: 64.h,
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          shape: const CircleBorder(),
          heroTag: "heroTag2",
          onPressed: () {
            // context.read<AddEditTodoCubit>().isEdit = false;
            // context.pushNamed(AppRoutes.addEditTodoView);
            Navigator.pushNamed(
              context,
              AppRoutes.addEditTodoView,
              arguments: AddEditTodoScreenArgs(isEdit: false),
            );
          },
          child: Icon(
            MdiIcons.plus,
            size: AppSizes.iconLg,
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}
