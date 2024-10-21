import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/strings.dart';
import '../../utils/constants/styles.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: AppStrings.task,
            style: Styles.font24BlackBold(context).copyWith(color: AppColors.primary),
          ),
          TextSpan(
            text: AppStrings.y,
            style: Styles.font24BlackBold(context).copyWith(color: AppColors.secondary),
          ),
        ],
      ),
    );
  }
}
