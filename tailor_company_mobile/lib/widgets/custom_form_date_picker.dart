import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/models/Field.dart';

class CustomFormDatePicker extends StatefulWidget {
  final Field field;
  const CustomFormDatePicker({
    required this.field,
    super.key,
  });

  @override
  State<CustomFormDatePicker> createState() => _CustomFormDatePickerState();
}

class _CustomFormDatePickerState extends State<CustomFormDatePicker> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ReactiveDatePicker(
        formControlName: widget.field.name,
        builder: (context, picker, child) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ReactiveTextField(
              formControlName: widget.field.name,
              controller: _controller,
              decoration: InputDecoration(
                labelStyle: const TextStyle(color: ColorConstants.primary),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorConstants.primary, width: 1.5),
                ),
                focusColor: ColorConstants.primary,
                labelText: widget.field.label,
                isDense: true,
                suffixIconConstraints:
                    const BoxConstraints(minWidth: 24, minHeight: 24),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: const Icon(
                      Icons.calendar_month,
                      size: 24,
                      color: ColorConstants.primary,
                    ),
                    onPressed: () => picker.showPicker(),
                  ),
                ),
              ),
              validationMessages: {
                ValidationMessage.required: (_) => "Required",
                'unique': (_) => widget.field.validation!.errorText,
              },
            ),
          );
        },
        firstDate: DateTime.utc(DateTime.now().year - 6),
        lastDate: DateTime.utc(DateTime.now().year + 2));
  }
}
