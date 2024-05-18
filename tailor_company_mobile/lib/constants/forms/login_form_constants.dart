import 'package:tailor_company_mobile/models/Field.dart';

const signUpForm = [
  Field(
    name: "FullName",
    label: "Full Name",
    fieldType: FieldType.textbox,
    isClearable: true,
    isMandatory: true,
  ),
  Field(
    name: "Email",
    label: "Email address",
    fieldType: FieldType.textbox,
    isClearable: true,
    isMandatory: true,
  ),
  Field(
    name: "Password",
    label: "Password",
    fieldType: FieldType.password,
    isPassword: true,
    isMandatory: true,
  )
];

const signInForm = [
  Field(
    name: "Email",
    label: "Email address",
    fieldType: FieldType.textbox,
    isClearable: true,
    isMandatory: true,
  ),
  Field(
    name: "Password",
    label: "Password",
    fieldType: FieldType.password,
    isPassword: true,
    isMandatory: true,
  )
];
