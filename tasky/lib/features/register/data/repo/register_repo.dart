import 'package:dartz/dartz.dart';
import '../../../../core/app_repo.dart';

abstract class RegisterRepo {
  Future<Either<String, SignUpResponse>> signUp(
      SignUpResponseBody signUpResponseBody);
}
