// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/strings.dart';
import '../../../../../core/utils/helpers/cache_helper.dart';
import '../../../../../core/utils/routing/routes.dart';
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

  Future<void> _onLand() async {
    try {
      final bool showWelcome = await CacheHelper.getBool(AppStrings.showWelcome);
      final String? showLogin = await CacheHelper.getString(ApiKey.id);
      debugPrint("showWelcome: at Splash.view  $showWelcome");
      debugPrint("showLogin: at Splash.view $showLogin");

      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;

      if (!showWelcome) {
        if (showLogin != null) {
          Navigator.pushReplacementNamed(context, AppRoutes.homeView);
        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.loginView);
        }
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.welcomeView);
      }
    } catch (e) {
      debugPrint('Error during navigation: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: SplashBody(),
    );
  }
}
