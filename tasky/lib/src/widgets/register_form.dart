import 'package:flutter/material.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';

import '../../core/shared/widgets/auth_footer_rich_text.dart';
import '../../core/shared/widgets/phone_text_field.dart';
import '../../core/utils/constants/sizes.dart';
import '../../core/utils/constants/spacing.dart';
import '../../core/utils/constants/strings.dart';
import '../../core/utils/constants/styles.dart';
import '../../core/utils/helpers/helper_functions.dart';
import '../../core/utils/routing/routes.dart';
import 'dropdown_button_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });
  // ! FormKey + controllers + validation prompt
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.defaultPadding),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title --------------------------------------------------------------
            Text(
              AppStrings.register,
              style: Styles.font24BlackBold(context),
              textAlign: TextAlign.start,
            ).zoomIn(milliseconds: 750),
            verticalSpace(AppSizes.spaceBtwItems),
            // Name ---------------------------------------------------
            TextFormField(
              decoration: const InputDecoration(
                labelText: AppStrings.name,
              ),
            ).zoomIn(milliseconds: 1000),
            verticalSpace(AppSizes.spaceBtwItems),
            // Phone_field  --------------------------------------------------------------
            PhoneTextField(phoneController: TextEditingController())
                .zoomIn(milliseconds: 1250),
            verticalSpace(AppSizes.spaceBtwItems),
            // yearsOfExperience ---------------------------------------------------
            TextFormField(
              decoration: const InputDecoration(
                labelText: AppStrings.yearsOfExperience,
              ),
            ).zoomIn(milliseconds: 1500),
            verticalSpace(AppSizes.spaceBtwItems),
            // choose Exp ---------------------------------------------------
            ExperienceLevelDropButton(
              experienceLevelController: TextEditingController(),
            ).zoomIn(milliseconds: 1750),
            verticalSpace(AppSizes.spaceBtwItems),
            // address ---------------------------------------------------
            TextFormField(
              decoration: const InputDecoration(
                labelText: AppStrings.address,
              ),
            ).zoomIn(milliseconds: 2000),
            verticalSpace(AppSizes.spaceBtwItems),
            // Password_field  ---------------------------------------------------
            TextFormField(
              decoration: const InputDecoration(
                labelText: AppStrings.password,
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
              obscureText: true,
            ).zoomIn(milliseconds: 2250),
            verticalSpace(AppSizes.spaceBtwItems),

            // Btn -----------------------------------------------------------------
            SizedBox(
              width: AppHelperFunctions.screenWidth(context),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(AppStrings.signUp),
              ),
            ).zoomIn(milliseconds: 2500),
            verticalSpace(AppSizes.spaceBtwItems),

            // footer Text -----------------------------------------------------------------
            AuthFooterRichText(
              span1: AppStrings.alreadyHaveAccount,
              span2: AppStrings.signUp,
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, AppRoutes.loginView),
            ).zoomIn(milliseconds: 2750),
          ],
        ),
      ),
    );
  }
}
