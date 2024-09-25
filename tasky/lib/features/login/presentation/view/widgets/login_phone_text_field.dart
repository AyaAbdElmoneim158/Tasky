import 'package:flutter/material.dart';
import '../../../../../core/shared/widgets/phone_text_field.dart';
import '../../../../../core/utils/helpers/validator_helper.dart';
import '../../view_model/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

PhoneTextField buildLoginPhoneTextField(BuildContext context) {
  final loginCubit = BlocProvider.of<LoginCubit>(context);

  return PhoneTextField(
    phoneController: loginCubit.loginPhoneController,
    validator: (value) => AppValidator.validatePhoneNumber(value),
    onChanged: (value) => loginCubit.fullPhoneNumberValue = value,
  );
}
