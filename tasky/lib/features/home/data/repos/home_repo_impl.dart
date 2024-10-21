import 'package:dartz/dartz.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/app_repo.dart';
import '../../../../core/errors/exceptions.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiConsumer api;
  HomeRepoImpl({required this.api});

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
}
