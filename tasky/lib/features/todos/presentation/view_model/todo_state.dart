part of 'todo_cubit.dart';

class TodoState {}

final class TodoInitial extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoSuccessState extends TodoState {
  List<TodoResponse> todosListResponse;
  TodoSuccessState(this.todosListResponse);
}

class TodoErrorState extends TodoState {
  final String error;
  TodoErrorState(this.error);
}

final class ChangeStatusCategory extends TodoState {
  List<TodoResponse>? filteredItems;
  String category;
  ChangeStatusCategory({required this.category, this.filteredItems});
}

class GetTodosLoadingState extends TodoState {}

class GetTodosSuccessState extends TodoState {
  List<TodoResponse>? filteredItems;
  GetTodosSuccessState(this.filteredItems);
}

class GetTodosErrorState extends TodoState {
  final String error;
  GetTodosErrorState(this.error);
}

class DeleteTodosErrorState extends TodoState {
  final String error;
  DeleteTodosErrorState(this.error);
}

class DeleteTodosSuccessState extends TodoState {}

final class AddEditTodoInitial extends TodoState {}

class CreateTodoLoadingState extends TodoState {}

class CreateTodoSuccessState extends TodoState {}

class CreateTodoErrorState extends TodoState {
  final String error;
  CreateTodoErrorState(this.error);
}

class EditTodoLoadingState extends TodoState {}

class EditTodoSuccessState extends TodoState {}

class EditTodoErrorState extends TodoState {
  final String error;
  EditTodoErrorState(this.error);
}

class UploadImageLoadingState extends TodoState {}

class UploadImageSuccessState extends TodoState {}

class UploadImageErrorState extends TodoState {
  final String error;
  UploadImageErrorState(this.error);
}
