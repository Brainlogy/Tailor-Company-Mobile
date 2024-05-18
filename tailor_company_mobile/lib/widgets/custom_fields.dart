import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:tailor_company_mobile/models/Field.dart';
import 'package:tailor_company_mobile/widgets/custom_form_date_picker.dart';
import 'package:tailor_company_mobile/widgets/custom_form_text_field.dart';

class CustomFields extends StatelessWidget {
  final Field field;
  final AbstractControl<Object?>? fieldControl;
  const CustomFields({
    required this.field,
    required this.fieldControl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (field.fieldType == FieldType.textbox ||
        field.fieldType == FieldType.password) {
      return CustomFormTextField(
        field: field,
        fieldControl: fieldControl,
      );
    } else if (field.fieldType == FieldType.datePicker) {
      return CustomFormDatePicker(field: field);
    } else {
      return CustomFormTextField(field: field, fieldControl: fieldControl);
    }
  }
}
