part of 'task_details_cubit.dart';

class TaskDetailsState {}

final class TaskDetailsInitial extends TaskDetailsState {}

class TaskDetailsLoadingState extends TaskDetailsState {}

class TaskDetailsSuccessState extends TaskDetailsState {
  TodoResponse todoResponse;
  TaskDetailsSuccessState(this.todoResponse);
}

class TaskDetailsErrorState extends TaskDetailsState {
  final String error;
  TaskDetailsErrorState(this.error);
}
