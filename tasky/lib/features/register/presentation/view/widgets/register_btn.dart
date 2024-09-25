import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
import '../../view_model/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

SizedBox buildRegisterBtn(
  BuildContext context,
) {
  final registerCubit = BlocProvider.of<RegisterCubit>(context);

  return SizedBox(
    width: AppHelperFunctions.screenWidth(context),
    child: ElevatedButton(
      onPressed: () {
        if (registerCubit.signUpFormKey.currentState!.validate()) {
          // registerCubit.register();
        } else {
          //Show showDialog
        }
      },
      child: const Text(AppStrings.signUp),
    ),
  );
}
