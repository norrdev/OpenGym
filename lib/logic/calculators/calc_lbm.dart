import 'package:npng/logic/calculators/calc.dart';

/// LBM Boer
/// https://en.wikipedia.org/wiki/Lean_body_mass
double calcLbmBoer(
    {required double weight, required Sex gender, required double heightCm}) {
  double res = 0;
  switch (gender) {
    case Sex.female:
      res = (0.252 * weight) + (0.473 * heightCm) - 48.3;
      break;
    case Sex.male:
      res = (0.407 * weight) + (0.267 * heightCm) - 19.2;
      break;
  }
  return res;
}

/// LBM Hume
/// https://en.wikipedia.org/wiki/Lean_body_mass
double calcLbmHume(
    {required double weight, required Sex gender, required double heightCm}) {
  double res = 0;
  switch (gender) {
    case Sex.female:
      res = (0.29569 * weight) + (0.41813 * heightCm) - 43.2933;
      break;
    case Sex.male:
      res = (0.32810 * weight) + (0.33929 * heightCm) - 29.5336;
      break;
  }
  return res;
}
