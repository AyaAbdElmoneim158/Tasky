import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/utils/helpers/cache_helper.dart';
import '../../data/models/add_edit_todo_request_body.dart';
import '../../data/models/edit_todo_request_body.dart';
import '../../data/models/todo_response.dart';
import '../../data/repos/todo_repo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepo _todoRepo;
  static TodoCubit get(context) => BlocProvider.of(context);

  TodoCubit(this._todoRepo) : super(TodoInitial());

  int pageNum = 1;
  int selectedIndex = 0;
  bool isLoadMoreLoading = false;
  bool hasMoreItems = true;
  String category = 'all';
  List<TodoResponse>? items;
  List<TodoResponse>? filteredItems;
  final ScrollController scrollController = ScrollController();

  final List<String> categoriesList = ['All', 'InProgress', 'Waiting', 'Finished'];
  final Map<String, String> categoriesTextToApiValue = {
    'All': 'all',
    'InProgress': 'inProgress',
    'Waiting': 'waiting',
    'Finished': 'finished',
  };

  /// Fetch the initial list of todos
  Future<void> getTodosList() async {
    _resetPagination();
    emit(TodoLoadingState());

    final response = await _todoRepo.getTodosList(pageNum);
    response.fold(
      (error) => emit(TodoErrorState(error)),
      (todosListResponse) {
        items = todosListResponse;
        filteredItems = List.from(items!);
        emit(TodoSuccessState(items!));
      },
    );
  }

  Future<void> loadMoreItems() async {
    if (!hasMoreItems || isLoadMoreLoading || selectedIndex != 0) return;

    isLoadMoreLoading = true;
    pageNum++;
    emit(GetTodosLoadingState());

    final response = await _todoRepo.getTodosList(pageNum);
    response.fold(
      (error) {
        isLoadMoreLoading = false;
        emit(TodoErrorState(error));
      },
      (todosListResponse) {
        isLoadMoreLoading = false;
        if (todosListResponse.isEmpty) {
          hasMoreItems = false;
        } else {
          items?.addAll(todosListResponse);
          filteredItems = List.from(items!);
          emit(TodoSuccessState(items!));
        }
      },
    );
  }

  void changeTodoStatusCategory(String category) {
    selectedIndex = categoriesList.indexWhere(
      (item) => item.toLowerCase() == category.toLowerCase(),
    );

    if (category.toLowerCase() == 'all') {
      filteredItems = List.from(items!);
    } else {
      filteredItems = items!.where((item) => item.status == categoriesTextToApiValue[category]).toList();
    }

    emit(ChangeStatusCategory(category: category, filteredItems: filteredItems!));
  }

  Future<void> deleteTodoById(String id) async {
    final response = await _todoRepo.deleteTodoById(id);
    response.fold(
      (error) => emit(DeleteTodosErrorState(error)),
      (_) => getTodosList(),
    );
  }

  Future<void> uploadImage(BuildContext context, XFile? taskImage) async {
    if (taskImage != null) {
      emit(UploadImageLoadingState());
      final image = File(taskImage.path);

      final response = await _todoRepo.uploadImage(image);
      response.fold(
        (error) => emit(UploadImageErrorState(error)),
        (_) => emit(UploadImageSuccessState()),
      );
    }
  }

  Future<void> createTodo({
    required String imagePath,
    required String title,
    String? desc,
    String? priority,
    String? dueDate,
  }) async {
    emit(CreateTodoLoadingState());

    final todoData = AddEditTodoRequestBody(
      image: imagePath,
      title: title,
      desc: desc,
      priority: priority,
      dueDate: dueDate,
    );

    final response = await _todoRepo.createTodo(todoData);
    response.fold(
      (error) => emit(CreateTodoErrorState(error)),
      (_) => emit(CreateTodoSuccessState()),
    );
  }

  Future<void> updateTodo(
    String taskId, {
    required String imagePath,
    required BuildContext context,
    XFile? taskImage,
    String? title,
    String? desc,
    String? priority,
    String? status,
    String? dueDate,
  }) async {
    if (taskImage != null) {
      await uploadImage(context, taskImage);
    } else {
      emit(EditTodoLoadingState());

      final todoData = EditTodoRequestBody(
        user: await CacheHelper.getString(ApiKey.userId),
        image: imagePath,
        title: title,
        status: status,
        desc: desc,
        priority: priority,
        dueDate: dueDate,
      );

      final response = await _todoRepo.editTodo(taskId, todoData);
      response.fold(
        (error) => emit(EditTodoErrorState(error)),
        (_) => emit(EditTodoSuccessState()),
      );
    }
  }

  /// Reset pagination and filtering state
  void _resetPagination() {
    pageNum = 1;
    selectedIndex = 0;
    items = [];
    filteredItems = [];
    hasMoreItems = true;
  }
}
