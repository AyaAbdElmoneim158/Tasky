import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';

import '../../core/shared/widgets/fade_in_image.dart';
import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/images.dart';
import '../../core/utils/constants/strings.dart';
import '../../core/utils/helpers/cache_helper.dart';
import '../../core/utils/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _onLand();
  }

  _onLand() {
    final showWelcome = CacheHelper.getData(key: AppStrings.showWelcome);
    debugPrint("showWelcome: $showWelcome");

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
        // ignore: use_build_context_synchronously
        context,
        showWelcome != null ? AppRoutes.loginView : AppRoutes.welcomeView,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: AppFadeInImage(
          image: AppAssets.splash,
          width: 127.w,
          height: 45.h,
        ).zoomIn(),
      ),
    );
  }
}
