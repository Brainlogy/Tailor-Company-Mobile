import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/widgets/item_info_container.dart';
import 'package:tailor_company_mobile/widgets/order_overview_card.dart';
import 'package:tailor_company_mobile/widgets/product_image_container.dart';

class OrderInfoContainer extends StatelessWidget {
  final Order order;
  final int currentIndex;

  const OrderInfoContainer({
    required this.order,
    required this.currentIndex,
    super.key,
  });

  List<ValuePair> getProductData(Order order) {
    return [
      ValuePair(
        key: StringConstants.productId,
        value: order.productId.toString(),
      ),
      ValuePair(
        key: StringConstants.size,
        value: order.size,
      ),
      ValuePair(
        key: StringConstants.price,
        value: order.price.toString(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "#${currentIndex + 1}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorConstants.koeksister,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ProductImageContainer(
            url: order.imageUrl,
            height: 103,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            order.itemName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ColorConstants.primary,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          ...getProductData(order).map(
            (e) => ItemInfoContainer(
              label: e.key,
              value: e.value,
              fontSize: 14,
              widthRatio: 0.27,
              keyColor: ColorConstants.secondary,
              valueColor: ColorConstants.primary,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            height: 1,
            color: ColorConstants.paleMuse,
          ),
        ],
      ),
    );
  }
}
