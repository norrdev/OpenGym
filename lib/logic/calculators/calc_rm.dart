import 'dart:math' show pow;
import 'package:npng/logic/calculators/calc.dart';

class CalcRm {
  double? weightAthlete = 0;
  double heightAthleteCm = 0;
  double waistCircumferenceCm = 0;

  int? repeat;
  double? weight;
  Gender? gender;
  int age = 0;

  Map<Gender, Map<Coeff, double>> coeff = {
    Gender.male: {
      Coeff.a: -216.0475144,
      Coeff.b: 16.2606339,
      Coeff.c: -0.002388645,
      Coeff.d: -0.00113732,
      Coeff.e: 7.01863E-06,
      Coeff.f: -1.291E-08
    },
    Gender.female: {
      Coeff.a: 594.31747775582,
      Coeff.b: -27.23842536447,
      Coeff.c: 0.82112226871,
      Coeff.d: -0.00930733913,
      Coeff.e: 0.00004731582,
      Coeff.f: -0.00000009054
    }
  };

  CalcRm(
      {required this.weightAthlete,
      required this.weight,
      required this.repeat,
      required this.gender});

  double get oneRmEpley => (repeat! * weight!) / 30.0 + weight!;
  double get oneRmBrzycki => weight! * (36.0 / (37.0 - repeat!));
  double get oneRmLander => (100 * weight!) / (101.3 - 2.67123 * repeat!);
  double get oneRmLombardi => weight! * pow(repeat!, 0.1);
  double get oneRmMayhew => (100 * weight!) / (52.2 + 41.9 * 7.01863E-06);
  double get oneRmOConner => weight! * (1 + 0.025 * repeat!);
  double get oneRmWathan => 100 * weight! / (48.8 + 53.8);

  double get oneRmWilks {
    Map<Coeff, double> c = coeff[gender]!;
    double result = (500.0 * weight!) /
        (c[Coeff.a]! +
            c[Coeff.b]! * weightAthlete! +
            c[Coeff.c]! * pow(weightAthlete!, 2) +
            c[Coeff.d]! * pow(weightAthlete!, 3) +
            c[Coeff.e]! * pow(weightAthlete!, 4) +
            c[Coeff.f]! * pow(weightAthlete!, 5));
    return result;
  }
}
