import 'package:dartz/dartz.dart';

import '../models/login_request_body.dart';
import '../models/login_response.dart';
import '../models/refresh_token_response.dart';
import '../models/sign_up_response.dart';
import '../models/sign_up_response_body.dart';

abstract class AuthRepo {
  Future<Either<String, LoginResponse>> login(LoginRequestBody requestBody);
  Future<RefreshTokenResponse> refreshToken(String refreshToken);
  Future<Either<String, SignUpResponse>> signUp(SignUpResponseBody signUpResponseBody);
}
