import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/route_constants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/widgets/action_button.dart';
import 'package:tailor_company_mobile/widgets/plain_scaffold.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.height;
    return PlainScaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 43, right: 43, top: 165),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppAssets.welcomeImg),
          const SizedBox(
            height: 111,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 43),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConstants.welcome,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: ColorConstants.black,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  StringConstants.letUsKnow,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: ColorConstants.secondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 109,
          ),
          ActionButton(
            width: width,
            label: StringConstants.cont,
            theme: ActionButtonTheme.dark,
            onClick: () =>
                Navigator.of(context).pushNamed(RouteConstants.registerScreen),
          )
        ],
      ),
    ));
  }
}
