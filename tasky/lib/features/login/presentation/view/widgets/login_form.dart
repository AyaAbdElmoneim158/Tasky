import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../view_model/login_cubit.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'footer_text.dart';
import 'login_btn.dart';
import 'login_password_field.dart';
import 'login_phone_text_field.dart';
import 'login_title.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoadingState ||
          current is LoginSuccessState ||
          current is LoginErrorState,
      listener: (BuildContext context, LoginState state) {
        // LoginLoadingState -> CircularProgressIndicator
        // LoginSuccessState -> NavToHome
        // LoginErrorState -> showDialog

        if (state is LoginSuccessState) {
          context.showAwesomeSnackBar(
              message:
                  "Congratulations! You have successfully logged in. Let's get started on your next task!");
          Future.delayed(const Duration(seconds: 5), () {
            // ignore: use_build_context_synchronously
            Navigator.pushReplacementNamed(context, '/home');
          });
        } else if (state is LoginErrorState) {
          //!showDialog
          context.showAwesomeSnackBar(
            message: state.error,
            type: ContentType.failure,
          );
        }
      },
      builder: (BuildContext context, LoginState state) {
        final loginCubit = BlocProvider.of<LoginCubit>(context);

        return Padding(
          padding: EdgeInsets.all(AppSizes.defaultPadding),
          child: Form(
            key: loginCubit.signInFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* Title ----------------------------------------------------->
                (state is LoginSuccessState)
                    ? buildLoginTitle(context).zoomOut(750)
                    : buildLoginTitle(context).zoomIn(750),
                verticalSpace(AppSizes.spaceBtwItems),
                //* Phone_field  ---------------------------------------------->
                (state is LoginSuccessState)
                    ? buildLoginPhoneTextField(loginCubit).zoomIn(1000)
                    : buildLoginPhoneTextField(loginCubit).zoomIn(1000),
                verticalSpace(AppSizes.spaceBtwItems),
                //* Password_field  ------------------------------------------->
                (state is LoginSuccessState)
                    ? buildLoginPasswordField(loginCubit).zoomIn(1250)
                    : buildLoginPasswordField(loginCubit).zoomOut(1250),

                verticalSpace(AppSizes.spaceBtwItems),
                //* Btn ------------------------------------------------------->
                //!Loading Btn
                (state is LoginLoadingState)
                    ? const SizedBox(
                        height: 24,
                        child: CircularProgressIndicator(),
                      )
                    : (state is LoginSuccessState)
                        ? buildLoginBtn(context, loginCubit).zoomIn(1500)
                        : buildLoginBtn(context, loginCubit).zoomOut(1500),

                verticalSpace(AppSizes.spaceBtwItems),

                //* footer Text ----------------------------------------------->
                (state is LoginSuccessState)
                    ? buildLoginFooterText(context).zoomIn(1750)
                    : buildLoginFooterText(context).zoomOut(1750),
              ],
            ),
          ),
        );
      },
    );
  }
}
