import 'package:dartz/dartz.dart';
import '../../../../core/app_repo.dart';

abstract class HomeRepo {
  Future<Either<String, List<TodoResponse>>> getTodosList(int pageNum);
  Future<Either<String, Unit>> deleteTodoById(String id);
}
