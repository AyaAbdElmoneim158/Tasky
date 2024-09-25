import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/helpers/validator_helper.dart';
import '../../view_model/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextFormField buildLoginPasswordField(BuildContext context) {
  final loginCubit = BlocProvider.of<LoginCubit>(context);

  return TextFormField(
    controller: loginCubit.loginPasswordController,
    validator: (value) => AppValidator.validatePassword(value),
    decoration: InputDecoration(
      hintText: AppStrings.password,
      suffixIcon: IconButton(
        onPressed: () => loginCubit.changePasswordVisibility(),
        icon: loginCubit.icon,
      ),
    ),
    obscureText: loginCubit.hidePassword,
  );
}
