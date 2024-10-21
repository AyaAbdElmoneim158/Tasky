import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/app_repo.dart';
import '../../../../core/errors/exceptions.dart';
import 'add_edit_task_repo.dart';

class AddEditTaskRepoImpl extends AddEditTaskRepo {
  final ApiConsumer api;
  AddEditTaskRepoImpl({required this.api});

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
  Future<Either<String, UploadPhotoResponse?>> uploadImage(File file) async {
    final data = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split(Platform.pathSeparator).last,
        contentType: DioMediaType.parse('image/jpeg'),
      ),
    });
    data.clone();
    // print({data.files.last.key: data.files.last.toString()});

    try {
      api.setContentTypeIntoHeader('multipart/form-data');
      final response = await api.post(EndPoints.uploadImage);
      api.setContentTypeIntoHeader('application/json');
      return Right(UploadPhotoResponse.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
