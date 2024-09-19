import 'package:flutter/material.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';

import '../../../../../core/shared/widgets/auth_footer_rich_text.dart';
import '../../../../../core/shared/widgets/phone_text_field.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/constants/styles.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../../../../core/utils/routing/routes.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
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
              AppStrings.login,
              style: Styles.font24BlackBold(context),
              textAlign: TextAlign.start,
            ).zoomIn(milliseconds: 750),
            verticalSpace(AppSizes.spaceBtwItems),
            // Phone_field  --------------------------------------------------------------
            PhoneTextField(phoneController: TextEditingController())
                .zoomIn(milliseconds: 1000),
            verticalSpace(AppSizes.spaceBtwItems),
            // Password_field  ---------------------------------------------------
            TextFormField(
              decoration: const InputDecoration(
                labelText: AppStrings.password,
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
              obscureText: true,
            ).zoomIn(milliseconds: 1250),
            verticalSpace(AppSizes.spaceBtwItems),

            // Btn -----------------------------------------------------------------
            SizedBox(
              width: AppHelperFunctions.screenWidth(context),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(AppStrings.signIn),
              ),
            ).zoomIn(milliseconds: 1500),
            verticalSpace(AppSizes.spaceBtwItems),

            // footer Text -----------------------------------------------------------------
            AuthFooterRichText(
              span1: AppStrings.didNotHaveAccount,
              span2: AppStrings.signUpHere,
              onPressed: () => Navigator.pushReplacementNamed(
                  context, AppRoutes.registerView),
            ).zoomIn(milliseconds: 1750),
          ],
        ),
      ),
    );
  }
}
