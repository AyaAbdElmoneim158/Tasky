// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/constants/spacing.dart';
import '../../../core/utils/constants/strings.dart';
import '../../../core/utils/helpers/cache_helper.dart';
import '../../../core/utils/routing/routes.dart';
import 'welcome_btn.dart';
import 'welcome_sub_title.dart';
import 'welcome_title.dart';

class WelcomeFooter extends StatefulWidget {
  const WelcomeFooter({
    super.key,
  });

  @override
  State<WelcomeFooter> createState() => _WelcomeFooterState();
}

class _WelcomeFooterState extends State<WelcomeFooter> {
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* Title ---------------------------------------------------------------
        !isLoad
            ? buildWelcomeTitle(context).zoomIn(750)
            : buildWelcomeTitle(context).zoomOut(750),

        verticalSpace(AppSizes.spaceBtwItems),
        //* SubTitle ------------------------------------------------------------
        !isLoad
            ? buildWelcomeSubTitle(context).zoomIn(1000)
            : buildWelcomeSubTitle(context).zoomOut(1000),

        verticalSpace(AppSizes.spaceBtwItems),
        // Btn -----------------------------------------------------------------
        !isLoad
            ? buildWelcomeBtn(context, _onPress).zoomIn(1250)
            : buildWelcomeBtn(context, _onPress).zoomOut(1250),
      ],
    );
  }

  void _onPress() async {
    final showWelcome = await CacheHelper.saveData(
      key: AppStrings.showWelcome,
      value: true,
    );
    debugPrint("showWelcome after OnPress: $showWelcome");

    setState(() => isLoad = true);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.loginView);
    });
  }
}
