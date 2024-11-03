import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants/spacing.dart';
import '../../../../core/utils/constants/styles.dart';
import '../../../../core/utils/routing/router.dart';

class TodoDetails extends StatelessWidget {
  const TodoDetails({super.key, required this.todoDetailsScreenArgs});
  final TodoDetailsScreenArgs todoDetailsScreenArgs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo details")),
      body: Column(
        children: [
          verticalSpace(16.h),
          Text(
            todoDetailsScreenArgs.todoTitle,
            style: Styles.font24BlackBold(context),
          ),
          verticalSpace(8.h),
          Text(
            todoDetailsScreenArgs.todoDesc,
            style: Styles.font12LightGrayMedium.copyWith(fontSize: 14),
          ),
          verticalSpace(16.h)
        ],
      ),
    );
  }
}
