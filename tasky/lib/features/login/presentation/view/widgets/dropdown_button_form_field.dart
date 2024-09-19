import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/styles.dart';

class ExperienceLevelDropButton extends StatelessWidget {
  const ExperienceLevelDropButton({
    super.key,
    required this.experienceLevelController,
  });
  final TextEditingController experienceLevelController;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      isDense: true,
      validator: (value) {
        return null;
      },
      hint: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Choose experience Level',
          style: Styles.font14LightGrayRegular.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      icon: Icon(
        MdiIcons.chevronDown,
        color: AppColors.borderPrimary,
        size: 30,
      ),
      items: getDropdownItems(),
      onChanged: (value) {
        experienceLevelController.text =
            AppConstants.experienceLevelMapping[value]!;
      },
    );
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    return AppConstants.experienceLevelsDisplay.map((String level) {
      return DropdownMenuItem<String>(
        value: level,
        child: Text(level),
      );
    }).toList();
  }
}
