import 'package:dartz/dartz.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';
import '../models/refresh_token_response.dart';
import '../models/sign_up_response.dart';
import '../models/sign_up_response_body.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiConsumer api;
  AuthRepoImpl({required this.api});

  @override
  Future<Either<String, LoginResponse>> login(
      LoginRequestBody requestBody) async {
    try {
      final response =
          await api.post(EndPoints.login, data: requestBody.toJson());
      final loginResponse = LoginResponse.fromJson(response);

      await AppHelperFunctions.saveUserData(
        accessToken: loginResponse.accessToken ?? '',
        refreshToken: loginResponse.refreshToken ?? '',
        userId: loginResponse.id ?? '',
        api: api,
      );
      return Right(loginResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<RefreshTokenResponse> refreshToken(String refreshToken) async {
    final response = await api.get(
      EndPoints.refreshToken,
      queryParameters: {ApiKey.token: refreshToken},
    );
    final refreshTokenResponse = RefreshTokenResponse.fromJson(response);
    await AppHelperFunctions.saveUserData(
      accessToken: refreshTokenResponse.accessToken ?? '',
      refreshToken: refreshTokenResponse.refreshToken ?? '',
      api: api,
    );
    return refreshTokenResponse;
  }

  @override
  Future<Either<String, SignUpResponse>> signUp(
      SignUpResponseBody signUpResponseBody) async {
    try {
      final response = await api.post(
        EndPoints.register,
        data: signUpResponseBody.toJson(),
      );
      final signUpResponse = SignUpResponse.fromJson(response);
      await AppHelperFunctions.saveUserData(
        accessToken: signUpResponse.accessToken ?? '',
        refreshToken: signUpResponse.refreshToken ?? '',
        userId: signUpResponse.id ?? '',
        api: api,
      );
      return Right(signUpResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
