// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kw_store/core/utils/constant.dart';

class CustomCachedNetworkImageWidget extends StatelessWidget {
  const CustomCachedNetworkImageWidget({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.imageBuilder,
  }) : super(key: key);
  final String imageUrl;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final double? height;
  final double? width;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      cacheKey: imageUrl,
      key: key,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      filterQuality: FilterQuality.none,
      colorBlendMode: BlendMode.clear,
      fadeInDuration: const Duration(
        milliseconds: AppConstant.kDefaultAnimationDuration,
      ),
      fadeOutDuration: const Duration(
        milliseconds: AppConstant.kDefaultAnimationDuration,
      ),
      useOldImageOnUrlChange: true,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      errorWidget: (context, url, error) {
        return const Center(
          child: Icon(
            Icons.error,
            color: Colors.red,
          ),
        );
      },
      imageBuilder: (context, imageProvider) {
        return imageBuilder != null
            ? imageBuilder!(context, imageProvider)
            : Image(
                image: imageProvider,
                fit: fit ?? BoxFit.cover,
                filterQuality: FilterQuality.none,
                colorBlendMode: BlendMode.clear,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  );
                },
              );
      },
    );
  }
}
