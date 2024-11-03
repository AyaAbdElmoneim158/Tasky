import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/add_edit_todo_request_body.dart';
import '../models/edit_todo_request_body.dart';
import '../models/todo_response.dart';
import '../models/upload_photo_response.dart';
import 'todo_repo.dart';

class TodoRepoImpl extends TodoRepo {
  final ApiConsumer api;

  TodoRepoImpl({required this.api});

  @override
  Future<Either<String, List<TodoResponse>>> getTodosList(int pageNum) async {
    return _handleServerError(() async {
      final response = await api.get(
        EndPoints.getTodosList,
        queryParameters: {'page': pageNum},
      );
      final todosResponse = response as List;
      final todos = todosResponse.map((e) => TodoResponse.fromJson(e)).toList();
      debugPrint("Fetched Todos List Successfully");
      return Right(todos);
    });
  }

  @override
  Future<Either<String, Unit>> deleteTodoById(String id) async {
    return _handleServerError(() async {
      await api.delete(EndPoints.deleteTodo(id));
      return const Right(unit);
    });
  }

  @override
  Future<Either<String, TodoResponse>> getTodoById(String id) async {
    return _handleServerError(() async {
      final response = await api.get(EndPoints.getTodo(id));
      final todo = TodoResponse.fromJson(response);
      return Right(todo);
    });
  }

  @override
  Future<Either<String, Unit>> createTodo(AddEditTodoRequestBody addEditTodoRequestBody) async {
    return _handleServerError(() async {
      await api.post(
        EndPoints.createTodo,
        data: addEditTodoRequestBody.toJson(),
      );
      return const Right(unit);
    });
  }

  @override
  Future<Either<String, Unit>> editTodo(String id, EditTodoRequestBody editTodoRequestBody) async {
    return _handleServerError(() async {
      await api.put(
        EndPoints.editTodo(id),
        data: editTodoRequestBody.toJson(),
      );
      return const Right(unit);
    });
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

    return _handleServerError(() async {
      final response = await api.post(
        EndPoints.uploadImage,
        data: data,
      );
      return Right(UploadPhotoResponse.fromJson(response));
    });
  }

  Future<Either<String, T>> _handleServerError<T>(Future<Either<String, T>> Function() action) async {
    try {
      return await action();
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
