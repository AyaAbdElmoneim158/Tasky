// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../../../login/presentation/view_model/login_cubit.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../../view_model/register_cubit.dart';
import 'register_address_field.dart';
import 'register_btn.dart';
import 'register_choose_exp_field.dart';
import 'register_footer_text.dart';
import 'register_name_field.dart';
import 'register_password_field.dart';
import 'register_phone_field.dart';
import 'register_title.dart';
import 'register_year_exp_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterSuccessState ||
          current is RegisterSuccessState ||
          current is RegisterErrorState,
      listener: (BuildContext context, RegisterState state) {
        // LoginLoadingState -> CircularProgressIndicator
        // LoginSuccessState -> NavToHome
        // LoginErrorState -> showDialog

        if (state is RegisterSuccessState) {
          context.showAwesomeSnackBar(
              message:
                  "Congratulations! You have successfully sign up. Let's get started on your next task!");
          Future.delayed(const Duration(seconds: 5), () {
            Navigator.pushReplacementNamed(context, '/home');
          });
        } else if (state is RegisterErrorState) {
          //!showDialog
          context.showAwesomeSnackBar(
            message: "Error", //state.error,
            type: ContentType.failure,
          );
        }
      },
      builder: (BuildContext context, RegisterState state) {
        final registerCubit = BlocProvider.of<RegisterCubit>(context);

        return Padding(
          padding: EdgeInsets.all(AppSizes.defaultPadding),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* Title ----------------------------------------------------->
                (!registerCubit.isRegisterDone)
                    ? buildRegisterTitle(context).zoomIn(750)
                    : buildRegisterTitle(context).zoomOut(750),
                verticalSpace(AppSizes.spaceBtwItems),
                //* Name_field ------------------------------------------------>
                (!registerCubit.isRegisterDone)
                    ? buildRegisterNameField(context).fadeInRightBig(1000)
                    : buildRegisterNameField(context).fadeOutLeftBig(1000),
                verticalSpace(AppSizes.spaceBtwItems),
                //* Phone_field------------------------------------------------>
                (!registerCubit.isRegisterDone)
                    ? buildRegisterPhoneField(context).fadeInLeftBig(1250)
                    : buildRegisterPhoneField(context).fadeOutRightBig(1250),
                verticalSpace(AppSizes.spaceBtwItems),
                //* yearsOfExperience_field ----------------------------------->
                (!registerCubit.isRegisterDone)
                    ? buildRegisterYearExpField(context).fadeInRightBig(1500)
                    : buildRegisterYearExpField(context).fadeOutLeftBig(1500),
                verticalSpace(AppSizes.spaceBtwItems),
                //* Choose.Exp_field ------------------------------------------>
                (!registerCubit.isRegisterDone)
                    ? buildRegisterChooseExpField(context).fadeInLeftBig(1750)
                    : buildRegisterChooseExpField(context)
                        .fadeOutRightBig(1750),
                verticalSpace(AppSizes.spaceBtwItems),
                //* Address_field --------------------------------------------->
                (!registerCubit.isRegisterDone)
                    ? buildRegisterAddressField(context).fadeInRightBig(2000)
                    : buildRegisterAddressField(context).fadeOutLeftBig(2000),
                verticalSpace(AppSizes.spaceBtwItems),
                //* Password_field  ------------------------------------------->
                (!registerCubit.isRegisterDone)
                    ? buildRegisterPasswordField(context).fadeInLeftBig(2250)
                    : buildRegisterPasswordField(context).fadeOutRightBig(2250),
                verticalSpace(AppSizes.spaceBtwItems),

                //* Btn ------------------------------------------------------->
                (state is LoginLoadingState)
                    ? const SizedBox(
                        height: 24,
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      )
                    : (!registerCubit.isRegisterDone)
                        ? buildRegisterBtn(context).zoomIn(1500)
                        : buildRegisterBtn(context).zoomOut(1500),
                verticalSpace(AppSizes.spaceBtwItems),

                //* Footer_Text ----------------------------------------------->
                (!registerCubit.isRegisterDone)
                    ? buildRegisterFooterText(context).zoomIn(2750)
                    : buildRegisterFooterText(context).zoomOut(2750),

                //! BlocConsumer split as BlocListener
              ],
            ),
          ),
        );
      },
    );
  }
}
