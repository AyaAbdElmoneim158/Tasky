import 'package:flutter/material.dart';

import '../../utils/constants/images.dart';
import '../../utils/helpers/helper_functions.dart';
import 'fade_in_image.dart';

class ArtImage extends StatelessWidget {
  const ArtImage({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AppFadeInImage(
      image: AppAssets.art,
      width: AppHelperFunctions.screenWidth(context),
      height: height ?? AppHelperFunctions.screenHeight(context) * 0.6,
    );
  }
}
