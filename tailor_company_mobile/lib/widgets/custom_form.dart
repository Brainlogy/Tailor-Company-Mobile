import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:tailor_company_mobile/models/Field.dart';
import 'package:tailor_company_mobile/widgets/action_button.dart';
import 'package:tailor_company_mobile/widgets/custom_fields.dart';

class CustomForm extends StatefulWidget {
  final List<Field> fields;
  final String buttonText;
  final void Function() onSubmit;
  const CustomForm({
    required this.fields,
    required this.buttonText,
    required this.onSubmit,
    super.key,
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic>? _validateFormInput(
      AbstractControl<dynamic> control, Validation? validation) {
    if (validation == null) {
      return null;
    }
    RegExp regExp = RegExp(validation.validator);
    if (!regExp.hasMatch(control.value ?? "")) {
      return {'unique': true};
    }
    return null;
  }

  FormGroup buildForm() {
    Map<String, AbstractControl> initValidation = {};
    widget.fields.forEach((field) {
      if (field.fieldType == FieldType.textbox ||
          field.fieldType == FieldType.password) {
        initValidation = {
          ...initValidation,
          field.name: FormControl<String>(validators: [
            if (field.isMandatory == true) Validators.required,
            Validators.delegate(
                (control) => _validateFormInput(control, field.validation))
          ])
        };
      } else if (field.fieldType == FieldType.datePicker) {
        initValidation = {
          ...initValidation,
          field.name: FormControl<String>(validators: [
            if (field.isMandatory) Validators.required,
            Validators.delegate(
                (control) => _validateFormInput(control, field.validation))
          ])
        };
      }
    });
    return FormGroup({...initValidation});
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
        form: buildForm,
        key: formKey,
        builder: (context, formGroup, child) {
          return Column(
            children: [
              ...widget.fields
                  .map((e) => CustomFields(
                        field: e,
                        fieldControl: formGroup.controls[e.name],
                      ))
                  .toList(),
              const SizedBox(
                height: 20,
              ),
              ReactiveFormConsumer(builder: (context, formGroup, child) {
                return ActionButton(
                  label: widget.buttonText,
                  onClick: () {
                    formGroup.markAllAsTouched();
                    if (formGroup.valid) {
                      widget.onSubmit();
                    }
                  },
                  isDisabled: !formGroup.valid,
                  theme: ActionButtonTheme.dark,
                  width: double.infinity,
                );
              })
            ],
          );
        });
  }
}
