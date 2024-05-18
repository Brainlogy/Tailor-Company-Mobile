import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';

enum ActionButtonTheme { light, dark }

class ActionButton extends StatelessWidget {
  final String label;
  final ActionButtonTheme theme;
  final void Function() onClick;
  final bool isDisabled;
  final double width;
  const ActionButton({
    required this.label,
    this.theme = ActionButtonTheme.light,
    required this.onClick,
    this.isDisabled = false,
    this.width = 120,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
            color: isDisabled
                ? ColorConstants.disabled
                : theme == ActionButtonTheme.dark
                    ? ColorConstants.primary
                    : ColorConstants.white,
            border: Border.all(
                color: isDisabled
                    ? ColorConstants.disabled
                    : ColorConstants.primary,
                width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Center(
            child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isDisabled
                ? ColorConstants.disabledText
                : theme == ActionButtonTheme.dark
                    ? ColorConstants.white
                    : ColorConstants.primary,
            fontSize: 14,
          ),
        )),
      ),
    );
  }
}
