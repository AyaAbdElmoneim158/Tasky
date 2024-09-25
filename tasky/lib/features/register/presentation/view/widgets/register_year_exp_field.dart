import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/helpers/validator_helper.dart';
import '../../view_model/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextFormField buildRegisterYearExpField(BuildContext context) {
  final registerCubit = BlocProvider.of<RegisterCubit>(context);

  return TextFormField(
    validator: (value) =>
        AppValidator.validateEmptyText("Year Experience", value),
    controller: registerCubit.registerYearExpeController,
    decoration: const InputDecoration(
      hintText: AppStrings.yearsOfExperience,
    ),
  );
}
