part of 'home_cubit.dart';

class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  List<TodoResponse> todosListResponse;
  HomeSuccessState(this.todosListResponse);
}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}

final class ChangeStatusCategory extends HomeState {
  List<TodoResponse>? filteredItems;
  String category;
  ChangeStatusCategory({required this.category, this.filteredItems});
}

class GetTasksLoadingState extends HomeState {}

class GetTasksSuccessState extends HomeState {
  List<TodoResponse>? filteredItems;
  GetTasksSuccessState(this.filteredItems);
}

class GetTasksErrorState extends HomeState {
  final String error;
  GetTasksErrorState(this.error);
}

class DeleteTasksErrorState extends HomeState {
  final String error;
  DeleteTasksErrorState(this.error);
}

class DeleteTasksSuccessState extends HomeState {}
