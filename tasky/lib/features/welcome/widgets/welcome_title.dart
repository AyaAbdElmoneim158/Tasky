import 'package:flutter/material.dart';
import '../../../core/utils/constants/strings.dart';
import '../../../core/utils/constants/styles.dart';

Text buildWelcomeTitle(BuildContext context) {
  return Text(
    AppStrings.welcomeTitle,
    style: Styles.font24BlackBold(context),
    textAlign: TextAlign.center,
  );
}
