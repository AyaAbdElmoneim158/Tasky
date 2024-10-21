import 'package:dartz/dartz.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/helpers/cache_helper.dart';
import '../models/logout_response.dart';
import '../models/profile_response.dart';
import 'profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ApiConsumer api;
  ProfileRepoImpl({required this.api});

  @override
  Future<Either<String, ProfileResponse>> getProfile() async {
    try {
      final response = await api.get(EndPoints.profile);
      final profileResponse = ProfileResponse.fromJson(response);
      // ToDo: cashing profile
      return Right(profileResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, LogoutResponse>> logout() async {
    try {
      final refreshToken = await CacheHelper.getString(ApiKey.refreshToken);
      if (refreshToken != null && refreshToken.isNotEmpty) {
        final response = await api.post(
          EndPoints.logout,
          data: {"token": refreshToken},
        );
        final logoutResponse = LogoutResponse.fromJson(response as Map<String, dynamic>);
        return Right(logoutResponse);
      }
      return const Left("Error has occurred!");
    } on ServerException catch (e) {
      return Left(e.toString());
    }
  }
}
