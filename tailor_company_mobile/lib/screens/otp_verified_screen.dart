import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/route_constants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/widgets/action_button.dart';
import 'package:tailor_company_mobile/widgets/plain_scaffold.dart';

class OTPVerifiedScreen extends StatelessWidget {
  const OTPVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return PlainScaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 281),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.otpVerifiedImg,
              width: 240,
            ),
            const SizedBox(
              height: 26,
            ),
            const Text(
              StringConstants.verified,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: ColorConstants.primary,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                StringConstants.numberVerified,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: ColorConstants.secondary,
                ),
              ),
            ),
            const SizedBox(
              height: 153,
            ),
            ActionButton(
              width: width,
              label: StringConstants.completeSetup,
              theme: ActionButtonTheme.dark,
              onClick: () => Navigator.of(context)
                  .pushNamed(RouteConstants.dashboardScreen),
            )
          ],
        ),
      ),
    ));
  }
}
