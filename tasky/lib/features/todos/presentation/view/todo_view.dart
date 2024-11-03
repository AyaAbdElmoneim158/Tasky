import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/shared/widgets/app_title.dart';
import '../../../../core/utils/constants/images.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/constants/spacing.dart';
import '../../../../core/utils/routing/routes.dart';
import 'widgets/todo_body.dart';
import 'widgets/todo_floating_action_btns.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppTitle(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.profileView);
            },
            icon: SvgPicture.asset(
              AppAssets.profileIcon,
              width: 24.w,
              height: 24.h,
            ),
          ),
          horizontalSpace(AppSizes.spaceBtwItems / 2),
        ],
      ),
      floatingActionButton: buildTodoFloatingActionBtns(context),
      body: const TodoBody(),
    );
  }
}
