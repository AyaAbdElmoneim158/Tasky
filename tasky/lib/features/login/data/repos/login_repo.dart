import 'package:dartz/dartz.dart';

import '../models/login_request_body.dart';
import '../models/login_response.dart';
import '../models/refresh_token_response.dart';

abstract class LoginRepo {
  Future<Either<String, LoginResponse>> login(LoginRequestBody requestBody);
  Future<Either<String, RefreshTokenResponse>> refreshToken(
      String refreshToken);
}
