import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/app_repo.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/helpers/cache_helper.dart';
import '../../data/repos/add_edit_task_repo.dart';
part 'add_edit_task_state.dart';

class AddEditTaskCubit extends Cubit<AddEditTaskState> {
  final AddEditTaskRepo _addEditTaskRepo;

  AddEditTaskCubit(this._addEditTaskRepo) : super(AddEditTaskInitial());
  static AddEditTaskCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  String taskPriority = Priority.low.name;
  String taskStatus = Status.waiting.name;
  XFile? taskImage;
  bool isEdit = false;

  void clearData() {
    titleController.clear();
    descriptionController.clear();
    dueDateController.clear();
    taskPriority = Priority.low.name;
    taskStatus = Status.waiting.name;
    taskImage = null;
  }

  Future<void> uploadImage(BuildContext context) async {
    if (taskImage != null) {
      emit(UploadImageLoadingState());
      File image = File(taskImage!.path);
      final response = await _addEditTaskRepo.uploadImage(image);

      response.fold(
        (error) {
          taskImage = null;
          emit(UploadImageErrorState(error));
        },
        (unit) {
          emit(UploadImageSuccessState());
        },
      );
    }
    /*
    ! from ui
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please pick an image'),
          duration: Duration(seconds: 5),
        ),
      );
    }*/
  }

  Future<void> createTask(String? imagePath) async {
    emit(CreateTaskLoadingState());
    AddEditTaskRequestBody addEditTaskRequestBody = AddEditTaskRequestBody(
      image: imagePath!,
      title: titleController.text,
      desc: descriptionController.text,
      priority: taskPriority,
      dueDate: dueDateController.text,
    );
    final response = await _addEditTaskRepo.createTask(addEditTaskRequestBody);
    response.fold(
      (error) => emit(CreateTaskErrorState(error)),
      (unit) => emit(CreateTaskSuccessState()),
    );
  }

  Future<void> updateTask(
    String? imagePath,
    String taskId,
    BuildContext context,
  ) async {
    if (taskImage != null) {
      await uploadImage(context);
    } else {
      emit(EditTaskLoadingState());
      EditTaskRequestBody editTaskRequestBody = EditTaskRequestBody(
        image: imagePath!,
        title: titleController.text,
        status: taskStatus,
        user: await CacheHelper.getSecuredString(ApiKey.userId),
        desc: descriptionController.text,
        priority: taskPriority,
        dueDate: dueDateController.text,
      );
      final response =
          await _addEditTaskRepo.editTask(taskId, editTaskRequestBody);

      response.fold(
        (error) => emit(EditTaskErrorState(error)),
        (unit) => emit(EditTaskSuccessState()),
      );
    }
  }
}
