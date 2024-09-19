import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/constants/styles.dart';

Text buildTitle(BuildContext context) {
  return Text(
    AppStrings.login,
    style: Styles.font24BlackBold(context),
    textAlign: TextAlign.start,
  );
}
