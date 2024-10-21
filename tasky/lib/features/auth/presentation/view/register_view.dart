import 'package:flutter/material.dart';
import '../../../../../core/shared/widgets/full_scroll_screen_container.dart';
import 'widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FullScrollScreenContainer(
      child: RegisterBody(),
    );
  }
}
