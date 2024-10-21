import 'package:flutter/material.dart';
import '../../../../../core/shared/widgets/phone_text_field.dart';
import '../../../../../core/utils/helpers/validator_helper.dart';

PhoneTextField buildAuthPhoneTextField(
  TextEditingController? controller,
  String? fullPhoneNumberValue,
) {
  return PhoneTextField(
    phoneController: controller!,
    validator: (value) => AppValidator.validatePhoneNumber(value),
    onChanged: (value) => fullPhoneNumberValue = value,
  );
}
