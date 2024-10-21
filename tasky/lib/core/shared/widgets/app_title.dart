import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/styles.dart';

RichText buildAppTitle(context) {
  return RichText(
    text: TextSpan(children: [
      TextSpan(
        text: 'Task',
        style:
            Styles.font24BlackBold(context).copyWith(color: AppColors.primary),
      ),
      TextSpan(
        text: 'y',
        style: Styles.font24BlackBold(context)
            .copyWith(color: AppColors.secondary),
      ),
    ]),
  );
}
