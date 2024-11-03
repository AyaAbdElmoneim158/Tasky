import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/constants/styles.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../core/utils/routing/router.dart';
import '../../../../../core/utils/routing/routes.dart';
import '../../../data/models/todo_response.dart';

Widget buildTodoInfoCard(TodoResponse todo, context) {
  return GestureDetector(
    onTap: () =>
        //ToDo: do... TodoResponse.todo.object
        // TodoDetails
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const TodoDetails(),
        //   ),
        // );
        // Navigator.pushNamed(context, AppRoutes.todoDetails,

        // )

        Navigator.pushNamed(
      context,
      AppRoutes.todoDetailsView,
      arguments: TodoDetailsScreenArgs(
          todoImage: todo.image!,
          todoTitle: todo.title!,
          id: todo.id!,
          todoDesc: todo.desc!,
          priority: todo.priority!,
          status: todo.status!),
    ),
    child: Container(
      color: Colors.white,
      height: 96.h, // You can adjust the height as needed
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                todo.title ?? "Title",
                                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                color: AppHelperFunctions.getRightStatusContainerColor(todo.status ?? "In progress"),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Text(
                                todo.status ?? "status",
                                style: Styles.font12GrayRegular
                                    .copyWith(color: AppHelperFunctions.getRightStatusTextColor(todo.status!)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          todo.desc ?? "desc",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppHelperFunctions.getRightFlagImage(
                                todo.priority?.toLowerCase() ?? "low",
                              ),
                              height: 16.h,
                              width: 16.w,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              todo.priority ?? "medium",
                              style: Styles.font12MainPurpleMedium.copyWith(
                                fontSize: 14.sp,
                                color: AppHelperFunctions.getRightPriorityTextColor(todo.priority ?? "medium"),
                              ),
                            ),
                            const Spacer(),
                            Text(AppHelperFunctions.convertTimestampToDate(todo.createdAt ?? "20/3/5"),
                                style: Styles.font12GrayRegular),
                          ],
                        ),
                        Icon(
                          Icons.more_vert,
                          size: 25.h,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
