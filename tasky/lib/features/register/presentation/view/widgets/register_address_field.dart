import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/helpers/validator_helper.dart';
import '../../view_model/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextFormField buildRegisterAddressField(BuildContext context) {
  final registerCubit = BlocProvider.of<RegisterCubit>(context);

  return TextFormField(
    validator: (value) => AppValidator.validateEmptyText("Address", value),
    controller: registerCubit.registerAddressController,
    decoration: const InputDecoration(
      hintText: AppStrings.address,
    ),
  );
}
