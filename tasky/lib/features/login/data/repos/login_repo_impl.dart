import 'package:dartz/dartz.dart';
import 'package:tasky/features/login/data/models/refresh_token_response.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/helpers/cache_helper.dart';
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
      final response =
          await api.post(EndPoints.login, data: requestBody.toJson());
      final loginResponse = LoginResponse.fromJson(response);

      await saveUserData(
        loginResponse.accessToken ?? '',
        loginResponse.refreshToken ?? '',
        loginResponse.id ?? '',
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
      //! saveLoginResponseData(loginResponse);
      // final decodedToken = JwtDecoder.decode(loginResponse.accessToken);
      return Right(refreshTokenResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<void> saveUserData(
    String accessToken,
    String refreshToken,
    String userId,
  ) async {
    await CacheHelper.setSecuredString(ApiKey.accessToken, accessToken);
    await CacheHelper.setSecuredString(ApiKey.refreshToken, refreshToken);
    await CacheHelper.setSecuredString(ApiKey.userId, userId);
    api.setTokenIntoHeaderAfterLogin(accessToken);
  }
}
