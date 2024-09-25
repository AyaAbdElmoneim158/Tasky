import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../features/add_edit_task/presentation/view/add_edit_task_view.dart';
import '../../../features/add_edit_task/presentation/view_model/add_edit_task_cubit.dart';
import '../../../features/home/presentation/view_model/home_cubit.dart';
import '../../../features/login/presentation/view/login_view.dart';
import '../../../features/login/presentation/view_model/login_cubit.dart';
import '../../../features/profile/presentation/view_model/profile_cubit.dart';
import '../../../features/register/presentation/view/register_view.dart';
import '../../../features/register/presentation/view_model/register_cubit.dart';
import '../../../features/splash/splash_view.dart';

import '../../../features/welcome/welcome_view.dart';
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
          type: PageTransitionType.leftToRightPop,
          BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: const LoginView(),
          ),
        );
      case AppRoutes.registerView:
        return pageTransition(
          settings,
          type: PageTransitionType.rightToLeftPop,
          BlocProvider(
            create: (context) => sl<RegisterCubit>(),
            child: const RegisterView(),
          ),
        );
      case AppRoutes.homeView:
        return pageTransition(
          settings,
          type: PageTransitionType.rightToLeftPop,
          BlocProvider(
            create: (context) => sl<HomeCubit>()..categoriesList,
            child: const HomeScreen(),
          ),
        );
      case AppRoutes.profileView:
        return pageTransition(
          settings,
          type: PageTransitionType.rightToLeftPop,
          BlocProvider(
            create: (context) => sl<ProfileCubit>()..getProfile(),
            child: const ProfileScreen(),
          ),
        );
      case AppRoutes.addEditTaskView:
        final addEditTaskArgument = settings.arguments as AddEditTaskScreenArgs;
        return pageTransition(
          settings,
          type: PageTransitionType.rightToLeftPop,
          BlocProvider(
            create: (context) => sl<AddEditTaskCubit>(),
            child: AddEditTaskView(addEditTaskArgument),
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

//args_____________________
class TaskDetailsScreenArgs {
  final String taskImage;
  final String taskTitle;
  final String id;
  final String taskDesc;
  final String priority;
  final String status;

  TaskDetailsScreenArgs({
    required this.taskImage,
    required this.taskTitle,
    required this.id,
    required this.taskDesc,
    required this.priority,
    required this.status,
  });
}

class AddEditTaskScreenArgs {
  final String? taskImage;
  final String? taskTitle;
  final String? id;
  final String? taskDesc;
  final String? priority;
  final String? status;
  final bool isEdit;

  AddEditTaskScreenArgs(
      {this.taskImage,
      this.taskTitle,
      this.id,
      this.taskDesc,
      this.priority,
      this.status,
      required this.isEdit});
}
