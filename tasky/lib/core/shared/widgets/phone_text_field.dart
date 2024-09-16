import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/strings.dart';
import '../../utils/constants/styles.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    super.key,
    required this.phoneController,
    this.validator,
    this.onChanged,
  });

  final TextEditingController phoneController;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  String _selectedCountryCode = '20', _selectedCountryFlag = 'eg';

  void _updatePhoneNumber(String phoneNumber) {
    final fullPhoneNumber = '+$_selectedCountryCode$phoneNumber';
    widget.onChanged?.call(fullPhoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.phoneController,
      decoration: InputDecoration(
        label: const Text(AppStrings.phoneNumber),
        prefixIcon: GestureDetector(
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: true,
              onSelect: (country) {
                setState(() {
                  _selectedCountryCode = country.phoneCode;
                  _selectedCountryFlag = country.countryCode;
                  _updatePhoneNumber(widget.phoneController.text);
                });
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CountryFlag.fromCountryCode(
                    shape: RoundedRectangle(7.r),
                    height: 24,
                    width: 24,
                    _selectedCountryFlag.toLowerCase()),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '+$_selectedCountryCode',
                  style: Styles.font14GrayRegular
                      .copyWith(fontWeight: FontWeightHelper.bold),
                ),
                Icon(
                  MdiIcons.chevronDown,
                  size: 25,
                  color: AppColors.textDarkGrey,
                ),
              ],
            ),
          ),
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: (phone) {
        if (!_validPhoneNumber('+$_selectedCountryCode${phone!}')) {
          return 'Please enter valid phone number';
        }
        return null;
      },
      onChanged: (value) {
        _updatePhoneNumber(value);
      },
    );
  }
}

bool _validPhoneNumber(String value) {
  debugPrint(value);
  final phoneNumber = PhoneNumber.parse(value);
  final isValid = phoneNumber.isValid(type: PhoneNumberType.mobile);
  debugPrint(isValid.toString());
  return isValid;
}
