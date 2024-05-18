import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:tailor_company_mobile/constants/app_assets.dart';
import 'package:tailor_company_mobile/constants/color_contants.dart';
import 'package:tailor_company_mobile/models/Field.dart';

class CustomFormTextField extends StatefulWidget {
  final Field field;
  final AbstractControl<Object?>? fieldControl;
  final void Function()? onChnage;
  const CustomFormTextField({
    required this.field,
    required this.fieldControl,
    this.onChnage,
    super.key,
  });

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  final _controller = TextEditingController();
  bool hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 88,
        child: ReactiveTextField(
          formControlName: widget.field.name,
          controller: _controller,
          obscureText: widget.field.isPassword ? !hidePassword : false,
          decoration: InputDecoration(
              labelStyle: const TextStyle(color: ColorConstants.primary),
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorConstants.primary, width: 1.5)),
              focusColor: ColorConstants.primary,
              labelText: widget.field.label,
              isDense: true,
              suffixIconConstraints:
                  const BoxConstraints(minWidth: 24, minHeight: 24),
              suffixIcon: widget.field.isClearable || widget.field.isPassword
                  ? GestureDetector(
                      onTap: () {
                        if (widget.field.isClearable) {
                          widget.fieldControl?.value = '';
                        } else if (widget.field.isPassword) {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset(
                          widget.field.isPassword
                              ? AppAssets.passwordIcon
                              : AppAssets.clearIcon,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    )
                  : null),
          validationMessages: {
            ValidationMessage.required: (_) => "Required",
            'unique': (_) => widget.field.validation!.errorText,
          },
        )
        // FormBuilderTextField(
        //   name: widget.field.name,
        //   controller: _controller,
        //   obscureText: widget.field.isPassword ? !hidePassword : false,
        //   decoration: InputDecoration(
        //     labelStyle: const TextStyle(color: ColorConstants.primary),
        //     border: const OutlineInputBorder(),
        //     focusedBorder: const OutlineInputBorder(
        //         borderSide:
        //             BorderSide(color: ColorConstants.primary, width: 1.5)),
        //     focusColor: ColorConstants.primary,
        //     labelText: widget.field.label,
        //     isDense: true,
        //     suffixIconConstraints:
        //         const BoxConstraints(minWidth: 24, minHeight: 24),
        //     suffixIcon: widget.field.isClearable || widget.field.isPassword
        //         ? GestureDetector(
        //             onTap: () {
        //               if (widget.field.isClearable) {
        //                 _controller.text = '';
        //               } else if (widget.field.isPassword) {
        //                 setState(() {
        //                   hidePassword = !hidePassword;
        //                 });
        //               }
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.only(right: 10),
        //               child: Image.asset(
        //                 widget.field.isPassword
        //                     ? AppAssets.passwordIcon
        //                     : AppAssets.clearIcon,
        //                 width: 24,
        //                 height: 24,
        //               ),
        //             ),
        //           )
        //         : null,
        //     // errorText: '',
        //     // errorText: "Field is",
        //   ),
        //   validator: (value) {
        //     if (value == null || value == '') {
        //       return "Field is Required";
        //     }
        //     return null;
        //   },
        // ),
        );
  }
}
