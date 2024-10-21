import 'package:dartz/dartz.dart';
import '../../../../core/app_repo.dart';

abstract class ProfileRepo {
  Future<Either<String, ProfileResponse>> getProfile();
}
