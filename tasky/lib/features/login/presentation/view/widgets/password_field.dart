import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/helpers/validator_helper.dart';
import '../../view_model/login_cubit.dart';

TextFormField buildPasswordField(LoginCubit loginCubit) {
  return TextFormField(
    controller: loginCubit.loginPasswordController,
    validator: (value) => AppValidator.validatePassword(value),
    decoration: InputDecoration(
      labelText: AppStrings.password,
      suffixIcon: IconButton(
        onPressed: () => loginCubit.changePasswordVisibility(),
        icon: loginCubit.icon,
      ),
    ),
    obscureText: loginCubit.hidePassword,
  );
}
