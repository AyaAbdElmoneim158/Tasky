import '../../../../../core/utils/helpers/validator_helper.dart';
import '../../../../login/presentation/view/widgets/dropdown_button_form_field.dart';
import '../../view_model/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

ExperienceLevelDropButton buildRegisterChooseExpField(BuildContext context) {
  final registerCubit = BlocProvider.of<RegisterCubit>(context);

  return ExperienceLevelDropButton(
    validator: (value) =>
        AppValidator.validateEmptyText("Choose Experience", value),
    experienceLevelController: registerCubit.registerNameController,
  );
}
