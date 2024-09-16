import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/images.dart';
import '../../utils/constants/sizes.dart';
import '../shimmer_effect.dart';

ClipRRect buildCachedNetworkImage({
  required double width,
  required double height,
  required String imageUrl,
}) {
  return ClipRRect(
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(AppSizes.borderRadiusLg),
            ),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (context, url) => buildPlaceholder(width, height),
      errorWidget: (context, url, error) =>
          buildErrorWidget(width: width, height: height),
    ),
  );
}

Widget buildPlaceholder(double width, double height) {
  return AppShimmerEffect(width: width, height: height);
}

Widget buildErrorWidget(
    {double? width, double? height, ImageProvider<Object>? image}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: image ?? AssetImage(AppAssets.loading),
        fit: BoxFit.cover,
      ),
    ),
  );
}
