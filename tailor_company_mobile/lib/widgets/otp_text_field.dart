import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';

class OTPTextField extends StatefulWidget {
  final FocusNode focusnode;
  final void Function(FocusNode node, String val) onChange;
  final TextEditingController controller;
  const OTPTextField({
    required this.focusnode,
    required this.onChange,
    required this.controller,
    super.key,
  });

  @override
  State<OTPTextField> createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 56,
      width: 40,
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 600),
      child: TextField(
        focusNode: widget.focusnode,
        controller: widget.controller,
        onChanged: (val) => widget.onChange(widget.focusnode, val),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusColor: ColorConstants.primary,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.primary)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorConstants.primary)),
          isDense: true,
        ),
        autofocus: true,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[0-9]'))],
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class OTPField extends StatefulWidget {
  final void Function(String val) setOtpVal;
  const OTPField({required this.setOtpVal, super.key});

  @override
  State<OTPField> createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  TextEditingController controller1 = TextEditingController(text: "");
  TextEditingController controller2 = TextEditingController(text: "");
  TextEditingController controller3 = TextEditingController(text: "");
  TextEditingController controller4 = TextEditingController(text: "");

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  void changeFocusNode(FocusNode node, String val) {
    if (node != focusNode4 && val != "") {
      node.nextFocus();
    } else if (node != focusNode1 && val == "") {
      node.previousFocus();
    }
    final otpVal = controller1.text +
        controller2.text +
        controller3.text +
        controller4.text;
    widget.setOtpVal(otpVal);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OTPTextField(
          controller: controller1,
          focusnode: focusNode1,
          onChange: changeFocusNode,
        ),
        const SizedBox(
          width: 12,
        ),
        OTPTextField(
          controller: controller2,
          focusnode: focusNode2,
          onChange: changeFocusNode,
        ),
        const SizedBox(
          width: 12,
        ),
        OTPTextField(
          controller: controller3,
          focusnode: focusNode3,
          onChange: changeFocusNode,
        ),
        const SizedBox(
          width: 12,
        ),
        OTPTextField(
          controller: controller4,
          focusnode: focusNode4,
          onChange: changeFocusNode,
        ),
      ],
    );
  }
}
