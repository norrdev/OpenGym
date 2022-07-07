import 'dart:math';
import 'package:npng/logic/calculators/calc.dart';

enum Equipment { raw, singlePly }

enum Event { sbd, b }

Map<Gender, Map<Equipment, Map<Event, List<double>>>> parameters = {
  Gender.male: {
    Equipment.raw: {
      Event.sbd: [1199.72839, 1025.18162, 0.009210],
      Event.b: [320.98041, 281.40258, 0.01008]
    },
    Equipment.singlePly: {
      Event.sbd: [1236.25115, 1449.21864, 0.01644],
      Event.b: [381.22073, 733.79378, 0.02398]
    }
  },
  Gender.female: {
    Equipment.raw: {
      Event.sbd: [610.32796, 1045.59282, 0.03048],
      Event.b: [142.40398, 442.52671, 0.04724]
    },
    Equipment.singlePly: {
      Event.sbd: [758.63878, 949.31382, 0.02435],
      Event.b: [221.82209, 357.00377, 0.02937]
    }
  }
};

double dotsPoly(double a, double b, double c, double d, double e, double x) {
  double x2 = x * x, x3 = x2 * x, x4 = x3 * x;
  return 500.0 / (a * x4 + b * x3 + c * x2 + d * x + e);
}

double dotsM(double bodyweight) {
  bodyweight = min(max(bodyweight, 40.0), 210.0);
  return dotsPoly(-0.0000010930, 0.0007391293, -0.1918759221, 24.0900756,
      -307.75076, bodyweight);
}

double dotsW(double bodyweight) {
  bodyweight = min(max(bodyweight, 40.0), 150.0);
  return dotsPoly(-0.0000010706, 0.0005158568, -0.1126655495, 13.6175032,
      -57.96288, bodyweight);
}

/// https://gitlab.com/openpowerlifting/ipf-points-calculator/-/blob/master/index.html
/// return {"dots": dots, "glp": glp}
Map<String, double> calcIFP(
    {required double total,
    required double bodyweight,
    required Gender? gender,
    required Equipment? equipment,
    required Event? event}) {
  double dots =
      total * ((gender == Gender.male) ? dotsM(bodyweight) : dotsW(bodyweight));

  List<double> params = parameters[gender]![equipment]![event]!;
  double denom = params[0] - (params[1] * exp(-1.0 * params[2] * bodyweight));
  double glp = 0;

  if (bodyweight < 35) {
    glp = 0;
  } else {
    glp = (denom == 0) ? 0 : max(0, total * 100.0 / denom);
  }

  return {'dots': dots, 'glp': glp};
}
