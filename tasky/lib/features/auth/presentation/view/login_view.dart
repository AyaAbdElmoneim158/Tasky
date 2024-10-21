import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/full_scroll_screen_container.dart';
import 'widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FullScrollScreenContainer(
      child: LoginBody(),
    );
  }
}
