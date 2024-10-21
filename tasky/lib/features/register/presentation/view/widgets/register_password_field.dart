import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/helpers/validator_helper.dart';
import '../../view_model/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextFormField buildRegisterPasswordField(BuildContext context) {
  final registerCubit = BlocProvider.of<RegisterCubit>(context);

  return TextFormField(
    validator: (value) => AppValidator.validatePassword(value),
    controller: registerCubit.registerPasswordController,
    decoration: InputDecoration(
      hintText: AppStrings.password,
      suffixIcon: IconButton(
        onPressed: () => registerCubit.changePasswordVisibility(),
        icon: registerCubit.icon,
      ),
    ),
    obscureText: registerCubit.hidePassword,
  );
}