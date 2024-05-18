import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/route_constants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/widgets/action_button.dart';
import 'package:tailor_company_mobile/widgets/plain_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return PlainScaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 164),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 229,
              child: Image.asset(AppAssets.fashionImg),
            ),
            const SizedBox(
              height: 70,
            ),
            const Text(
              StringConstants.fashionText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorConstants.primary,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ActionButton(
                    width: width * 0.3,
                    label: StringConstants.previous,
                    onClick: () => log("On clicked"),
                  ),
                  ActionButton(
                    width: width * 0.3,
                    label: StringConstants.next,
                    theme: ActionButtonTheme.dark,
                    onClick: () => Navigator.of(context)
                        .pushNamed(RouteConstants.signInScreen),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
