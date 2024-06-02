import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';

class ProductContainer extends StatelessWidget {
  final String soldProduct;
  final String totalEarned;

  const ProductContainer({
    required this.soldProduct,
    required this.totalEarned,
    super.key,
  });

  Widget _buildProductItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorConstants.blueGem,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w400,
            color: ColorConstants.primary,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: ColorConstants.primaryDim,
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProductItem(StringConstants.soldProduct, soldProduct),
            const VerticalDivider(
              color: ColorConstants.lavenderSavor,
              width: 10,
              thickness: 1,
            ),
            _buildProductItem(StringConstants.totalEarned, "\$$totalEarned"),
          ],
        ),
      ),
    );
  }
}
