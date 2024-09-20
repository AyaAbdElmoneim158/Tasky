import '../../../../../core/shared/widgets/phone_text_field.dart';
import '../../../../../core/utils/helpers/validator_helper.dart';
import '../../view_model/login_cubit.dart';

PhoneTextField buildLoginPhoneTextField(LoginCubit loginCubit) {
  return PhoneTextField(
    phoneController: loginCubit.loginPhoneController,
    validator: (value) => AppValidator.validatePhoneNumber(value),
    onChanged: (value) => loginCubit.fullPhoneNumberValue = value,
  );
}
