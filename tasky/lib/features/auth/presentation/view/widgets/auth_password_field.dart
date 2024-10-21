import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/custom_text_field.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/helpers/validator_helper.dart';

Widget buildAuthPasswordField(TextEditingController controller) {
  return CustomTextField(
    validator: (value) => AppValidator.validatePassword(value),
    hintText: AppStrings.password,
    controller: controller,
    isPasswordField: true,
  );
}
