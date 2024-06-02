import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';

class StatusButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final void Function() onTap;
  const StatusButton({
    required this.label,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: isActive
              ? null
              : Border.all(color: ColorConstants.paleMuse, width: 1),
          color: isActive ? ColorConstants.koeksister : ColorConstants.white,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: isActive ? ColorConstants.white : ColorConstants.primary,
          ),
        ),
      ),
    );
  }
}
