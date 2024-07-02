import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/route_constants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/screens/order_status_screen.dart';
import 'package:tailor_company_mobile/widgets/action_button.dart';
import 'package:tailor_company_mobile/widgets/custom_scaffold.dart';
import 'package:tailor_company_mobile/widgets/item_info_container.dart';
import 'package:tailor_company_mobile/widgets/order_info_container.dart';
import 'package:tailor_company_mobile/widgets/order_overview_card.dart';

final orderDummy = OrderDetails(
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
  orders: [
    const Order(
      imageUrl: AppAssets.designerImage,
      itemName: "Denim Jacket",
      productId: 123444,
      size: "M",
      price: 1000,
    ),
    const Order(
      imageUrl: AppAssets.designerImage,
      itemName: "DMX Jeans",
      productId: 123446,
      size: "M",
      price: 3000,
    )
  ],
);

class PostOrderRequestScreen extends StatelessWidget {
  final OrderStatus? orderStatus;
  const PostOrderRequestScreen({
    this.orderStatus,
    super.key,
  });

  List<ValuePair> getData() {
    return [
      ValuePair(
        key: StringConstants.noOfItems,
        value: orderDummy.noOfItems.toString(),
      ),
      ValuePair(
        key: StringConstants.size,
        value: orderDummy.size.join(', '),
      ),
      ValuePair(
        key: StringConstants.orderID,
        value: orderDummy.orderID.toString(),
      ),
      ValuePair(
        key: StringConstants.client,
        value: orderDummy.client,
      ),
      ValuePair(
        key: StringConstants.orderData,
        value: DateFormat('dd-MM-yyyy').format(orderDummy.orderDate),
      ),
      ValuePair(
        key: StringConstants.acceptOrderBy,
        value: DateFormat('dd-MM-yyyy').format(orderDummy.acceptOrderBy),
      ),
      ValuePair(
        key: StringConstants.expectedDelivery,
        value: DateFormat('dd-MM-yyyy').format(orderDummy.expectedDilivery),
      ),
      ValuePair(
        key: StringConstants.price,
        value: "₹${orderDummy.totalPrice.toString()}",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppbar: true,
      title: StringConstants.ordersAccepted,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              if (orderStatus != null)
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  decoration: BoxDecoration(
                    color: orderStatus == OrderStatus.accepted
                        ? ColorConstants.primaryDim
                        : ColorConstants.pastelPink,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        orderStatus == OrderStatus.accepted
                            ? StringConstants.orderAcceptedSuccessfully
                            : StringConstants.theOrderRejected,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${orderStatus == OrderStatus.accepted ? StringConstants.acceptedOn : StringConstants.rejectedOn} : ${DateFormat('hh:mm a, dd-MM-yyyy').format(DateTime.now())}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorConstants.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...getData().map(
                      (e) => ItemInfoContainer(
                        label: e.key,
                        value: e.value,
                        widthRatio: 0.4,
                        keyColor: ColorConstants.secondary,
                        valueColor: ColorConstants.primary,
                        fontSize: 14,
                        color: e.key == StringConstants.price
                            ? ColorConstants.koeksister
                            : null,
                        fontWeight: e.key == StringConstants.price
                            ? FontWeight.w500
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Divider(
                      height: 1,
                      color: ColorConstants.paleMuse,
                    ),
                    ...orderDummy.orders.map(
                      (e) => OrderInfoContainer(
                        order: e,
                        currentIndex: orderDummy.orders.indexOf(e),
                      ),
                    ),
                    if (orderStatus == null)
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 16),
                        child: ActionButton(
                          label: StringConstants.acceptAll,
                          theme: ActionButtonTheme.dark,
                          width: MediaQuery.of(context).size.width * 0.8,
                          onClick: () => Navigator.of(context).pushNamed(
                            RouteConstants.orderStatusScreen,
                            arguments: OrderStatus.accepted,
                          ),
                        ),
                      ),
                    if (orderStatus == null)
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 16),
                        child: ActionButton(
                          label: StringConstants.rejectAll,
                          width: MediaQuery.of(context).size.width * 0.8,
                          onClick: () => Navigator.of(context).pushNamed(
                            RouteConstants.orderRequestScreen,
                            arguments: OrderStatus.rejected,
                          ),
                        ),
                      ),
                    if (orderStatus != null)
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 16),
                        child: ActionButton(
                          label: StringConstants.viewMoreRequests,
                          theme: ActionButtonTheme.dark,
                          width: MediaQuery.of(context).size.width * 0.8,
                          onClick: () => Navigator.of(context)
                              .pushNamed(RouteConstants.orderRequestScreen),
                        ),
                      ),
                    if (orderStatus == OrderStatus.accepted)
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        alignment: Alignment.center,
                        child: ActionButton(
                          label: StringConstants.downloadOrderInvoice,
                          width: MediaQuery.of(context).size.width * 0.8,
                          onClick: () {},
                        ),
                      ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
