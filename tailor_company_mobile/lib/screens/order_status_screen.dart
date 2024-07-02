import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/route_constants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/widgets/plain_scaffold.dart';

enum OrderStatus { accepted, rejected }

class OrderStatusScreen extends StatefulWidget {
  final OrderStatus orderStatus;
  const OrderStatusScreen({
    required this.orderStatus,
    super.key,
  });

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  late Timer _timer;

  @override
  void initState() {
    handleNavigation();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void handleNavigation() {
    final timer = Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushNamed(
        RouteConstants.postOrderRequestScreen,
        arguments: widget.orderStatus,
      ),
    );
    setState(() {
      _timer = timer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlainScaffold(
      backgroundColor: ColorConstants.primary,
      body: Column(
        children: [
          Container(
            height: 244,
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              color: ColorConstants.white,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(12),
                right: Radius.circular(12),
              ),
            ),
            child: Image.asset(
              AppAssets.orderStatus,
              width: 254,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            widget.orderStatus == OrderStatus.accepted
                ? StringConstants.orderAccepted
                : StringConstants.orderRejected,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: ColorConstants.white,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Lottie.asset(
                widget.orderStatus == OrderStatus.rejected
                    ? AppAssets.orderRejected
                    : AppAssets.orderAccepted,
                height: 160,
                width: 160),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Text(
              textAlign: TextAlign.center,
              widget.orderStatus == OrderStatus.accepted
                  ? StringConstants.orderAcceptedMessage
                  : StringConstants.orderRejectedMessage,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ColorConstants.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
