import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final int maxLines;
  final bool readOnly;
  final String hintText;
  final bool isPasswordField;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLines = 1,
    this.readOnly = false,
    this.isPasswordField = false,
    this.validator,
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
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: (widget.isPasswordField)
            ? IconButton(
                onPressed: _togglePasswordVisibility,
                icon: _icon,
              )
            : null,
      ),
      obscureText: (widget.isPasswordField) ? _hidePassword : false,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
    );
  }
}
