// import '../../data/models/login_response.dart';

part of 'auth_cubit.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final LoginResponse? loginResponse;
  final SignUpResponse? registerResponse;
  final RefreshTokenResponse? refreshTokenResponse;
  AuthSuccessState({
    this.loginResponse,
    this.registerResponse,
    this.refreshTokenResponse,
  });
}

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}

class ChangePasswordVisibility extends AuthState {}
