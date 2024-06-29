import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
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

  void handleToggle() => setState(
        () {
          showMore = !showMore;
        },
      );

  Widget _buildRowContainer(
      {required String key, required String value, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Text(
              key,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color ?? ColorConstants.secondary),
            ),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color ?? ColorConstants.secondary),
          )
        ],
      ),
    );
  }

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
                width: 300,
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
                    _buildRowContainer(
                      key: StringConstants.noOfItems,
                      value: widget.details.noOfItems.toString(),
                    ),
                    if (showMore)
                      _buildRowContainer(
                        key: StringConstants.size,
                        value: widget.details.size.join(', '),
                      ),
                    if (showMore)
                      _buildRowContainer(
                        key: StringConstants.orderID,
                        value: widget.details.orderID.toString(),
                      ),
                    if (showMore)
                      _buildRowContainer(
                        key: StringConstants.client,
                        value: widget.details.client,
                      ),
                    _buildRowContainer(
                      key: StringConstants.orderData,
                      value: DateFormat('dd-MM-yyyy')
                          .format(widget.details.orderDate),
                    ),
                    if (showMore)
                      _buildRowContainer(
                        key: StringConstants.acceptOrderBy,
                        value: DateFormat('dd-MM-yyyy')
                            .format(widget.details.acceptOrderBy),
                      ),
                    if (showMore)
                      _buildRowContainer(
                        key: StringConstants.expectedDelivery,
                        value: DateFormat('dd-MM-yyyy')
                            .format(widget.details.expectedDilivery),
                      ),
                    _buildRowContainer(
                      key: StringConstants.price,
                      value: "₹7,000",
                      color: ColorConstants.koeksister,
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
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          OrderButton(
                            title: StringConstants.accept,
                            theme: OrderButtonTheme.dark,
                            onTap: () {},
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
  });
}
