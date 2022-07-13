import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:npng/generated/l10n.dart';

class CalculatorBmi {
  final double weightAthlete;
  final double heightAthleteCm;
  final BuildContext? context;

  CalculatorBmi({
    required this.weightAthlete,
    required this.heightAthleteCm,
    this.context,
  });

  double bmi() => weightAthlete / pow((heightAthleteCm / 100), 2);

  String bmiInterpretation() {
    double bmi = this.bmi();
    String result = '';
    if (bmi < 15) {
      result = S.of(context!).bmi15;
    } else if (bmi >= 15 && bmi < 16) {
      result = S.of(context!).bmi15_16;
    } else if (bmi >= 16 && bmi < 18.5) {
      result = S.of(context!).bmi16_18;
    } else if (bmi >= 18.5 && bmi < 25) {
      result = S.of(context!).bmi18_25;
    } else if ((bmi >= 25) && (bmi < 30.0)) {
      result = S.of(context!).bmi25_30;
    } else if (bmi >= 30 && bmi < 35.0) {
      result = S.of(context!).bmi30_35;
    } else if (bmi >= 35 && bmi < 40.0) {
      result = S.of(context!).bmi35_40;
    } else if (bmi >= 40) {
      result = S.of(context!).bmi40;
    }
    return result;
  }
}
