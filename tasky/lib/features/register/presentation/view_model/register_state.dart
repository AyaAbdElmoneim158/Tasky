part of 'register_cubit.dart';

class RegisterState {}

final class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final SignUpResponse registerResponse;
  RegisterSuccessState(this.registerResponse);
}

class RegisterErrorState extends RegisterState {
  final String error;
  RegisterErrorState(this.error);
}

final class ChangePasswordVisibility extends RegisterState {}
