import 'package:dartz/dartz.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/app_repo.dart';
import '../../../../core/errors/exceptions.dart';
import 'profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ApiConsumer api;
  ProfileRepoImpl({required this.api});

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
}
