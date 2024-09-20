import 'package:flutter/material.dart';
import 'package:tasky/core/utils/helpers/extension_helper.dart';
import '../../core/shared/widgets/art_image.dart';
import 'widgets/welcome_footer.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ArtImage().zoomIn(null),
          const WelcomeFooter(),
        ],
      ),
    );
  }
}
