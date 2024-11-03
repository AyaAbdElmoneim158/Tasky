// ignore_for_file: use_build_context_synchronously

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/images.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../../../../core/utils/constants/styles.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../view_model/todo_cubit.dart';

class AddImgButton extends StatelessWidget {
  const AddImgButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TodoCubit addEditTodoCubit = context.read<TodoCubit>();

    return Padding(
      padding: EdgeInsets.only(top: 30.h, bottom: 15.h),
      child: GestureDetector(
        onTap: () => AppHelperFunctions.pickImage(
          ImageSource.gallery,
          context,
          addEditTodoCubit,
        ),
        child: DottedBorder(
          radius: const Radius.circular(10),
          color: AppColors.primary,
          borderType: BorderType.RRect,
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppAssets.addPhoto),
                horizontalSpace(10),
                Text(
                  'Add Img',
                  style: Styles.font19PurpleMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
