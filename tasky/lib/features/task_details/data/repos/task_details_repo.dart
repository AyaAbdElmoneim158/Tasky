import 'package:dartz/dartz.dart';

import '../../../../core/app_repo.dart';

abstract class TaskDetailsRepo {
  Future<Either<String, TodoResponse>> getTodoById(String id);
}
