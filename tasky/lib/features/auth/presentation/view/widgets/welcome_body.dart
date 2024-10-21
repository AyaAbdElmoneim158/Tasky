// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import 'package:tasky/core/utils/helpers/helper_functions.dart';
import '../../../../../core/shared/widgets/art_image.dart';
import '../../../../../core/shared/widgets/custom_btn.dart';
import '../../../../../core/utils/constants/images.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/spacing.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/constants/styles.dart';
import '../../../../../core/utils/helpers/cache_helper.dart';
import '../../../../../core/utils/routing/routes.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({
    super.key,
  });

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  bool isLoad = false;

  @override
  Widget build(BuildContext context) {
    double artImageHeight = AppHelperFunctions.screenHeight(context) * 0.6;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// ArtImage -----------------------------------------------------------
        !isLoad ? ArtImage(height: artImageHeight).zoomIn(null) : ArtImage(height: artImageHeight).zoomOut(null),
        verticalSpace(AppSizes.spaceBtwItems),

        /// Title ---------------------------------------------------------------
        !isLoad ? _buildWelcomeTitle().zoomIn(750) : _buildWelcomeTitle().zoomOut(750),
        verticalSpace(AppSizes.spaceBtwItems),

        /// SubTitle ------------------------------------------------------------
        !isLoad ? _buildWelcomeSubTitle().zoomIn(1000) : _buildWelcomeSubTitle().zoomOut(1000),
        verticalSpace(AppSizes.spaceBtwSections),
        // Btn -----------------------------------------------------------------
        !isLoad
            ? CustomButton(onPressed: _onPress, child: _buildBtnChild()).zoomIn(1250)
            : CustomButton(onPressed: _onPress, child: _buildBtnChild()).zoomOut(1250),
      ],
    );
  }

  void _onPress() async {
    try {
      final showWelcome = await CacheHelper.saveData(AppStrings.showWelcome, true);
      debugPrint("showWelcome after OnPress at welcome view: $showWelcome");
      setState(() => isLoad = true);

      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.loginView);
    } catch (e) {
      debugPrint('Error during onPress: $e');
    }
  }

  Widget _buildWelcomeTitle() {
    return Text(
      AppStrings.welcomeTitle,
      style: Styles.font24BlackBold(context),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildWelcomeSubTitle() {
    return Text(
      AppStrings.welcomeSubTitle,
      style: Styles.font14BlackRegular(context),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildBtnChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(AppStrings.letsStart),
        horizontalSpace(AppSizes.sm),
        SvgPicture.asset(
          AppAssets.arrowLeftLight,
          width: 18.w,
          height: 12.h,
        ),
      ],
    );
  }
}
