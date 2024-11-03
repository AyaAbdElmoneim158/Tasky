import 'dart:io';
import 'package:dartz/dartz.dart';

import '../models/add_edit_todo_request_body.dart';
import '../models/edit_todo_request_body.dart';
import '../models/todo_response.dart';
import '../models/upload_photo_response.dart';

abstract class TodoRepo {
  Future<Either<String, List<TodoResponse>>> getTodosList(int pageNum);
  Future<Either<String, Unit>> deleteTodoById(String id);
  Future<Either<String, TodoResponse>> getTodoById(String id);
  Future<Either<String, Unit>> createTodo(AddEditTodoRequestBody addEditTodoRequestBody);
  Future<Either<String, Unit>> editTodo(String id, EditTodoRequestBody editTodoRequestBody);
  Future<Either<String, UploadPhotoResponse?>> uploadImage(File file);
}
