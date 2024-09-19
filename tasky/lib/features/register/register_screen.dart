import 'package:flutter/material.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import '../../core/shared/widgets/art_image.dart';
import '../../core/utils/helpers/helper_functions.dart';
import 'widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ArtImage(
              height: AppHelperFunctions.screenHeight(context) * 0.3,
            ).zoomIn(),
            const RegisterForm(),
          ],
        ),
      ),
    );
  }
}
