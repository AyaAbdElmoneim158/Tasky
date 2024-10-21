import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/images.dart';
import '../../utils/constants/sizes.dart';
import '../shimmer_effect.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;

  const CachedNetworkImageWidget({
    super.key,
    required this.width,
    required this.height,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
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
        placeholder: (context, url) => _buildPlaceholder(width, height),
        errorWidget: (context, url, error) => _buildErrorWidget(width: width, height: height),
      ),
    );
  }

  Widget _buildPlaceholder(double width, double height) {
    return AppShimmerEffect(width: width, height: height);
  }

  Widget _buildErrorWidget({double? width, double? height, ImageProvider<Object>? image}) {
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
}
