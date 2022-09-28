import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class SpinEditInt extends StatelessWidget {
  const SpinEditInt({
    super.key,
    required this.initialValue,
    required this.onChange,
    this.label,
  });

  final int initialValue;
  final String? label;

  final void Function(num)? onChange;

  @override
  Widget build(BuildContext context) {
    return NumberInputWithIncrementDecrement(
      key: key,
      widgetContainerDecoration: const BoxDecoration(),
      numberFieldDecoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      incIconDecoration: const BoxDecoration(),
      decIconDecoration: const BoxDecoration(),
      incIcon: Icons.arrow_forward_ios_rounded,
      incIconSize: 32,
      decIcon: Icons.arrow_back_ios_rounded,
      decIconSize: 32,
      initialValue: initialValue,
      min: 1,
      controller: TextEditingController(),
      buttonArrangement: ButtonArrangement.incRightDecLeft,
      onChanged: onChange,
      onDecrement: onChange,
      onIncrement: onChange,
    );
  }
}

class SpinEditDouble extends StatelessWidget {
  const SpinEditDouble({
    super.key,
    required this.initialValue,
    required this.onChange,
    this.label,
  });

  final double initialValue;
  final String? label;

  final void Function(num)? onChange;

  @override
  Widget build(BuildContext context) {
    return NumberInputWithIncrementDecrement(
      key: key,
      widgetContainerDecoration: const BoxDecoration(),
      numberFieldDecoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      incIconDecoration: const BoxDecoration(),
      decIconDecoration: const BoxDecoration(),
      incIcon: Icons.arrow_forward_ios_rounded,
      incIconSize: 32,
      decIcon: Icons.arrow_back_ios_rounded,
      decIconSize: 32,
      initialValue: initialValue,
      isInt: false,
      min: 1,
      controller: TextEditingController(),
      buttonArrangement: ButtonArrangement.incRightDecLeft,
      onChanged: onChange,
      onDecrement: onChange,
      onIncrement: onChange,
    );
  }
}
