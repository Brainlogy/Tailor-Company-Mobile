import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/forms/register_form_constant.dart';
import 'package:tailor_company_mobile/constants/route_constants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';
import 'package:tailor_company_mobile/widgets/custom_form.dart';
import 'package:tailor_company_mobile/widgets/plain_scaffold.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return PlainScaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 86),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                StringConstants.letUsKnowYou,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: ColorConstants.primary,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomForm(
                fields: registerForm,
                buttonText: StringConstants.cont,
                onSubmit: () {
                  Navigator.of(context).pushNamed(RouteConstants.otpScreen);
                },
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
