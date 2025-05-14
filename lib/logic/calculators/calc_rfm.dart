import 'package:npng/logic/calculators/calc.dart';

/// RFM
/// https://www.nature.com/articles/s41598-018-29362-1
/// https://en.wikipedia.org/wiki/Body_fat_percentage#Typical_body_fat_amounts
double calcRFM(
    {required double heightAthleteCm,
    required Sex gender,
    required double waistCircumferenceCm}) {
  double res = 0;
  switch (gender) {
    case Sex.female:
      res = 76.0 -
          (20.0 * ((heightAthleteCm / 100.0) / (waistCircumferenceCm / 100.0)));
      break;
    case Sex.male:
      res = 64.0 -
          (20.0 * ((heightAthleteCm / 100.0) / (waistCircumferenceCm / 100.0)));
      break;
  }
  return res;
}
