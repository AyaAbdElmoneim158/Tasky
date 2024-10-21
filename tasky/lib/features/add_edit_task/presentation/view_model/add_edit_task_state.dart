part of 'add_edit_task_cubit.dart';

class AddEditTaskState {}

final class AddEditTaskInitial extends AddEditTaskState {}

class CreateTaskLoadingState extends AddEditTaskState {}

class CreateTaskSuccessState extends AddEditTaskState {}

class CreateTaskErrorState extends AddEditTaskState {
  final String error;
  CreateTaskErrorState(this.error);
}

class EditTaskLoadingState extends AddEditTaskState {}

class EditTaskSuccessState extends AddEditTaskState {}

class EditTaskErrorState extends AddEditTaskState {
  final String error;
  EditTaskErrorState(this.error);
}

class UploadImageLoadingState extends AddEditTaskState {}

class UploadImageSuccessState extends AddEditTaskState {}

class UploadImageErrorState extends AddEditTaskState {
  final String error;
  UploadImageErrorState(this.error);
}
