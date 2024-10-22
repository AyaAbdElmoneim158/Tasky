import 'package:dartz/dartz.dart';
import '../models/logout_response.dart';
import '../models/profile_response.dart';

abstract class ProfileRepo {
  Future<Either<String, ProfileResponse>> getProfile();
  Future<Either<String, LogoutResponse>> logout();
}
