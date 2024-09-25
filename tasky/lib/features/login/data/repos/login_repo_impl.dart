import 'package:dartz/dartz.dart';
import 'package:tasky/features/login/data/models/refresh_token_response.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';
import 'login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final ApiConsumer api;
  LoginRepoImpl({required this.api});

  @override
  Future<Either<String, LoginResponse>> login(
      LoginRequestBody requestBody) async {
    try {
      final response = await api.post(
        EndPoints.login,
        data: requestBody.toJson(),
      );
      final loginResponse = LoginResponse.fromJson(response);

      await AppHelperFunctions.saveUserData(
        loginResponse.accessToken ?? '',
        loginResponse.refreshToken ?? '',
        loginResponse.id ?? '',
        api,
      );
      return Right(loginResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  @override
  Future<Either<String, RefreshTokenResponse>> refreshToken(
      String refreshToken) async {
    try {
      final response = await api.get(
        EndPoints.refreshToken,
        queryParameters: {'token': refreshToken},
      );
      final refreshTokenResponse = RefreshTokenResponse.fromJson(response);
      return Right(refreshTokenResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
