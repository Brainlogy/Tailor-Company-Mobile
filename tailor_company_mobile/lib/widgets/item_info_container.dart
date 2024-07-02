import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';

class ItemInfoContainer extends StatelessWidget {
  final String label;
  final String value;
  final Color? keyColor;
  final Color? valueColor;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? widthRatio;
  const ItemInfoContainer({
    required this.label,
    required this.value,
    this.keyColor,
    this.valueColor,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.widthRatio,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * (widthRatio ?? 0.35),
            child: Text(
              label,
              style: TextStyle(
                fontSize: fontSize ?? 12,
                fontWeight: fontWeight ?? FontWeight.w400,
                color: color ?? (keyColor ?? ColorConstants.secondary),
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: fontSize ?? 12,
              fontWeight: fontWeight ?? FontWeight.w400,
              color: color ?? (valueColor ?? ColorConstants.secondary),
            ),
          )
        ],
      ),
    );
  }
}
