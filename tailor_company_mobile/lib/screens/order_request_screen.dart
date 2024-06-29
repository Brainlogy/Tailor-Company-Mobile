import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/widgets/custom_scaffold.dart';
import 'package:tailor_company_mobile/widgets/order_overview_card.dart';
import 'package:tailor_company_mobile/widgets/product_status.dart';

final dummy = [
  OrderDetails(
    noOfItems: 1,
    itemName: "Denim Jacket",
    imageUrl: AppAssets.designerImage,
    size: ["M", "L"],
    orderID: 1233444,
    client: "Kowtham",
    orderDate: DateTime.now(),
    acceptOrderBy: DateTime.now(),
    expectedDilivery: DateTime.now(),
    totalPrice: 4000,
  ),
  OrderDetails(
    noOfItems: 2,
    itemName: "Denim Jacket",
    imageUrl: AppAssets.designerImage,
    size: ["S", "M", "L"],
    orderID: 1233447,
    client: "Naveen",
    orderDate: DateTime.now(),
    acceptOrderBy: DateTime.now(),
    expectedDilivery: DateTime.now(),
    totalPrice: 6000,
  ),
];

class OrderRequestScreen extends StatefulWidget {
  const OrderRequestScreen({super.key});

  @override
  State<OrderRequestScreen> createState() => _OrderRequestScreenState();
}

class _OrderRequestScreenState extends State<OrderRequestScreen> {
  Status productStatus = Status.newOrder;

  void onStatusChange(Status status) {
    setState(() {
      productStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppbar: true,
      title: StringConstants.orderRequests,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ProductStatus(
                status: productStatus,
                onStatusChange: onStatusChange,
              ),
              const SizedBox(
                height: 24,
              ),
              ...dummy.map((e) => Column(
                    children: [
                      OrderOverviewCard(details: e),
                      const Divider(
                        height: 1,
                        color: ColorConstants.paleMuse,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
