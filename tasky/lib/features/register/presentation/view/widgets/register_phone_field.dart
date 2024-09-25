import '../../../../../core/shared/widgets/phone_text_field.dart';
import '../../../../../core/utils/helpers/validator_helper.dart';
import '../../view_model/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

PhoneTextField buildRegisterPhoneField(BuildContext context) {
  final registerCubit = BlocProvider.of<RegisterCubit>(context);

  return PhoneTextField(
    phoneController: registerCubit.registerPhoneController,
    validator: (value) => AppValidator.validatePhoneNumber(value),
  );
}
