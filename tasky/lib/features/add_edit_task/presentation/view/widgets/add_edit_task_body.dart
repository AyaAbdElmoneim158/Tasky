// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/utils/constants/sizes.dart';
import 'package:tasky/core/utils/constants/spacing.dart';
import 'package:tasky/core/utils/constants/strings.dart';
import 'package:tasky/core/utils/constants/styles.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import 'package:tasky/core/utils/helpers/helper_functions.dart';

import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images.dart';
import '../../../../../core/utils/routing/router.dart';
import '../../view_model/add_edit_task_cubit.dart';
import 'add_img_button.dart';
import 'custom_enum_row_button.dart';

class AddEditTaskBody extends StatefulWidget {
  const AddEditTaskBody({
    super.key,
    this.addEditTaskScreenArgs,
  });
  final AddEditTaskScreenArgs? addEditTaskScreenArgs;

  @override
  State<AddEditTaskBody> createState() => _AddEditTaskBodyState();
}

class _AddEditTaskBodyState extends State<AddEditTaskBody> {
  @override
  void initState() {
    AddEditTaskCubit addEditTaskCubit = context.read<AddEditTaskCubit>();
    if (widget.addEditTaskScreenArgs!.isEdit) {
      addEditTaskCubit.titleController.text =
          widget.addEditTaskScreenArgs!.taskTitle!;
      addEditTaskCubit.descriptionController.text =
          widget.addEditTaskScreenArgs!.taskDesc!;
      addEditTaskCubit.taskPriority = widget.addEditTaskScreenArgs!.priority!;
      addEditTaskCubit.taskStatus = addEditTaskCubit.taskStatus;
      addEditTaskCubit.taskImage = null;
    } else {
      addEditTaskCubit.clearData();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddEditTaskCubit, AddEditTaskState>(
        listener: (BuildContext context, AddEditTaskState state) {},
        builder: (BuildContext context, AddEditTaskState state) {
          final addEditTaskCubit = BlocProvider.of<AddEditTaskCubit>(context);

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppSizes.defaultPadding),
              child: Column(
                children: [
                  // Add image ----------------------------------------------------------------
                  const AddImgButton().zoomIn(null),
                  verticalSpace(AppSizes.spaceBtwItems),
                  // Task title field ----------------------------------------------------------------
                  buildTaskTitleField(context),
                  verticalSpace(AppSizes.spaceBtwItems),
                  // Task Dec field ----------------------------------------------------------------
                  buildTaskDecField(context),
                  verticalSpace(AppSizes.spaceBtwItems),
                  // Task Priority field ----------------------------------------------------------------
                  buildTaskPriorityField(context),
                  //! ************************* */
                  widget.addEditTaskScreenArgs!.isEdit
                      ? buildStatusField(context)
                      : const SizedBox(),
                  // Task Due date field ----------------------------------------------------------------
                  buildTaskDueDateField(context),
                  verticalSpace(AppSizes.spaceBtwItems),
                  // Add Task Btn ----------------------------------------------------------------
                  const AddTaskButton().zoomIn(1500),
                ],
              ),
            ),
          );
        });
  }

  Column buildTaskDueDateField(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.dueDate,
          style: Styles.font24BlackBold(context),
          textAlign: TextAlign.start,
        ).zoomIn(750),
        verticalSpace(AppSizes.spaceBtwItems / 2),
        TextFormField(
          enabled: false,
          controller: context.read<AddEditTaskCubit>().dueDateController,
          decoration: InputDecoration(
            hintText: AppStrings.chooseExperienceLevel,
            suffixIcon: GestureDetector(
              onTap: () async {
                await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2080))
                    .then((value) {
                  var formattedDate = AppHelperFunctions.convertTimestampToDate(
                      value.toString());
                  context.read<AddEditTaskCubit>().dueDateController.text =
                      formattedDate;
                });
              },
              child: SvgPicture.asset(
                AppAssets.calendar,
                width: 18.w,
                height: 12.h,
              ),
            ),
          ),
        ).zoomIn(1250),
      ],
    );
  }

  Column buildStatusField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status',
          style: Styles.font12GrayRegular,
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
          child: CustomEnumRowButton<Status>(
            initialValue: StatusExtension.fromApiValue(
                context.read<AddEditTaskCubit>().taskStatus),
            values: Status.values,
            displayName: (status) => status.displayName,
            apiValue: (status) => status.apiValue,
            containerColor: (status) =>
                AppHelperFunctions.getRightStatusContainerColor(
                    status.apiValue),
            textColor: (status) =>
                AppHelperFunctions.getRightStatusTextColor(status.apiValue),
            onValueSelected: (status) {
              context.read<AddEditTaskCubit>().taskStatus = status.apiValue;
            },
          ),
        ),
      ],
    );
  }

  Column buildTaskPriorityField(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.taskDec,
          style: Styles.font24BlackBold(context),
          textAlign: TextAlign.start,
        ).zoomIn(750),
        verticalSpace(AppSizes.spaceBtwItems / 2),
        CustomEnumRowButton<Priority>(
          initialValue: PriorityExtension.fromApiValue(
              context.read<AddEditTaskCubit>().taskPriority),
          values: Priority.values,
          displayName: (priority) => priority.displayName,
          apiValue: (priority) => priority.apiValue,
          containerColor: (priority) =>
              AppHelperFunctions.getRightPriorityContainerColor(
                  priority.apiValue),
          flagImage: (priority) =>
              AppHelperFunctions.getRightFlagImage(priority.apiValue),
          textColor: (priority) =>
              AppHelperFunctions.getRightPriorityTextColor(priority.apiValue),
          onValueSelected: (priority) {
            context.read<AddEditTaskCubit>().taskPriority = priority.apiValue;
          },
        ),
      ],
    );
  }

  Column buildTaskDecField(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.taskDec,
          style: Styles.font24BlackBold(context),
          textAlign: TextAlign.start,
        ).zoomIn(1250),
        verticalSpace(AppSizes.spaceBtwItems / 2),
        TextFormField(
          maxLength: 5,
          decoration: const InputDecoration(
            hintText: AppStrings.enterTaskDescriptionHere,
          ),
        ).zoomIn(1500),
      ],
    );
  }

  Column buildTaskTitleField(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.taskTitle,
          style: Styles.font24BlackBold(context),
          textAlign: TextAlign.start,
        ).zoomIn(750),
        verticalSpace(AppSizes.spaceBtwItems / 2),
        TextFormField(
          decoration: const InputDecoration(
            hintText: AppStrings.enterTaskTitleHere,
          ),
        ).zoomIn(1000),
      ],
    );
  }
}

class AddTaskButton extends StatelessWidget {
  final AddEditTaskScreenArgs? addEditTaskScreenArgs;
  const AddTaskButton({super.key, this.addEditTaskScreenArgs});

  @override
  Widget build(BuildContext context) {
    return addEditTaskScreenArgs!.isEdit
        ? AppTextButton(
            buttonText: 'Update Task',
            textStyle: Styles.font19WhiteBold,
            onPressed: () {
              if (context
                  .read<AddEditTaskCubit>()
                  .formKey
                  .currentState!
                  .validate()) {
                context.read<AddEditTaskCubit>().updateTask(
                    addEditTaskScreenArgs!.taskImage,
                    addEditTaskScreenArgs!.id!,
                    context);
              }
            },
          )
        : AppTextButton(
            buttonText: 'Add Task',
            textStyle: Styles.font19WhiteBold,
            onPressed: () {
              if (context
                  .read<AddEditTaskCubit>()
                  .formKey
                  .currentState!
                  .validate()) {
                context.read<AddEditTaskCubit>().uploadImage(context);
              }
            },
          );
    /*return SizedBox(
      width: AppHelperFunctions.screenWidth(context),
      child: ElevatedButton(
        onPressed: () {
          
        },
        child: const Text(AppStrings.addTask),
      ),
    );*/
  }
}

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 326.w,
      height: 50.h,
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? AppColors.primary,
          ),
          padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 12.w,
              vertical: verticalPadding?.h ?? 14.h,
            ),
          ),
          fixedSize: WidgetStateProperty.all(
            Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 50.h),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: textStyle,
        ),
      ),
    );
  }
}
