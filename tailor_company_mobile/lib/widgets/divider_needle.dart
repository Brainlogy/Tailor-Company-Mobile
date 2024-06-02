import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';

class DividerNeedle extends StatelessWidget {
  const DividerNeedle({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.dividerNeedle,
      width: 230,
      alignment: Alignment.center,
    );
  }
}
