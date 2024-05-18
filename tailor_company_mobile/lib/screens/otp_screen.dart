import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/route_constants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/models/Field.dart';
import 'package:tailor_company_mobile/widgets/action_button.dart';
import 'package:tailor_company_mobile/widgets/custom_text_field.dart';
import 'package:tailor_company_mobile/widgets/otp_text_field.dart';
import 'package:tailor_company_mobile/widgets/plain_scaffold.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool isOtpSent = false;
  String? mobileNumber = "";
  String? otp = "";

  void resendOTP() {}

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return PlainScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 163),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.otpImg,
                  width: 240,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  StringConstants.otpVerfication,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: ColorConstants.primary,
                  ),
                ),
                SizedBox(
                  height: isOtpSent ? 18 : 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: isOtpSent
                            ? StringConstants.enterOtp
                            : StringConstants.weWillSendOtp,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: ColorConstants.secondary,
                          ),
                        ),
                        children: [
                          if (isOtpSent)
                            TextSpan(
                                text:
                                    " ${StringConstants.indiaCode}********${mobileNumber?.substring(8, 10)}",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: ColorConstants.primary,
                                  ),
                                ))
                        ]),
                  ),
                ),
                SizedBox(
                  height: isOtpSent ? 49 : 39,
                ),
                isOtpSent
                    ? OTPField(
                        setOtpVal: (val) => setState(() {
                          otp = val;
                        }),
                      )
                    : CustomTextField(
                        prefix: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "+91 - ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: ColorConstants.black),
                          ),
                        ),
                        onChange: (val) => setState(() {
                          mobileNumber = val;
                        }),
                        field: const Field(
                            name: "Mobile Number",
                            label: "Mobile Number",
                            fieldType: FieldType.textbox,
                            dataType: DataType.number),
                      ),
                SizedBox(
                  height: isOtpSent ? 34 : 178,
                ),
                if (isOtpSent)
                  GestureDetector(
                    onTap: resendOTP,
                    child: const Text(
                      StringConstants.resendOTP,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: ColorConstants.secondary),
                    ),
                  ),
                if (isOtpSent)
                  const SizedBox(
                    height: 120,
                  ),
                ActionButton(
                  width: width - 72,
                  label: isOtpSent
                      ? StringConstants.verify
                      : StringConstants.getOtp,
                  isDisabled: isOtpSent
                      ? !(otp != "" && otp?.length == 4)
                      : !(mobileNumber != null &&
                          mobileNumber != "" &&
                          mobileNumber?.length == 10),
                  onClick: () => isOtpSent
                      ? Navigator.of(context)
                          .pushNamed(RouteConstants.otpVerfiedScreen)
                      : setState(() {
                          if (mobileNumber != null && mobileNumber != "") {
                            isOtpSent = true;
                          }
                        }),
                  theme: ActionButtonTheme.dark,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
