import 'api/api_consumer.dart';
import 'api/end_points.dart';
import 'package:dartz/dartz.dart';

import 'errors/exceptions.dart';
import 'utils/helpers/helper_functions.dart';

abstract class AppRepo {
  Future<Either<String, SignUpResponse>> signUp(
      SignUpResponseBody signUpResponseBody); //@Body
  Future<Either<String, ProfileResponse>> getProfile();
  //! Logout
  Future<Either<String, List<TodoResponse>>> getTodosList(int pageNum);
  //@Query("page")
  Future<Either<String, TodoResponse>> getTodoById(String id);
  //@Path("id") .... @GET("/todos/{id}")
  Future<Either<String, Unit>> createTask(
      AddEditTaskRequestBody addEditTaskRequestBody);
  // @Body()
  Future<Either<String, Unit>> deleteTodoById(String id);
  //@Path("id") ....    @DELETE("todos/{id}")
  Future<Either<String, Unit>> editTask(
    String id,
    EditTaskRequestBody editTaskRequestBody,
  );
  // @PUT("todos/{id}") +@Body()
  //! Future<UploadPhotoResponse?> uploadImageService(File file)
}

// At SignUp.Feature-------------------------------------------------------------
class SignUpResponseBody {
  final String? phone;
  final String? password;
  final String? displayName;
  final int? experienceYears;
  final String? level;
  final String? address;

  SignUpResponseBody({
    this.phone,
    this.password,
    this.displayName,
    this.experienceYears,
    this.level,
    this.address,
  });

  // Factory constructor to create an instance from JSON
  factory SignUpResponseBody.fromJson(Map<String, dynamic> json) {
    return SignUpResponseBody(
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      displayName: json['display_name'] as String?,
      experienceYears: json['experience_years'] as int?,
      level: json['level'] as String?,
      address: json['address'] as String?,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
      'display_name': displayName,
      'experience_years': experienceYears,
      'level': level,
      'address': address,
    };
  }
}

class SignUpResponse {
  final String? accessToken;
  final String? refreshToken;
  final String? displayName;
  final String? id;

  SignUpResponse({
    this.accessToken,
    this.refreshToken,
    this.displayName,
    this.id,
  });

  // Factory constructor to create an instance from JSON
  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      displayName: json['display_name'] as String?,
      id: json['_id'] as String?,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'display_name': displayName,
      '_id': id,
    };
  }
}

// At Profile.Feature-------------------------------------------------------------
class ProfileResponse {
  final int? experienceYears;
  final String? phoneNumber;
  final String? displayName;
  final String? level;
  final String? address;

  ProfileResponse({
    this.experienceYears,
    this.phoneNumber,
    this.displayName,
    this.level,
    this.address,
  });

  // Factory constructor to create an instance from JSON
  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      experienceYears: json['experience_years'] as int?,
      phoneNumber: json['username'] as String?,
      displayName: json['display_name'] as String?,
      level: json['level'] as String?,
      address: json['address'] as String?,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'experience_years': experienceYears,
      'username': phoneNumber,
      'display_name': displayName,
      'level': level,
      'address': address,
    };
  }
}

// At Home.Feature-------------------------------------------------------------
class TodoResponse {
  final String? id;
  final String? image;
  final String? title;
  final String? desc;
  final String? priority;
  final String? status;
  final String? user;
  final String? createdAt;
  final String? updatedAt;

  TodoResponse({
    this.id,
    this.image,
    this.title,
    this.desc,
    this.priority,
    this.status,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor to create an instance from JSON
  factory TodoResponse.fromJson(Map<String, dynamic> json) {
    return TodoResponse(
      id: json['_id'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      priority: json['priority'] as String?,
      status: json['status'] as String?,
      user: json['user'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'image': image,
      'title': title,
      'desc': desc,
      'priority': priority,
      'status': status,
      'user': user,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

// At Add_Edit_task.Feature-------------------------------------------------------------
class AddEditTaskRequestBody {
  final String? image;
  final String? title;
  final String? desc;
  final String? priority;
  final String? dueDate;

  AddEditTaskRequestBody({
    this.image,
    this.title,
    this.desc,
    this.priority,
    this.dueDate,
  });

  // Factory constructor to create an instance from JSON
  factory AddEditTaskRequestBody.fromJson(Map<String, dynamic> json) {
    return AddEditTaskRequestBody(
      image: json['image'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      priority: json['priority'] as String?,
      dueDate: json['dueDate'] as String?,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'desc': desc,
      'priority': priority,
      'dueDate': dueDate,
    };
  }
}

class EditTaskRequestBody {
  final String? image;
  final String? title;
  final String? desc;
  final String? status;
  final String? user;
  final String? priority;
  final String? dueDate;

  EditTaskRequestBody({
    this.image,
    this.title,
    this.desc,
    this.status,
    this.user,
    this.priority,
    this.dueDate,
  });

  // Factory constructor to create an instance from JSON
  factory EditTaskRequestBody.fromJson(Map<String, dynamic> json) {
    return EditTaskRequestBody(
      image: json['image'] as String?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      status: json['status'] as String?,
      user: json['user'] as String?,
      priority: json['priority'] as String?,
      dueDate: json['dueDate'] as String?,
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'desc': desc,
      'status': status,
      'user': user,
      'priority': priority,
      'dueDate': dueDate,
    };
  }
}

class UploadPhotoRequestBody {
  final String filePath;
  UploadPhotoRequestBody({required this.filePath});

  factory UploadPhotoRequestBody.fromJson(Map<String, dynamic> json) {
    return UploadPhotoRequestBody(
      filePath: json['image'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'image': filePath,
    };
  }
}

class UploadPhotoResponse {
  String? image;
  UploadPhotoResponse({this.image});

  factory UploadPhotoResponse.fromJson(Map<String, dynamic> json) {
    return UploadPhotoResponse(
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
    };
  }
}
// At Details.Feature-------------------------------------------------------------
// At Scan.Feature-------------------------------------------------------------

class AppRepoImpl extends AppRepo {
  final ApiConsumer api;
  AppRepoImpl({required this.api});

  @override
  Future<Either<String, Unit>> createTask(
    AddEditTaskRequestBody addEditTaskRequestBody,
  ) async {
    try {
      await api.post(
        EndPoints.profile,
        data: addEditTaskRequestBody.toJson(),
      );
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  @override
  Future<Either<String, Unit>> deleteTodoById(String id) async {
    try {
      await api.delete(
        EndPoints.deleteTask(id),
      );
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  @override
  Future<Either<String, Unit>> editTask(
    String id,
    EditTaskRequestBody editTaskRequestBody,
  ) async {
    try {
      await api.put(
        EndPoints.editTask(id),
        data: editTaskRequestBody.toJson(),
      );
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  @override
  Future<Either<String, ProfileResponse>> getProfile() async {
    try {
      final response = await api.get(EndPoints.profile);
      final profileResponse = ProfileResponse.fromJson(response);
      return Right(profileResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  @override
  Future<Either<String, TodoResponse>> getTodoById(String id) async {
    try {
      final response = await api.get(EndPoints.getTodo(id));
      final todoResponse = TodoResponse.fromJson(response);
      return Right(todoResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  @override
  Future<Either<String, List<TodoResponse>>> getTodosList(int pageNum) async {
    try {
      final response = await api.get(
        EndPoints.getTodosList,
        queryParameters: {'page': pageNum},
      );
      final todosResponse = response as List;
      final todos =
          todosResponse.map((ele) => TodoResponse.fromJson(ele)).toList();
      return Right(todos);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  @override
  Future<Either<String, SignUpResponse>> signUp(
      SignUpResponseBody signUpResponseBody) async {
    try {
      final response = await api.post(
        EndPoints.register,
        data: signUpResponseBody.toJson(),
      );
      final signUpResponse = SignUpResponse.fromJson(response);
      await AppHelperFunctions.saveUserData(
        signUpResponse.accessToken ?? '',
        signUpResponse.refreshToken ?? '',
        signUpResponse.id ?? '',
        api,
      );
      return Right(signUpResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
// homeQubit -----------------------------------------------------------------------------
/*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/features/home/data/models/todo_response.dart';
import 'package:tasky_app/features/home/data/repos/home_repo.dart';
import 'package:tasky_app/features/home/logic/home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  ScrollController scrollController = ScrollController();

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  int pageNum = 1;
  String category = 'all';
  bool isLoadMoreLoading = false;
  List<TodoResponse>? items;
  List<TodoResponse>? filteredItems;
  bool hasMoreItems = true;
  List<String> categoriesList = ['All', 'InProgress', 'Waiting', 'Finished'];
  Map<String, dynamic> categoriesTextToApiValue = {
    'All':'all',
    'InProgress':'inProgress',
    'Waiting':'waiting',
    'Finished':'finished'
  };

  int selectedIndex = 0;

  //get tasks for first time or refresh---------------

  Future getTasksForFirstTime() async {
    selectedIndex = 0;
    pageNum = 1;
    items = [];
    filteredItems = [];
    hasMoreItems = true;
    emit(const HomeState.getTasksLoading());
    final response = await _homeRepo.getTodoList(1);
    response.when(success: (todoResponse) async {
      items!.addAll(todoResponse);
      changeTaskStatusCategory(category);
      emit(HomeState.getTasksSuccess(items));
    }, failure: (error) {
      emit(HomeState.getTasksError(error: error.apiErrorModel.message ?? ''));
    });
  }

//load more tasks----

  void loadMoreItems() async {
    if (hasMoreItems == false || isLoadMoreLoading || selectedIndex != 0)
      return;

    pageNum++;
    isLoadMoreLoading = true;
    emit(const HomeState.getTasksLoading());

    final response = await _homeRepo.getTodoList(pageNum);
    response.when(success: (todoResponse) {
      isLoadMoreLoading = false;
      if (todoResponse.isEmpty) {
        hasMoreItems = false;
      }
      items!.addAll(todoResponse);
      filteredItems = items;
      emit(HomeState.getTasksSuccess(items));
    }, failure: (error) {
      isLoadMoreLoading = false;
      emit(HomeState.getTasksError(error: error.apiErrorModel.message ?? ''));
    });
  }

  //change tasks category-----------

  void changeTaskStatusCategory(String category) async {
    if (category.toLowerCase() == 'all') {
      selectedIndex = 0;
      filteredItems = items!;
    } else {
      selectedIndex = categoriesList
          .indexWhere((item) => item.toLowerCase() == category.toLowerCase());
      filteredItems = items!
          .where((item) => item.status == categoriesTextToApiValue[category])
          .toList();
    }
    emit(HomeState.changeStatusCategory(
        category: category, filteredItems: filteredItems!));
  }

  //delete task-------------

  void deleteTaskById(String taskId) async {
    final response = await _homeRepo.deleteTaskById(taskId);
    response.when(success: (_) async {
      getTasksForFirstTime();
    }, failure: (error) {
      emit(HomeState.getTasksError(error: error.apiErrorModel.message ?? ''));
    });
  }
}
*/
// CustomEnumRowButton ----------------------------------------------
/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/Core/assets_manager.dart';
import 'package:tasky_app/Core/helpers/spacing.dart';
import 'package:tasky_app/Core/theming/colors.dart';
import 'package:tasky_app/Core/theming/styles.dart';

class CustomEnumRowButton<T> extends StatefulWidget {
  final T initialValue;
  final List<T> values;
  final String Function(T) displayName;
  final String Function(T) apiValue;
  final Color Function(T) containerColor;
  final String Function(T)? flagImage;
  final Color Function(T) textColor;
  final void Function(T) onValueSelected;

  const CustomEnumRowButton({
    super.key,
    required this.initialValue,
    required this.values,
    required this.displayName,
    required this.apiValue,
    required this.containerColor,
    this.flagImage,
    required this.textColor,
    required this.onValueSelected,
  });

  @override
  CustomEnumRowButtonState<T> createState() => CustomEnumRowButtonState<T>();
}

class CustomEnumRowButtonState<T> extends State<CustomEnumRowButton<T>> {
  late T selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) async {
        FocusScope.of(context).requestFocus(new FocusNode());
        selectedValue = await _showPopupMenu(context, details.globalPosition);
        widget.onValueSelected(selectedValue);
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: widget.containerColor(selectedValue),
            borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          children: [
            widget.flagImage != null
                ? SvgPicture.asset(widget.flagImage!(selectedValue))
                : const SizedBox(),
            horizontalSpace(10),
            Text(
              widget.displayName(selectedValue),
              style: TextStyles.font12MainPurpleMedium
                  .copyWith(color: widget.textColor(selectedValue)),
            ),
            const Spacer(),
            SvgPicture.asset(IconsManager.arrowDown),
          ],
        ),
      ),
    );
  }

  Future<T> _showPopupMenu(BuildContext context, Offset position) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    return await showMenu<T>(
      constraints: BoxConstraints(minWidth: double.infinity),
      context: context,
      color: ColorsManager.containerMain,
      position: RelativeRect.fromRect(
        position & const Size(40, 40),
        Offset.zero & overlay.size,
      ),
      items: widget.values.map((value) {
        return PopupMenuItem<T>(
          value: value,
          child: Text(widget.displayName(value)),
        );
      }).toList(),
      elevation: 8.0,
    ).then((value) {
      return value ?? widget.initialValue;
    });
  }
}

 */