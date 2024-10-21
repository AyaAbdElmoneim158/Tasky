import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../features/auth/presentation/view/login_view.dart';
import '../../../features/auth/presentation/view/register_view.dart';
import '../../../features/auth/presentation/view/splash_view.dart';
import '../../../features/auth/presentation/view/welcome_view.dart';
import '../../../features/auth/presentation/view_model/auth_cubit.dart';
import '../../../injection_container.dart';
import 'routes.dart';
import 'screen_routing.dart';

class AppRouter {
  static Route? onGenerate(RouteSettings settings) {
    // final args = settings.arguments as String;

    switch (settings.name) {
      case AppRoutes.initRoute:
        return pageTransition(settings, const SplashView());
      case AppRoutes.welcomeView:
        return pageTransition(settings, const WelcomeView());
      case AppRoutes.loginView:
        return pageTransition(
          settings,
          BlocProvider(
            create: (context) => sl<AuthCubit>(),
            child: const LoginView(),
          ),
        );
      case AppRoutes.registerView:
        return pageTransition(
          settings,
          BlocProvider(
            create: (context) => sl<AuthCubit>(),
            child: const RegisterView(),
          ),
        );

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
