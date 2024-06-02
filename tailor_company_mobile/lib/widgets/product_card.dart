import 'package:flutter/cupertino.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/widgets/product_image_container.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int quantity;
  final String size;
  const ProductCard({
    required this.imageUrl,
    required this.name,
    required this.quantity,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      width: 176,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 2),
              blurRadius: 4,
              color: ColorConstants.black.withOpacity(0.08),
            )
          ]),
      child: Row(
        children: [
          ProductImageContainer(url: imageUrl),
          const SizedBox(
            width: 6,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.primary,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "No: $quantity",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.secondary,
                  ),
                ),
                Text(
                  "Size: $size",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.secondary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
