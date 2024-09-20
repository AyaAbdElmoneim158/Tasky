// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../core/api/end_points.dart';
import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/strings.dart';
import '../../core/utils/helpers/cache_helper.dart';
import '../../core/utils/routing/routes.dart';
import 'widgets/splash_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _onLand();
  }

  _onLand() {
    final showWelcome = CacheHelper.getData(key: AppStrings.showWelcome);
    final showLogin = CacheHelper.getData(key: ApiKey.token);
    debugPrint("showWelcome: $showWelcome");
    debugPrint("showLogin: $showLogin");

    if (!showWelcome) {
      if (showLogin != null) {
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.pushReplacementNamed(context, AppRoutes.homeView);
        });
      } else {
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.pushReplacementNamed(context, AppRoutes.loginView);
        });
      }
    } else {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushReplacementNamed(context, AppRoutes.welcomeView);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: buildSplashBody(),
    );
  }
}
