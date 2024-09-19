part of 'login_cubit.dart';

class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginResponse loginResponse;
  LoginSuccessState(this.loginResponse);
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}

class ChangePasswordVisibility extends LoginState {}
