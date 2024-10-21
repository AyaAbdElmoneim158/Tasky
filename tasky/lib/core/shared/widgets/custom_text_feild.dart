import 'package:flutter/material.dart';
import '../../../../../../core/utils/helpers/validator_helper.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final int maxLines;
  final bool readOnly;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLines = 1,
    this.readOnly = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _hidePassword = true;
  Icon _icon = const Icon(Icons.visibility_off);

  void _togglePasswordVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
      _icon = _hidePassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => AppValidator.validatePassword(value),
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: _togglePasswordVisibility,
          icon: _icon,
        ),
      ),
      obscureText: _hidePassword,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
    );
  }
}
