import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';

enum OrderButtonTheme { light, dark }

class OrderButton extends StatelessWidget {
  final String title;
  final OrderButtonTheme theme;
  final void Function() onTap;
  const OrderButton({
    required this.title,
    this.theme = OrderButtonTheme.light,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.33,
        height: 32,
        decoration: BoxDecoration(
          color: theme == OrderButtonTheme.light
              ? ColorConstants.white
              : ColorConstants.primary,
          border: Border.all(
              width: 1,
              color: theme == OrderButtonTheme.light
                  ? ColorConstants.mamba
                  : ColorConstants.primary),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: theme == OrderButtonTheme.light
                  ? ColorConstants.primary
                  : ColorConstants.white,
            ),
          ),
        ),
      ),
    );
  }
}
