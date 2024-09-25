import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/auth_footer_rich_text.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/routing/routes.dart';

AuthFooterRichText buildRegisterFooterText(BuildContext context) {
  return AuthFooterRichText(
    span1: AppStrings.alreadyHaveAccount,
    span2: AppStrings.signUp,
    onPressed: () =>
        Navigator.pushReplacementNamed(context, AppRoutes.loginView),
  );
}
