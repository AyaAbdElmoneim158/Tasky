import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_repo.dart';
import '../../data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int pageNum = 1;
  int selectedIndex = 0;
  List<TodoResponse>? items;
  List<TodoResponse>? filteredItems;

  ScrollController scrollController = ScrollController();
  bool isLoadMoreLoading = false;
  bool hasMoreItems = true;

  String category = 'all';
  List<String> categoriesList = ['All', 'InProgress', 'Waiting', 'Finished'];
  Map<String, dynamic> categoriesTextToApiValue = {
    'All': 'all',
    'InProgress': 'inProgress',
    'Waiting': 'waiting',
    'Finished': 'finished'
  };

  void getTodosList() async {
    pageNum = 1;
    items = [];
    filteredItems = [];
    selectedIndex = 0;
    emit(HomeLoadingState());
    hasMoreItems = true;
    final response = await _homeRepo.getTodosList(pageNum);
    response.fold(
      (error) => emit(HomeErrorState(error)),
      (todosListResponse) {
        items!.addAll(todosListResponse);
        emit(HomeSuccessState(todosListResponse));
      },
    );
  }

  void loadMoreItems() async {
    if (hasMoreItems == false || isLoadMoreLoading || selectedIndex != 0) {
      return;
    }
    pageNum++;
    isLoadMoreLoading = true;

    emit(GetTasksLoadingState());
    final response = await _homeRepo.getTodosList(pageNum);
    response.fold(
      (error) {
        isLoadMoreLoading = false;
        emit(HomeErrorState(error));
      },
      (todosListResponse) {
        isLoadMoreLoading = false;
        if (todosListResponse.isEmpty) {
          hasMoreItems = false;
        }
        items!.addAll(todosListResponse);
        filteredItems = items;
        emit(HomeSuccessState(todosListResponse));
      },
    );
  }

  void changeTaskStatusCategory(String category) async {
    if (category.toLowerCase() == 'all') {
      selectedIndex = 0;
      filteredItems = items!;
    } else {
      selectedIndex = categoriesList.indexWhere(
        (item) => item.toLowerCase() == category.toLowerCase(),
      );
      filteredItems = items!
          .where((item) => item.status == categoriesTextToApiValue[category])
          .toList();
    }
    emit(ChangeStatusCategory(
      category: category,
      filteredItems: filteredItems!,
    ));
  }

  void deleteTaskById(String id) async {
    final response = await _homeRepo.deleteTodoById(id);
    response.fold(
      (error) => emit(DeleteTasksErrorState(error)),
      (r) {
        getTodosList();
        emit(DeleteTasksSuccessState());
      },
    );
  }
}
