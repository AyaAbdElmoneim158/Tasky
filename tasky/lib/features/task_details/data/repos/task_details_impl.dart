import 'package:dartz/dartz.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/app_repo.dart';
import '../../../../core/errors/exceptions.dart';
import 'task_details_repo.dart';

class TaskDetailsRepoImpl extends TaskDetailsRepo {
  final ApiConsumer api;
  TaskDetailsRepoImpl(this.api);

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
}
