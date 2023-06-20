import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;

  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.validator,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    );
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          enabledBorder: border,
          errorBorder:
              border.copyWith(borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder:
              border.copyWith(borderSide: const BorderSide(color: Colors.red)),
          focusedBorder:
              border.copyWith(borderSide: BorderSide(color: color.primary)),
          isDense: true,
          hintText: hint,
          label: label != null ? Text(label!) : null,
          errorText: errorMessage,
          prefixIcon: const Icon(Icons.account_circle_outlined),
          focusColor: color.primary),
    );
  }
}
