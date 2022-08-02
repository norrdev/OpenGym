import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:npng/constants/numbers.dart';

class TextFormFieldDouble extends StatelessWidget {
  const TextFormFieldDouble({
    super.key,
    required this.tcWeight,
    required this.labelText,
    required this.errorText,
  });

  final TextEditingController tcWeight;
  final String labelText;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: tcWeight,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(kDoubleRegExp)),
      ],
      validator: (value) {
        if (double.tryParse(value!) == null) {
          return errorText;
        }
        return null;
      },
    );
  }
}
