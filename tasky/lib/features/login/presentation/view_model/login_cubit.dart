import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasky/features/login/data/models/login_response.dart';

import '../../data/models/login_request_body.dart';
import '../../data/repos/login_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController loginPhoneController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  Widget icon = const Icon(Icons.remove_red_eye_outlined);
  bool hidePassword = false;
  String? fullPhoneNumberValue;
  bool isLoginDone = false;

  void disposeControllers() {
    loginPhoneController.clear();
    loginPasswordController.clear();
  }

  void login() async {
    emit(LoginLoadingState());
    LoginRequestBody requestBody = LoginRequestBody(
      password: loginPasswordController.text,
      phone: fullPhoneNumberValue,
    );
    final response = await _loginRepo.login(requestBody);
    response.fold(
      (error) => emit(LoginErrorState(error)),
      (loginResponse) {
        emit(LoginSuccessState(loginResponse));
        isLoginDone = true;
      },
    );
    disposeControllers();
  }

  void changePasswordVisibility() {
    hidePassword = !hidePassword;
    icon = hidePassword
        ? const Icon(Icons.visibility_off_outlined)
        : const Icon(Icons.visibility_outlined);
    emit(ChangePasswordVisibility());
  }
}
