// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/routing/router.dart';
import '../../../../../core/utils/routing/routes.dart';
import '/core/utils/constants/sizes.dart';
import '/core/utils/constants/spacing.dart';
import '/core/utils/constants/strings.dart';
import '/core/utils/constants/styles.dart';
import '/core/utils/helpers/extension_helper.dart';
import '/core/utils/helpers/helper_functions.dart';

import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images.dart';
import '../../view_model/todo_cubit.dart';
import 'add_img_button.dart';
import 'custom_enum_row_button.dart';

class AddEditTodoBody extends StatefulWidget {
  const AddEditTodoBody({
    super.key,
    this.addEditTodoScreenArgs,
  });
  final AddEditTodoScreenArgs? addEditTodoScreenArgs;

  @override
  State<AddEditTodoBody> createState() => _AddEditTodoBodyState();
}

class _AddEditTodoBodyState extends State<AddEditTodoBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  String todoPriority = Priority.low.name;
  String todoStatus = Status.waiting.name;
  XFile? todoImage;
  bool isEdit = false;

  @override
  void initState() {
    if (widget.addEditTodoScreenArgs!.isEdit) {
      titleController.text = widget.addEditTodoScreenArgs!.todoTitle!;
      descriptionController.text = widget.addEditTodoScreenArgs!.todoDesc!;
      todoPriority = widget.addEditTodoScreenArgs!.priority!;
      todoStatus = todoStatus;
      todoImage = null;
    } else {
      clearData();
    }

    super.initState();
  }

  void clearData() {
    titleController.clear();
    descriptionController.clear();
    dueDateController.clear();
    todoPriority = Priority.low.name;
    todoStatus = Status.waiting.name;
    todoImage = null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(listener: (BuildContext context, TodoState state) {
      if (state is CreateTodoSuccessState) {
        context.showAwesomeSnackBar(message: "Congratulations! Added Todo");
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, AppRoutes.homeView);
        });
      } else if (state is CreateTodoErrorState) {
        context.showAwesomeSnackBar(
          message: "Error! Added Todo",
          type: ContentType.failure,
        );
        // Future.delayed(const Duration(seconds: 3), () {
        //   Navigator.pushReplacementNamed(context, AppRoutes.homeView);
        // });
      }
    }, builder: (BuildContext context, TodoState state) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultPadding),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // Add image ----------------------------------------------------------------
                const AddImgButton().zoomIn(null),
                verticalSpace(AppSizes.spaceBtwItems),
                // Todo title field ----------------------------------------------------------------
                buildTodoTitleField(context),
                verticalSpace(AppSizes.spaceBtwItems),
                // Todo Dec field ----------------------------------------------------------------
                buildTodoDecField(context),
                verticalSpace(AppSizes.spaceBtwItems),
                // Todo Priority field ----------------------------------------------------------------
                buildTodoPriorityField(context),
                //! ************************* */
                widget.addEditTodoScreenArgs!.isEdit ? buildStatusField(context) : const SizedBox(),
                // Todo Due date field ----------------------------------------------------------------
                buildTodoDueDateField(context),
                verticalSpace(AppSizes.spaceBtwSections),
                // Add Todo Btn ----------------------------------------------------------------
                AddTodoButton(
                  addEditTodoScreenArgs: widget.addEditTodoScreenArgs,
                  formKey: formKey,
                  // todoImage: todoImage,
                  desc: descriptionController.text.trim(),
                  dueDate: dueDateController.text.trim(),
                  imagePath: todoImage?.path,
                  priority: todoPriority,
                  title: titleController.text.trim(),
                ).zoomIn(1500),
              ],
            ),
          ),
        ),
      );
    });
  }

  Column buildTodoDueDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.dueDate,
          style: Styles.font12GrayRegular,
          textAlign: TextAlign.start,
        ).zoomIn(750),
        verticalSpace(AppSizes.spaceBtwItems / 2),
        TextFormField(
          enabled: false,
          controller: dueDateController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            hintText: AppStrings.chooseExperienceLevel,
            suffixIcon: GestureDetector(
              onTap: () async {
                await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2080),
                  initialDate: DateTime.now(),
                ).then((value) {
                  var formattedDate = AppHelperFunctions.convertTimestampToDate(value.toString());
                  dueDateController.text = formattedDate;
                });
              },
              child: SvgPicture.asset(
                AppAssets.calendar,
                width: 12.w,
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
            initialValue: StatusExtension.fromApiValue(todoStatus),
            values: Status.values,
            displayName: (status) => status.displayName,
            apiValue: (status) => status.apiValue,
            containerColor: (status) => AppHelperFunctions.getRightStatusContainerColor(status.apiValue),
            textColor: (status) => AppHelperFunctions.getRightStatusTextColor(status.apiValue),
            onValueSelected: (status) {
              todoStatus = status.apiValue;
            },
          ),
        ),
      ],
    );
  }

  Column buildTodoPriorityField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.priority,
          style: Styles.font12GrayRegular,
          textAlign: TextAlign.start,
        ).zoomIn(750),
        verticalSpace(AppSizes.spaceBtwItems / 2),
        CustomEnumRowButton<Priority>(
          initialValue:
              //PriorityExtension.fromApiValue(Priority.low.name), //
              PriorityExtension.fromApiValue(todoPriority),
          values: Priority.values,
          displayName: (priority) => priority.displayName,
          apiValue: (priority) => priority.apiValue,
          containerColor: (priority) => AppHelperFunctions.getRightPriorityContainerColor(priority.apiValue),
          flagImage: (priority) => AppHelperFunctions.getRightFlagImage(priority.apiValue),
          textColor: (priority) => AppHelperFunctions.getRightPriorityTextColor(priority.apiValue),
          onValueSelected: (priority) {
            todoPriority = priority.apiValue;
          },
        ),
      ],
    );
  }

  Column buildTodoDecField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.taskDec,
          style: Styles.font12GrayRegular,
          textAlign: TextAlign.start,
        ).zoomIn(1250),
        verticalSpace(AppSizes.spaceBtwItems / 2),
        TextFormField(
          maxLength: 5,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: AppStrings.enterTaskDescriptionHere,
          ),
        ).zoomIn(1500),
      ],
    );
  }

  Column buildTodoTitleField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.taskTitle,
          style: Styles.font12GrayRegular,
        ).zoomIn(750),
        verticalSpace(AppSizes.spaceBtwItems / 2),
        TextFormField(
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: AppStrings.enterTaskTitleHere,
          ),
        ).zoomIn(1000),
      ],
    );
  }
}

class AddTodoButton extends StatelessWidget {
  final AddEditTodoScreenArgs? addEditTodoScreenArgs;
  final GlobalKey<FormState> formKey;
  // final XFile? todoImage;
  final String? imagePath;
  final String? title;
  final String? desc;
  final String? priority;
  final String? dueDate;

  const AddTodoButton({
    super.key,
    this.addEditTodoScreenArgs,
    required this.formKey,
    // this.todoImage,
    this.imagePath,
    this.title,
    this.desc,
    this.priority,
    this.dueDate,
  });

  // const AddTodoButton({super.key,  this.formKey = GlobalKey(), this.addEditTodoScreenArgs});

  @override
  Widget build(BuildContext context) {
    return addEditTodoScreenArgs!.isEdit
        ? AppTextButton(
            buttonText: 'Update Todo',
            textStyle: Styles.font19WhiteBold,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<TodoCubit>().updateTodo(
                      addEditTodoScreenArgs!.id!,
                      imagePath: imagePath!,
                      context: context,
                    );
                debugPrint("Update Todo");
              }
            },
          )
        : AppTextButton(
            buttonText: 'Add Todo',
            textStyle: Styles.font19WhiteBold,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // uploadImage(context);
                context.read<TodoCubit>().createTodo(
                      desc: desc,
                      dueDate: dueDate,
                      imagePath: imagePath!,
                      priority: priority,
                      title: title!,
                    );
                // .uploadImage(context, todoImage);
                // Navigator.pop(context);
                debugPrint("Add Todo");
              }
            },
          );
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
      width: buttonWidth ?? 326.w,
      height: buttonHeight ?? 50.h,
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
            ),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            backgroundColor ?? AppColors.primary,
          ),
          padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 12.w,
              vertical: verticalPadding ?? 14.h,
            ),
          ),
          fixedSize: WidgetStateProperty.all<Size>(
            Size(buttonWidth ?? double.infinity, buttonHeight ?? 50.h),
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
