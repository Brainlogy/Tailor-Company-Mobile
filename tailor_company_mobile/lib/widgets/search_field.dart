import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/constants/string_constants.dart';

class SearchField extends StatelessWidget {
  final Function(String value) onChanged;
  const SearchField({
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 16,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        hintText: StringConstants.searchOrders,
        hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ColorConstants.quicksilver),
        isDense: true,
        contentPadding: EdgeInsets.only(left: 16, top: 4, bottom: 4),
        filled: true,
        fillColor: ColorConstants.modestViolet,
      ),
      onChanged: onChanged,
    );
  }
}
