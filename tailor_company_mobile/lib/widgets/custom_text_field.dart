import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/models/Field.dart';

class CustomTextField extends StatelessWidget {
  final Field field;
  final Widget? prefix;
  final void Function(String?) onChange;
  const CustomTextField({
    required this.field,
    this.prefix,
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelStyle: const TextStyle(color: ColorConstants.primary),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorConstants.primary, width: 1.5)),
          focusColor: ColorConstants.primary,
          labelText: field.label,
          isDense: true,
          prefixIconConstraints:
              const BoxConstraints(minWidth: 24, minHeight: 24),
          prefixIcon: prefix),
      onChanged: onChange,
      keyboardType:
          field.dataType == DataType.number ? TextInputType.number : null,
    );
  }
}
