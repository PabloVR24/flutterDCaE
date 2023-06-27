import 'package:formz/formz.dart';

// Define input validation errors
enum NameError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Name extends FormzInput<String, NameError> {
  static final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z]{10,50}$',
  );

  // Call super.pure to represent an unmodified form input.
  const Name.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Name.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == NameError.empty) return 'El campo es requerido';
    if (displayError == NameError.format) {
      return 'Nombre Invalido';
    }
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  NameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return NameError.empty;
    if (!emailRegExp.hasMatch(value)) return NameError.format;

    return null;
  }
}