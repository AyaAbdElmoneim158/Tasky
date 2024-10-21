import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'routes.dart';
import 'screen_routing.dart';

class AppRouter {
  static Route? onGenerate(RouteSettings settings) {
    // final args = settings.arguments as String;

    switch (settings.name) {
      case AppRoutes.initRoute:
        return pageTransition(settings, const SplashScreen());

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
      {this.taskImage, this.taskTitle, this.id, this.taskDesc, this.priority, this.status, required this.isEdit});
}
