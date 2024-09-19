import 'package:flutter/material.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import '../../../../core/shared/widgets/art_image.dart';
import 'widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ArtImage().zoomIn(),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
