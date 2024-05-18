enum FieldType { textbox, dropdown, password, datePicker }

enum DataType { string, number }

class Field {
  final String name;
  final String label;
  final String? placeHolder;
  final FieldType fieldType;
  final DataType dataType;
  final Validation? validation;
  final String? defaultValue;
  final bool isClearable;
  final bool isPassword;
  final bool isMandatory;

  const Field({
    required this.name,
    required this.label,
    this.placeHolder,
    required this.fieldType,
    this.dataType = DataType.string,
    this.validation,
    this.defaultValue,
    this.isClearable = false,
    this.isPassword = false,
    this.isMandatory = false,
  });
}

class Validation {
  final String validator;
  final String errorText;

  const Validation({
    required this.validator,
    required this.errorText,
  });
}
