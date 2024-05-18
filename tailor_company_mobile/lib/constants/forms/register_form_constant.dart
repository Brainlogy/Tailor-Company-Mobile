import 'package:tailor_company_mobile/models/Field.dart';

const List<Field> registerForm = [
  Field(
    name: "Nationality",
    label: "Nationality",
    fieldType: FieldType.textbox,
    isMandatory: true,
  ),
  Field(
    name: "PinCode",
    label: "Pin Code",
    fieldType: FieldType.textbox,
    dataType: DataType.number,
    isMandatory: true,
  ),
  Field(
    name: "CollegeName",
    label: "College Name",
    fieldType: FieldType.textbox,
    isMandatory: true,
  ),
  Field(
    name: "StudentID",
    label: "Student ID",
    fieldType: FieldType.textbox,
    isMandatory: true,
  ),
  Field(
    name: "DegreePeriod",
    label: "Degree Period (Year)",
    fieldType: FieldType.textbox,
    isMandatory: true,
  ),
];
