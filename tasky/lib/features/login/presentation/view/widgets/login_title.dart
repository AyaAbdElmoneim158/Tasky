import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/constants/styles.dart';

Text buildLoginTitle(BuildContext context) {
  return Text(
    AppStrings.login,
    style: Styles.font24BlackBold(context),
    textAlign: TextAlign.start,
  );
}
