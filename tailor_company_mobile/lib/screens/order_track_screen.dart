import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/route_constants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/widgets/action_button.dart';
import 'package:tailor_company_mobile/widgets/custom_scaffold.dart';
import 'package:tailor_company_mobile/widgets/order_overview_card.dart';
import 'package:tailor_company_mobile/widgets/product_image_container.dart';
import 'package:tailor_company_mobile/widgets/step_progressive_view.dart';

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
    orders: [],
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
    orders: [],
  ),
];

class OrderTrackScreen extends StatefulWidget {
  const OrderTrackScreen({super.key});

  @override
  State<OrderTrackScreen> createState() => _OrderTrackScreenState();
}

class _OrderTrackScreenState extends State<OrderTrackScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppbar: true,
      title: StringConstants.ordersSummary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reaching ${dummy.isNotEmpty ? DateFormat('MMMd').format(dummy[0].expectedDilivery) : 'N/A'}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: dummy
                    .map(
                      (order) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SizedBox(
                          width: 66,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ProductImageContainer(
                                url: order.imageUrl,
                                width: 40,
                                height: 64,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'ID: ${order.orderID}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstants.secondary,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(
                  color: ColorConstants.paleMuse,
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  StringConstants.orderAccepted,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.primary,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const StepProgressView(
                curStep: 2,
                width: double.infinity,
                color: ColorConstants.islamicGreen,
                titles: [
                  StringConstants.accepted,
                  StringConstants.shipped,
                  StringConstants.delivered,
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(
                  color: ColorConstants.paleMuse,
                ),
              ),
              const Text(
                StringConstants.shippingAddress,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.primary,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const SizedBox(
                width: 250,
                child: Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry - 05000',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.primary,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 24),
                child: Divider(
                  color: ColorConstants.paleMuse,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ActionButton(
                  width: double.infinity,
                  label: StringConstants.viewOrderInfo,
                  onClick: () => Navigator.pushNamed(
                      context, RouteConstants.viewOrdersInfoScreen),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
