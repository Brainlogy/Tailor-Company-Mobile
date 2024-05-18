import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/forms/login_form_constants.dart';
import 'package:tailor_company_mobile/constants/route_constants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/widgets/action_button.dart';
import 'package:tailor_company_mobile/widgets/auth_button.dart';
import 'package:tailor_company_mobile/widgets/bottom_sheet_container.dart';
import 'package:tailor_company_mobile/widgets/custom_form.dart';
import 'package:tailor_company_mobile/widgets/plain_scaffold.dart';

enum UserType { buyer, vendor }

enum LoginType { apple, google, mail }

enum FormType { signIn, signUp }

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  UserType? userType;

  void setUserType(UserType type) {
    setState(() {
      userType = type;
    });
  }

  void authenticationBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return BottomSheetContainer(
            height: 0.45,
            child: Column(
              children: [
                const Text(
                  StringConstants.signUp,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: ColorConstants.primary,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                AuthButton(
                  onClick: () => log("aplle login"),
                  icon: AppAssets.appleIcon,
                  label: StringConstants.continueApple,
                ),
                AuthButton(
                  onClick: () => log("google login"),
                  icon: AppAssets.googleIcon,
                  label: StringConstants.continueGoogle,
                ),
                AuthButton(
                  onClick: () {
                    Navigator.pop(context);
                    signBottomSheet(FormType.signUp);
                  },
                  icon: AppAssets.mailIcon,
                  label: StringConstants.continueEmail,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      StringConstants.alreadyHaveAccount,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: ColorConstants.secondary,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        signBottomSheet(FormType.signIn);
                      },
                      child: const Text(
                        StringConstants.logIn,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: ColorConstants.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
      },
    );
  }

  void signBottomSheet(FormType formType) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return BottomSheetContainer(
            height: formType == FormType.signUp ? 0.65 : 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  formType == FormType.signUp
                      ? StringConstants.signUpSave
                      : StringConstants.signIn,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: ColorConstants.primary,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomForm(
                  fields: formType == FormType.signUp ? signUpForm : signInForm,
                  buttonText: formType == FormType.signUp
                      ? StringConstants.signUp
                      : StringConstants.signIn,
                  onSubmit: () {
                    Navigator.pop(context);
                    Navigator.of(context)
                        .pushNamed(RouteConstants.welcomeScreen);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                if (formType == FormType.signUp)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        StringConstants.alreadyHaveAccount,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: ColorConstants.secondary,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          signBottomSheet(FormType.signIn);
                        },
                        child: const Text(
                          StringConstants.logIn,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorConstants.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  )
              ],
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return PlainScaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 82, right: 82, top: 170),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppAssets.tailorCompany),
            const SizedBox(
              height: 80,
            ),
            const Text(
              StringConstants.elevateYourWardrobe,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: ColorConstants.black,
              ),
            ),
            SizedBox(
              height: userType != null ? 4 : 104,
            ),
            Text(
              userType != null
                  ? StringConstants.fashionMeets
                  : StringConstants.start,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: ColorConstants.secondary,
              ),
            ),
            Text(
              userType != null
                  ? StringConstants.meetsConvience
                  : StringConstants.exploringAs,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: ColorConstants.secondary,
              ),
            ),
            SizedBox(
              height: userType != null ? 80 : 16,
            ),
            ActionButton(
              width: width,
              label: userType != null
                  ? StringConstants.letsGetStarted
                  : StringConstants.buyer,
              theme: ActionButtonTheme.dark,
              onClick: () => userType != null
                  ? authenticationBottomSheet()
                  : setUserType(UserType.buyer),
            ),
            const SizedBox(
              height: 16,
            ),
            ActionButton(
              width: width,
              label: userType != null
                  ? StringConstants.accountAlreadyExists
                  : StringConstants.vendor,
              onClick: () => userType != null
                  ? signBottomSheet(FormType.signIn)
                  : setUserType(UserType.vendor),
            ),
          ],
        ),
      ),
      // to be changed ====> furure

      actionButton: userType != null
          ? Container(
              width: width * 0.9,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                  text: const TextSpan(
                      text: StringConstants.bytContinuing,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: ColorConstants.secondary),
                      children: [
                    TextSpan(
                        text: StringConstants.termsOfService,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: ColorConstants.black)),
                    TextSpan(
                        text: StringConstants.and,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: ColorConstants.secondary)),
                    TextSpan(
                        text: StringConstants.privacyPolicy,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: ColorConstants.black)),
                  ])),
            )
          : null,
    );
  }
}
