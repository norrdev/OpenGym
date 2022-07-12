import 'package:npng/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'calc.dart';

/// BFP and RFM interpretation
String bodyFat(
    {required double persent,
    required Gender gender,
    required BuildContext context}) {
  String result = '';

  if (gender == Gender.female) {
    if (persent >= 10 && persent < 14) {
      result = S.of(context).bfpEssential;
    } else if (persent >= 14 && persent < 21) {
      result = S.of(context).bfpAthletes;
    } else if (persent >= 21 && persent < 25) {
      result = S.of(context).bfpFitness;
    } else if (persent >= 25 && persent < 32) {
      result = S.of(context).bfpAverage;
    } else if (persent >= 32) {
      result = S.of(context).bfpObese;
    }
  } else {
    if (persent >= 2 && persent < 6) {
      result = S.of(context).bfpEssential;
    } else if (persent >= 6 && persent < 14) {
      result = S.of(context).bfpAthletes;
    } else if (persent >= 14 && persent < 18) {
      result = S.of(context).bfpFitness;
    } else if (persent >= 18 && persent < 25) {
      result = S.of(context).bfpAverage;
    } else if (persent >= 25) {
      result = S.of(context).bfpObese;
    }
  }
  return result;
}
