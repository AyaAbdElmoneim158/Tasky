import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../features/auth/presentation/view/login_view.dart';
import '../../../features/auth/presentation/view/register_view.dart';
import '../../../features/auth/presentation/view/splash_view.dart';
import '../../../features/auth/presentation/view/welcome_view.dart';
import '../../../features/auth/presentation/view_model/auth_cubit.dart';
import '../../../features/profile/presentation/view/profile_view.dart';
import '../../../features/profile/presentation/view_model/profile_cubit.dart';
import '../../../features/todos/presentation/view/add_edit_todo_view.dart';
import '../../../features/todos/presentation/view/todo_details_view.dart';
import '../../../features/todos/presentation/view/todo_view.dart';
import '../../../features/todos/presentation/view_model/todo_cubit.dart';
import '../../../injection_container.dart';
import 'routes.dart';
import 'screen_routing.dart';

class AppRouter {
  static Route? onGenerate(RouteSettings settings) {
    final arguments = settings.arguments;
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
      case AppRoutes.profileView:
        return pageTransition(
          settings,
          BlocProvider(
            create: (context) => sl<ProfileCubit>()..getProfile(),
            child: const ProfileView(),
          ),
        );
      case AppRoutes.homeView:
        return pageTransition(
          settings,
          BlocProvider(
            create: (context) => sl<TodoCubit>()..getTodosList(),
            child: const TodoView(),
          ),
        );

      case AppRoutes.addEditTodoView:
        final addEditTodoArgument = arguments as AddEditTodoScreenArgs;
        return pageTransition(
          settings,
          BlocProvider(
            create: (context) => sl<TodoCubit>(),
            child: AddEditTodoView(addEditTodoArgument),
          ),
        );
      case AppRoutes.todoDetailsView:
        final todoDetailsScreenArgs = arguments as TodoDetailsScreenArgs;
        return pageTransition(
          settings,
          BlocProvider(
            create: (context) => sl<TodoCubit>(),
            child: TodoDetails(todoDetailsScreenArgs: todoDetailsScreenArgs),
          ),
        );
      //todoDetailsView
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
class TodoDetailsScreenArgs {
  final String todoImage;
  final String todoTitle;
  final String id;
  final String todoDesc;
  final String priority;
  final String status;

  TodoDetailsScreenArgs({
    required this.todoImage,
    required this.todoTitle,
    required this.id,
    required this.todoDesc,
    required this.priority,
    required this.status,
  });
}

class AddEditTodoScreenArgs {
  final String? todoImage;
  final String? todoTitle;
  final String? id;
  final String? todoDesc;
  final String? priority;
  final String? status;
  final bool isEdit;

  AddEditTodoScreenArgs({
    this.todoImage,
    this.todoTitle,
    this.id,
    this.todoDesc,
    this.priority,
    this.status,
    required this.isEdit,
  });
}
