import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';

class ProductImageContainer extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit fit;
  const ProductImageContainer({
    required this.url,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Image.asset(
        url,
        filterQuality: FilterQuality.high,
        fit: fit,
        width: width,
        height: height,
        errorBuilder: (context, error, stackTrace) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              AppAssets.noImage,
              filterQuality: FilterQuality.high,
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
