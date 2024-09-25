import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/constants/styles.dart';

Text buildRegisterTitle(BuildContext context) {
  return Text(
    AppStrings.register,
    style: Styles.font24BlackBold(context),
    textAlign: TextAlign.start,
  );
}
