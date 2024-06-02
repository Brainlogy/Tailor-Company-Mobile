import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/widgets/custom_scaffold.dart';
import 'package:tailor_company_mobile/widgets/filter_button.dart';
import 'package:tailor_company_mobile/widgets/product_container.dart';
import 'package:tailor_company_mobile/widgets/product_summary_card.dart';
import 'package:tailor_company_mobile/widgets/search_field.dart';

const dummy = [
  ProductSummary(
      url: AppAssets.designerImage,
      productName: "Denim Jacket",
      orderId: 123444234,
      reachedClientData: "18-03-24"),
  ProductSummary(
      url: AppAssets.designerImage,
      productName: "Denim Jacket",
      orderId: 123444234,
      reachedClientData: "18-03-24"),
  ProductSummary(
      url: AppAssets.designerImage,
      productName: "Denim Jacket",
      orderId: 123444234,
      reachedClientData: "18-03-24"),
  ProductSummary(
      url: AppAssets.designerImage,
      productName: "Denim Jacket",
      orderId: 123444234,
      reachedClientData: "18-03-24")
];

class OredrsSummaryScreen extends StatefulWidget {
  const OredrsSummaryScreen({super.key});

  @override
  State<OredrsSummaryScreen> createState() => _OredrsSummaryScreenState();
}

class _OredrsSummaryScreenState extends State<OredrsSummaryScreen> {
  void _onSearchChange(String value) {}
  void _onFilterChange() {}
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppbar: true,
      title: StringConstants.ordersSummary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      child: SearchField(
                        onChanged: _onSearchChange,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    FilterButton(onTap: _onFilterChange)
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                StringConstants.lastThreeMonths,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.primary,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const ProductContainer(
                soldProduct: "12",
                totalEarned: "20000",
              ),
              const SizedBox(
                height: 16,
              ),
              ...dummy.map(
                (e) => ProductSummaryCard(
                  url: e.url,
                  productName: e.productName,
                  orderId: e.orderId,
                  reachedClientData: e.reachedClientData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductSummary {
  final String url;
  final String productName;
  final int orderId;
  final String reachedClientData;
  const ProductSummary({
    required this.url,
    required this.productName,
    required this.orderId,
    required this.reachedClientData,
  });
}
