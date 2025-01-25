import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/route_constants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/screens/order_status_screen.dart';
import 'package:tailor_company_mobile/widgets/item_info_container.dart';
import 'package:tailor_company_mobile/widgets/order_button.dart';
import 'package:tailor_company_mobile/widgets/product_image_container.dart';

class OrderOverviewCard extends StatefulWidget {
  final OrderDetails details;
  const OrderOverviewCard({
    required this.details,
    super.key,
  });

  @override
  State<OrderOverviewCard> createState() => _OrderOverviewCardState();
}

class _OrderOverviewCardState extends State<OrderOverviewCard> {
  bool showMore = false;

  List<ValuePair> getData() {
    return [
      ValuePair(
        key: StringConstants.noOfItems,
        value: widget.details.noOfItems.toString(),
      ),
      if (showMore)
        ValuePair(
          key: StringConstants.size,
          value: widget.details.size.join(', '),
        ),
      if (showMore)
        ValuePair(
          key: StringConstants.orderID,
          value: widget.details.orderID.toString(),
        ),
      if (showMore)
        ValuePair(
          key: StringConstants.client,
          value: widget.details.client,
        ),
      ValuePair(
        key: StringConstants.orderData,
        value: DateFormat('dd-MM-yyyy').format(widget.details.orderDate),
      ),
      if (showMore)
        ValuePair(
          key: StringConstants.acceptOrderBy,
          value: DateFormat('dd-MM-yyyy').format(widget.details.acceptOrderBy),
        ),
      if (showMore)
        ValuePair(
          key: StringConstants.expectedDelivery,
          value:
              DateFormat('dd-MM-yyyy').format(widget.details.expectedDilivery),
        ),
      ValuePair(
        key: StringConstants.price,
        value: "₹${widget.details.totalPrice.toString()}",
      ),
    ];
  }

  void handleToggle() => setState(
        () {
          showMore = !showMore;
        },
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageContainer(
                url: widget.details.imageUrl,
                height: 64,
              ),
              const SizedBox(
                width: 16,
              ),
              SizedBox(
                width: 275,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.details.itemName,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.primary),
                    ),
                    ...getData().map(
                      (e) => ItemInfoContainer(
                        label: e.key,
                        value: e.value,
                        widthRatio: 0.35,
                        color: e.key == StringConstants.price
                            ? ColorConstants.koeksister
                            : null,
                      ),
                    ),
                    if (showMore)
                      const SizedBox(
                        height: 8,
                      ),
                    if (showMore)
                      Row(
                        children: [
                          OrderButton(
                            title: StringConstants.moreDetails,
                            onTap: () => Navigator.of(context).pushNamed(
                              RouteConstants.postOrderRequestScreen,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          OrderButton(
                            title: StringConstants.accept,
                            theme: OrderButtonTheme.dark,
                            onTap: () => Navigator.of(context).pushNamed(
                              RouteConstants.orderStatusScreen,
                              arguments: OrderStatus.accepted,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: handleToggle,
            child: Image.asset(
              showMore ? AppAssets.arrowUpIOS : AppAssets.arrowDownIOS,
              height: 16,
              width: 16,
            ),
          )
        ],
      ),
    );
  }
}

class OrderDetails {
  final int noOfItems;
  final String itemName;
  final String imageUrl;
  final List<String> size;
  final int orderID;
  final String client;
  final DateTime orderDate;
  final DateTime acceptOrderBy;
  final DateTime expectedDilivery;
  final double totalPrice;
  final List<Order> orders;

  const OrderDetails({
    required this.noOfItems,
    required this.itemName,
    required this.imageUrl,
    required this.size,
    required this.orderID,
    required this.client,
    required this.orderDate,
    required this.acceptOrderBy,
    required this.expectedDilivery,
    required this.totalPrice,
    required this.orders,
  });
}

class Order {
  final String imageUrl;
  final String itemName;
  final int productId;
  final String size;
  final int price;

  const Order({
    required this.imageUrl,
    required this.itemName,
    required this.productId,
    required this.size,
    required this.price,
  });
}

class ValuePair {
  final String key;
  final String value;

  const ValuePair({
    required this.key,
    required this.value,
  });
}
