import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import '../../../../../core/shared/widgets/art_image.dart';
import '../../../../../core/shared/widgets/custom_text_field.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../core/utils/helpers/validator_helper.dart';
import '../../../../../core/utils/routing/routes.dart';
import '../../view_model/auth_cubit.dart';
import 'auth_choose_exp_field.dart';
import 'auth_footer_text.dart';
import 'auth_form_title.dart';
import 'auth_password_field.dart';
import 'auth_phone_field.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> signUpFormKey = GlobalKey();
    TextEditingController registerNameController = TextEditingController();
    TextEditingController registerPhoneController = TextEditingController();
    TextEditingController registerYearExpeController = TextEditingController();
    TextEditingController registerExpeLevelController = TextEditingController();
    TextEditingController registerAddressController = TextEditingController();
    TextEditingController registerPasswordController = TextEditingController();
    String? fullPhoneNumberValue;

    void onPress() {
      if (signUpFormKey.currentState!.validate()) {
        // BlocProvider.of<AuthCubit>(context).register();
        context.read<AuthCubit>().register(
              password: registerPasswordController.text.trim(),
              phone: registerPhoneController.text.trim(),
              address: registerAddressController.text.trim(),
              displayName: registerNameController.text.trim(),
              experienceYears: registerYearExpeController.text.trim(),
              level: registerExpeLevelController.text.trim(),
            );
      } else {
        context.showSimpleDialog(
          // buttonText: "OK",
          // onButtonPressed: () {
          //   Navigator.pop(context);
          // },
          title: "Validation Error",
          description:
              "Please ensure all fields are filled out correctly before proceeding. \n\nDouble-check your inputs to continue.",
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
                  key: signUpFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //* ArtImage ----------------------------------------------------- // height: AppHelperFunctions.screenHeight(context) * 0.3,
                      (state is! AuthSuccessState)
                          ? ArtImage(height: 482.h).zoomIn(null)
                          : ArtImage(height: 482.h).zoomOut(null),
                      verticalSpace(AppSizes.spaceBtwItems),
                      //* Title ----------------------------------------------------->
                      (state is! AuthSuccessState)
                          ? buildFormTitle(context).zoomIn(750)
                          : buildFormTitle(context).zoomOut(750),
                      verticalSpace(AppSizes.spaceBtwItems),
                      //* Name_field ------------------------------------------------>
                      (state is! AuthSuccessState)
                          ? _buildRegisterNameField(registerNameController).fadeInRightBig(1000)
                          : _buildRegisterNameField(registerNameController).fadeOutLeftBig(1000),
                      verticalSpace(AppSizes.defaultBtwFields),
                      //* Phone_field------------------------------------------------>
                      (state is! AuthSuccessState)
                          ? buildAuthPhoneTextField(registerPhoneController, fullPhoneNumberValue).fadeInLeftBig(1250)
                          : buildAuthPhoneTextField(registerPhoneController, fullPhoneNumberValue)
                              .fadeOutRightBig(1250),
                      verticalSpace(AppSizes.defaultBtwFields),
                      //* yearsOfExperience_field ----------------------------------->
                      (state is! AuthSuccessState)
                          ? _buildRegisterYearExpField(registerYearExpeController).fadeInRightBig(1500)
                          : _buildRegisterYearExpField(registerYearExpeController).fadeOutLeftBig(1500),
                      verticalSpace(AppSizes.defaultBtwFields),
                      //* Choose.Exp_field ------------------------------------------>
                      (state is! AuthSuccessState)
                          ? buildAuthChooseExpField(registerExpeLevelController).fadeInLeftBig(1750)
                          : buildAuthChooseExpField(registerExpeLevelController).fadeOutRightBig(1750),
                      verticalSpace(AppSizes.defaultBtwFields),
                      //* Address_field --------------------------------------------->
                      (state is! AuthSuccessState)
                          ? _buildRegisterAddressField(registerAddressController).fadeInRightBig(2000)
                          : _buildRegisterAddressField(registerAddressController).fadeOutLeftBig(2000),
                      verticalSpace(AppSizes.defaultBtwFields),
                      //* Password_field  ------------------------------------------->
                      (state is! AuthSuccessState)
                          ? buildAuthPasswordField(registerPasswordController).fadeInLeftBig(2250)
                          : buildAuthPasswordField(registerPasswordController).fadeOutRightBig(2250),
                      verticalSpace(AppSizes.spaceBtwItems),

                      //* Btn ------------------------------------------------------->
                      (state is AuthErrorState)
                          ? _buildRegisterBtn(onPress, context)
                          : (state is AuthSuccessState)
                              ? _buildRegisterBtn(onPress, context).zoomOut(2500)
                              : _buildRegisterBtn(onPress, context).zoomIn(2500),

                      verticalSpace(AppSizes.defaultSpace),
                      //* Footer_Text ----------------------------------------------->
                      (state is! AuthSuccessState)
                          ? _buildRegisterFooterText(context).zoomIn(2750)
                          : _buildRegisterFooterText(context).zoomOut(2750),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _listener(context, state) {
    if (state is AuthSuccessState) {
      context.showAwesomeDialog(
        title: AppStrings.success,
        description: AppStrings.successfullySignedUp,
        dialogType: DialogType.success,
        confirmText: AppStrings.ok,
        onConfirm: () {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pushReplacementNamed(context, AppRoutes.homeView);
          });
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

  Widget _buildRegisterNameField(TextEditingController controller) {
    return CustomTextField(
      validator: (value) => AppValidator.validateEmptyText("Name", value),
      hintText: AppStrings.name,
      controller: controller,
    );
  }

  Widget _buildRegisterYearExpField(TextEditingController controller) {
    return CustomTextField(
      validator: (value) => AppValidator.validateEmptyText("Year Experience", value),
      hintText: AppStrings.yearsOfExperience,
      controller: controller,
    );
  }

  Widget _buildRegisterAddressField(TextEditingController controller) {
    return CustomTextField(
      validator: (value) => AppValidator.validateEmptyText("Address", value),
      hintText: AppStrings.address,
      controller: controller,
    );
  }

  Widget _buildRegisterBtn(void Function()? onPressed, BuildContext context) {
    return SizedBox(
      width: AppHelperFunctions.screenWidth(context),
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text(AppStrings.signUp),
      ),
    );
  }

  Widget _buildRegisterFooterText(BuildContext context) {
    return AuthFooterRichText(
      span1: AppStrings.alreadyHaveAccount,
      span2: AppStrings.signUp,
      onPressed: () => Navigator.pop(context),
    );
  }
}
