import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../../features/register/register_screen.dart';
import '../../../features/splash/splash_screen.dart';

import '../../../features/welcome/welcome_screen.dart';
import 'routes.dart';
import 'screen_routing.dart';

class AppRouter {
  static Route? onGenerate(RouteSettings settings) {
    // final args = settings.arguments as String;
    switch (settings.name) {
      case AppRoutes.initRoute:
        return pageTransition(settings, const SplashScreen());
      case AppRoutes.welcomeView:
        return pageTransition(settings, const WelcomeScreen());
      case AppRoutes.loginView:
        return pageTransition(settings, const LoginView());
      case AppRoutes.registerView:
        return pageTransition(settings, const RegisterScreen());
      case AppRoutes.noFoundRoute:
      default:
        return pageTransition(settings, const NotFoundPage());
    }
  }

  static PageTransition<dynamic> pageTransition(
    RouteSettings settings,
    Widget screen, {
    PageTransitionType type = PageTransitionType.fade,
  }) {
    return PageTransition(
      type: type,
      child: screen,
      settings: settings,
    );
  }
}
