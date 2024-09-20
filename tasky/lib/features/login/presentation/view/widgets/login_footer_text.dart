import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/auth_footer_rich_text.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/routing/routes.dart';

AuthFooterRichText buildLoginFooterText(BuildContext context) {
  return AuthFooterRichText(
    span1: AppStrings.didNotHaveAccount,
    span2: AppStrings.signUpHere,
    onPressed: () =>
        Navigator.pushReplacementNamed(context, AppRoutes.registerView),
  );
}
