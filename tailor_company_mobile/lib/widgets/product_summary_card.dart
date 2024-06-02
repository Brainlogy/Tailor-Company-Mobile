import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/widgets/product_image_container.dart';

class ProductSummaryCard extends StatelessWidget {
  final String url;
  final String productName;
  final int orderId;
  final String reachedClientData;
  const ProductSummaryCard({
    required this.url,
    required this.productName,
    required this.orderId,
    required this.reachedClientData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: ColorConstants.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 64,
                    child: ProductImageContainer(url: url),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Denim Jacket",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.primary,
                        ),
                      ),
                      Text(
                        "${StringConstants.orderID} : $orderId",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorConstants.secondary,
                        ),
                      ),
                      Text(
                        "${StringConstants.reachedClient} $reachedClientData",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ColorConstants.secondary,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              IconButton(
                icon: Image.asset(AppAssets.arrowForward),
                onPressed: () {},
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
