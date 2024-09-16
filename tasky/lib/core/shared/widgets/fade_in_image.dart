import 'package:flutter/material.dart';

import '../../utils/constants/images.dart';

class AppFadeInImage extends StatelessWidget {
  const AppFadeInImage({
    super.key,
    required this.image,
    this.width,
    this.height,
  });
  final String image;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      width: width,
      height: height,
      placeholder: AppAssets.loading,
      image: image,
      fit: BoxFit.contain,
    );
  }
}
