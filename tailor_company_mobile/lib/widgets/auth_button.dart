import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';

class AuthButton extends StatelessWidget {
  final void Function() onClick;
  final String? icon;
  final String label;
  const AuthButton({
    required this.onClick,
    this.icon,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: ColorConstants.mamba, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Image.asset(
                icon as String,
                height: 20,
                width: 20,
              ),
            if (icon != null)
              const SizedBox(
                width: 8,
              ),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: ColorConstants.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
