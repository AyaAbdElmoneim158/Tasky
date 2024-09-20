import 'package:flutter/material.dart';
import '../../../core/utils/constants/strings.dart';
import '../../../core/utils/constants/styles.dart';

Text buildWelcomeSubTitle(BuildContext context) {
  return Text(
    AppStrings.welcomeSubTitle,
    style: Styles.font14BlackRegular(context),
    textAlign: TextAlign.center,
  );
}
