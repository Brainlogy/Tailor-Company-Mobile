import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';

class BottomSheetContainer extends StatelessWidget {
  final Widget child;
  final double height;
  const BottomSheetContainer(
      {required this.child, this.height = 0.5, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * height +
            MediaQuery.of(context).viewInsets.bottom,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 37,
        ),
        decoration: const BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: child,
      ),
    );
  }
}
