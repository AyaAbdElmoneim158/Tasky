import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/login_request_body.dart';
import '../../data/models/login_response.dart';
import '../../data/models/refresh_token_response.dart';
import '../../data/models/sign_up_response.dart';
import '../../data/models/sign_up_response_body.dart';
import '../../data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  AuthCubit(this._authRepo) : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  /// Login ---------------------------------------------------------------
  void login({String? password, String? phone}) async {
    emit(AuthLoadingState());
    debugPrint("AuthLoadingState: login ");
    LoginRequestBody requestBody = LoginRequestBody(password: password, phone: phone);
    final response = await _authRepo.login(requestBody);
    response.fold(
      (error) {
        emit(AuthErrorState(error));
        debugPrint("AuthErrorState: login ");
      },
      (loginResponse) {
        emit(AuthSuccessState(loginResponse: loginResponse));
        debugPrint("AuthSuccessState: login ");
      },
    );
  }

  /// Register ---------------------------------------------------------------
  void register({
    String? password,
    String? phone,
    String? address,
    String? displayName,
    String? experienceYears,
    String? level,
  }) async {
    emit(AuthLoadingState());
    SignUpResponseBody requestBody = SignUpResponseBody(
      password: password,
      phone: phone,
      address: address,
      displayName: displayName,
      experienceYears: int.parse(experienceYears!),
      level: level,
    );

    final response = await _authRepo.signUp(requestBody);
    response.fold(
      (error) {
        emit(AuthErrorState(error));
        debugPrint("AuthErrorState: register");
      },
      (registerResponse) {
        emit(AuthSuccessState(registerResponse: registerResponse));
        debugPrint("AuthSuccessState:register");
      },
    );
  }
}
