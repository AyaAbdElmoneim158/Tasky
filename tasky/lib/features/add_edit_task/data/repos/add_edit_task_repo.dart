import 'package:dartz/dartz.dart';
import 'dart:io';
import '../../../../core/app_repo.dart';

abstract class AddEditTaskRepo {
  Future<Either<String, Unit>> createTask(
    AddEditTaskRequestBody addEditTaskRequestBody,
  );

  Future<Either<String, Unit>> editTask(
    String id,
    EditTaskRequestBody editTaskRequestBody,
  );

  Future<Either<String, UploadPhotoResponse?>> uploadImage(File file);
}
