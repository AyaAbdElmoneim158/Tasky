import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/full_scroll_screen_container.dart';
import 'widgets/welcome_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FullScrollScreenContainer(
      hasHight: true,
      child: WelcomeBody(),
    );
  }
}
