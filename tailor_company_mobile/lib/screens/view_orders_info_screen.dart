import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/widgets/action_button.dart';
import 'package:tailor_company_mobile/widgets/custom_scaffold.dart';
import 'package:tailor_company_mobile/widgets/item_info_container.dart';
import 'package:tailor_company_mobile/widgets/order_overview_card.dart';
import 'package:tailor_company_mobile/widgets/product_image_container.dart';

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

class ViewOrdersInfoScreen extends StatefulWidget {
  const ViewOrdersInfoScreen({super.key});

  @override
  State<ViewOrdersInfoScreen> createState() => _ViewOrdersInfoScreenState();
}

class _ViewOrdersInfoScreenState extends State<ViewOrdersInfoScreen> {
  final orderInfo = [
    ValuePair(
      key: 'Order date',
      value: DateFormat('dd-MMM-yyyy').format(dummy[0].orderDate),
    ),
    ValuePair(
      key: 'Order ID',
      value: dummy[0].orderID.toString(),
    ),
    ValuePair(
        key: 'Order total',
        value:
            '${NumberFormat.currency(locale: 'en_IN', symbol: 'Rs ', decimalDigits: 0).format(dummy.map((e) => e.totalPrice).reduce((value, element) => value + element))} (${dummy.length} items)'),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppbar: true,
      title: StringConstants.viewOrderInfo,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...orderInfo.map(
                (e) => ItemInfoContainer(
                  label: e.key,
                  value: e.value,
                  widthRatio: 0.3,
                  fontSize: 14,
                  keyColor: ColorConstants.secondary,
                  valueColor: ColorConstants.primary,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(
                  color: ColorConstants.paleMuse,
                ),
              ),
              Text(
                '${StringConstants.totalOrders} ${dummy.length < 10 ? '0' : ''}${dummy.length}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.primary,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ...dummy.map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ProductImageContainer(
                            url: e.imageUrl,
                            width: 41,
                            height: 64,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.itemName,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ColorConstants.primary,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                'No: ${e.noOfItems}  |  Size: ${e.size[0]}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstants.secondary,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Product ID: ${e.orderID}',
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
                      const Divider(
                        color: ColorConstants.paleMuse,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ActionButton(
                    width: double.infinity,
                    label: StringConstants.downloadOrderInvoice,
                    onClick: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
