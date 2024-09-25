import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import 'register_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/app_repo.dart';

class RegisterRepoImpl extends RegisterRepo {
  final ApiConsumer api;
  RegisterRepoImpl({required this.api});

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
        signUpResponse.accessToken ?? '',
        signUpResponse.refreshToken ?? '',
        signUpResponse.id ?? '',
        api,
      );
      return Right(signUpResponse);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
