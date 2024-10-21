import 'package:flutter/material.dart';

import '../../utils/constants/device_utility.dart';
import '../../utils/constants/images.dart';

class ArtImage extends StatelessWidget {
  final double? height;

  const ArtImage({
    super.key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background SVG with low opacity
        Image.asset(
          AppAssets.art,
          height: height,
          width: double.infinity,
          fit: TDeviceUtils.isWindows() ? BoxFit.contain : BoxFit.cover,
        ),
        // Foreground image with gradient
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.14, 0.4],
            ),
          ),
        ),
      ],
    );
  }
}
