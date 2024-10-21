// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';

import '../../../../../core/shared/widgets/art_image.dart';
import '../../../../../core/shared/widgets/custom_btn.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../core/utils/routing/routes.dart';
import '../../view_model/auth_cubit.dart';
import 'auth_footer_text.dart';
import 'auth_form_title.dart';
import 'auth_password_field.dart';
import 'auth_phone_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> loginFormKey = GlobalKey();
    TextEditingController loginPhoneController = TextEditingController();
    TextEditingController loginPasswordController = TextEditingController();
    String? fullPhoneNumberValue;

    void onPress() {
      if (loginFormKey.currentState?.validate() ?? false) {
        final String password = loginPasswordController.text.trim();
        final String phone = loginPhoneController.text.trim();
        context.read<AuthCubit>().login(
              password: password,
              phone: phone,
            );
      } else {
        context.showAwesomeDialog(
          title: AppStrings.validationError,
          description: AppStrings.filledFields,
          dialogType: DialogType.error,
        );
      }
    }

    return BlocConsumer<AuthCubit, AuthState>(
        listener: _listener,
        builder: (BuildContext context, AuthState state) {
          return Padding(
            padding: EdgeInsets.all(AppSizes.defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //* ArtImage --------------------------------------------------------------------------------------------------------->
                (state is! AuthSuccessState)
                    ? ArtImage(height: AppHelperFunctions.screenHeight(context) * 0.6).zoomIn(null)
                    : ArtImage(height: AppHelperFunctions.screenHeight(context) * 0.6).zoomOut(null),
                verticalSpace(AppSizes.spaceBtwItems),
                Form(
                  key: loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //* Title ---------------------------------------------------------------------------------------------------------->
                      (state is! AuthSuccessState)
                          ? buildFormTitle(context).zoomIn(750)
                          : buildFormTitle(context).zoomOut(750),
                      verticalSpace(AppSizes.defaultSpace),
                      //* Phone_field  ------------------------------------------------------------------------------------------------------->
                      (state is! AuthSuccessState)
                          ? buildAuthPhoneTextField(loginPhoneController, fullPhoneNumberValue).fadeInLeftBig(1000)
                          : buildAuthPhoneTextField(loginPhoneController, fullPhoneNumberValue).fadeOutRightBig(1000),
                      verticalSpace(AppSizes.defaultBtwFields),
                      //* Password_field  ---------------------------------------------------------------------------------------------->
                      (state is! AuthSuccessState)
                          ? buildAuthPasswordField(loginPasswordController).fadeInRightBig(1250)
                          : buildAuthPasswordField(loginPasswordController).fadeOutLeftBig(1250),
                      verticalSpace(AppSizes.defaultSpace),
                      //* Btn ----------------------------------------------------------------------------------------------------------->
                      (state is! AuthSuccessState)
                          ? _buildLoginBtn(onPress).zoomIn(1500)
                          : _buildLoginBtn(onPress).zoomOut(1500),
                      verticalSpace(AppSizes.defaultSpace),
                      //* footer Text --------------------------------------------------------------------------------------------------->
                      (state is! AuthSuccessState)
                          ? _buildLoginFooterText(context).zoomIn(1750)
                          : _buildLoginFooterText(context).zoomOut(1750),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  void _listener(BuildContext context, AuthState state) {
    if (state is AuthSuccessState) {
      context.showAwesomeDialog(
        title: AppStrings.success,
        description: AppStrings.successfullyLoggedIn,
        dialogType: DialogType.success,
        confirmText: AppStrings.ok,
        onConfirm: () {
          Navigator.pushReplacementNamed(context, AppRoutes.homeView);
        },
      );
    } else if (state is AuthErrorState) {
      context.showAwesomeDialog(
        title: AppStrings.error,
        description: state.error,
        dialogType: DialogType.error,
      );
    }
  }

  Widget _buildLoginBtn(void Function()? onPressed) {
    return CustomButton(
      onPressed: onPressed,
      child: const Text(AppStrings.signIn),
    );
  }

  AuthFooterRichText _buildLoginFooterText(BuildContext context) {
    return AuthFooterRichText(
      span1: AppStrings.didNotHaveAccount,
      span2: AppStrings.signUpHere,
      onPressed: () => Navigator.pushNamed(context, AppRoutes.registerView),
    );
  }
}
