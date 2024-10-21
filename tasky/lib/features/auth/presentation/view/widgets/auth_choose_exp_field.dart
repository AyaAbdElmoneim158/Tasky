import '../../../../../core/utils/helpers/validator_helper.dart';
import 'package:flutter/material.dart';
import 'dropdown_button_form_field.dart';

ExperienceLevelDropButton buildAuthChooseExpField(TextEditingController controller) {
  return ExperienceLevelDropButton(
    validator: (value) => AppValidator.validateEmptyText("Choose Experience", value),
    experienceLevelController: controller,
  );
}
