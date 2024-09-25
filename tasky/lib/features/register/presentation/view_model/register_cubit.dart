import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_repo.dart';
import '../../data/repo/register_repo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  GlobalKey<FormState> signUpFormKey = GlobalKey();
  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController registerYearExpeController = TextEditingController();
  TextEditingController registerExpeLevelController = TextEditingController();
  TextEditingController registerAddressController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  Widget icon = const Icon(Icons.remove_red_eye_outlined);
  bool hidePassword = false;
  String? fullPhoneNumberValue;
  bool isRegisterDone = false;

  void disposeControllers() {
    registerNameController.clear();
    registerPhoneController.clear();
    registerYearExpeController.clear();
    registerExpeLevelController.clear();
    registerAddressController.clear();
    registerPasswordController.clear();
  }

  void register() async {
    emit(RegisterLoadingState());
    SignUpResponseBody requestBody = SignUpResponseBody(
      password: registerPasswordController.text,
      phone: fullPhoneNumberValue,
      address: registerAddressController.text,
      displayName: registerNameController.text,
      experienceYears: int.parse(registerYearExpeController.text),
      level: registerExpeLevelController.text,
    );
    final response = await _registerRepo.signUp(requestBody);
    response.fold(
      (error) => emit(RegisterErrorState(error)),
      (registerResponse) {
        emit(RegisterSuccessState(registerResponse));
        isRegisterDone = true;
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
