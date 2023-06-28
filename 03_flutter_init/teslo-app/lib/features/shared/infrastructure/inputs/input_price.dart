import 'package:formz/formz.dart';

// Define input validation errors
enum PriceError { empty, value, format }

// Extend FormzInput and provide the input type and error type.
class Price extends FormzInput<double, PriceError> {
  static final RegExp passwordRegExp = RegExp(
    r'^\d+(\.\d{1,2})?$',
  );
  // Call super.pure to represent an unmodified form input.
  const Price.pure() : super.pure(0.0);

  // Call super.dirty to represent a modified form input.
  const Price.dirty(double value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PriceError.value) return 'Precio: 2 Decimales - Positivo';
    if (displayError == PriceError.format)  return 'Formato de Numero Incorrecto';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PriceError? validator(double value) {
    if (value.toString().isEmpty || value.toString().trim().isEmpty) {
      return PriceError.empty;
    }
    if (value < 0) return PriceError.value;
    final isDouble = double.tryParse(value.toString()) ?? -1;
    if(!passwordRegExp.hasMatch(isDouble.toString())) return PriceError.format;

    return null;
  }
}
