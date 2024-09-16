import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import '../../core/utils/constants/images.dart';
import '../../core/utils/constants/sizes.dart';
import '../../core/utils/constants/spacing.dart';
import '../../core/utils/constants/strings.dart';
import '../../core/utils/constants/styles.dart';
import '../../core/utils/helpers/cache_helper.dart';
import '../../core/utils/helpers/helper_functions.dart';
import '../../core/utils/routing/routes.dart';

class WelcomeFooter extends StatelessWidget {
  const WelcomeFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title ---------------------------------------------------------------
        Text(
          AppStrings.welcomeTitle,
          style: Styles.font24BlackBold(context),
          textAlign: TextAlign.center,
        ).zoomIn(milliseconds: 750),
        verticalSpace(AppSizes.spaceBtwItems),
        // SubTitle ------------------------------------------------------------
        Text(
          AppStrings.welcomeSubTitle,
          style: Styles.font14BlackRegular(context),
          textAlign: TextAlign.center,
        ).zoomIn(milliseconds: 1000),
        verticalSpace(AppSizes.spaceBtwItems),
        // Btn -----------------------------------------------------------------
        Padding(
          padding: EdgeInsets.all(AppSizes.defaultPadding),
          child: SizedBox(
            width: AppHelperFunctions.screenWidth(context),
            child: ElevatedButton(
              onPressed: () => _startOnPressed(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Let’s Start"),
                  horizontalSpace(AppSizes.sm),
                  SvgPicture.asset(
                    AppAssets.arrowLeftLight,
                    width: 18.w,
                    height: 12.h,
                  ),
                ],
              ),
            ),
          ),
        ).zoomIn(milliseconds: 1250),
      ],
    );
  }
}

Future<void> _startOnPressed(context) async {
  final showWelcome =
      await CacheHelper.saveData(key: AppStrings.showWelcome, value: true);
  debugPrint("showWelcome: $showWelcome");
  Navigator.pushReplacementNamed(context, AppRoutes.loginView);
}
