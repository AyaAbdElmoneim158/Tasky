import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../view_model/login_cubit.dart';

SizedBox buildLoginBtn(BuildContext context, LoginCubit loginCubit) {
  return SizedBox(
    width: AppHelperFunctions.screenWidth(context),
    child: ElevatedButton(
      onPressed: () {
        if (loginCubit.signInFormKey.currentState!.validate()) {
          // loginCubit.login();
        } else {
          //Show showDialog
        }
      },
      child: const Text(AppStrings.signIn),
    ),
  );
}
