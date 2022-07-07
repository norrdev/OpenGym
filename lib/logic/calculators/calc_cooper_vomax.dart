import 'package:flutter/material.dart';
import 'package:npng/logic/calculators/calc.dart';
import 'package:npng/generated/l10n.dart';

double cooperVoMax({required double distanse}) => (distanse - 504.9) / 44.73;

bool inRange(int x, int a, int b) {
  if (x >= a && x <= b) {
    return true;
  } else {
    return false;
  }
}

String cooperRun(
    {required int distanse,
    required Gender gender,
    required int age,
    required bool isAthlete,
    required BuildContext context}) {
  if (isAthlete) {
    if (gender == Gender.male) {
      if (distanse > 3700) {
        return S.of(context).cooperExcellent;
      } else if (inRange(distanse, 3400, 3700)) {
        return S.of(context).cooperGood;
      } else if (inRange(distanse, 3100, 3399)) {
        return S.of(context).cooperAverage;
      } else if (inRange(distanse, 2800, 3099)) {
        return S.of(context).cooperBad;
      } else if (distanse < 2800) {
        return S.of(context).cooperTerrible;
      }
    } else {
      if (distanse > 3000) {
        return S.of(context).cooperExcellent;
      } else if (inRange(distanse, 2700, 3000)) {
        return S.of(context).cooperGood;
      } else if (inRange(distanse, 2400, 2699)) {
        return S.of(context).cooperAverage;
      } else if (inRange(distanse, 2100, 2399)) {
        return S.of(context).cooperBad;
      } else if (distanse < 2100) {
        return S.of(context).cooperTerrible;
      }
    }
  } else {
    if (gender == Gender.male) {
      if (inRange(age, 13, 14)) {
        if (distanse > 2700) {
          return S.of(context).cooperExcellent;
        } else if (inRange(distanse, 2400, 2700)) {
          return S.of(context).cooperGood;
        } else if (inRange(distanse, 2200, 2399)) {
          return S.of(context).cooperAverage;
        } else if (inRange(distanse, 2100, 2199)) {
          return S.of(context).cooperBad;
        } else if (distanse < 2100) {
          return S.of(context).cooperTerrible;
        }
      } else if (inRange(age, 15, 16)) {
        if (distanse > 2800) {
          return S.of(context).cooperExcellent;
        } else if (inRange(distanse, 2500, 2800)) {
          return S.of(context).cooperGood;
        } else if (inRange(distanse, 2300, 2499)) {
          return S.of(context).cooperAverage;
        } else if (inRange(distanse, 2200, 2299)) {
          return S.of(context).cooperBad;
        } else if (distanse < 2200) {
          return S.of(context).cooperTerrible;
        }
      } else if (inRange(age, 17, 19)) {
        if (distanse > 3000) {
          return S.of(context).cooperExcellent;
        } else if (inRange(distanse, 2700, 3000)) {
          return S.of(context).cooperGood;
        } else if (inRange(distanse, 2500, 2699)) {
          return S.of(context).cooperAverage;
        } else if (inRange(distanse, 2300, 2499)) {
          return S.of(context).cooperBad;
        } else if (distanse < 2300) {
          return S.of(context).cooperTerrible;
        }
      } else if (inRange(age, 20, 29)) {
        if (distanse > 2800) {
          return S.of(context).cooperExcellent;
        } else if (inRange(distanse, 2400, 2800)) {
          return S.of(context).cooperGood;
        } else if (inRange(distanse, 2200, 2399)) {
          return S.of(context).cooperAverage;
        } else if (inRange(distanse, 1600, 2199)) {
          return S.of(context).cooperBad;
        } else if (distanse < 1600) {
          return S.of(context).cooperTerrible;
        }
      } else if (inRange(age, 30, 39)) {
        if (distanse > 2700) {
          return S.of(context).cooperExcellent;
        } else if (inRange(distanse, 2300, 2700)) {
          return S.of(context).cooperGood;
        } else if (inRange(distanse, 1900, 2299)) {
          return S.of(context).cooperAverage;
        } else if (inRange(distanse, 1500, 1899)) {
          return S.of(context).cooperBad;
        } else if (distanse < 1500) {
          return S.of(context).cooperTerrible;
        }
      } else if (inRange(age, 40, 49)) {
        if (distanse > 2500) {
          return S.of(context).cooperExcellent;
        } else if (inRange(distanse, 2100, 2500)) {
          return S.of(context).cooperGood;
        } else if (inRange(distanse, 1700, 2099)) {
          return S.of(context).cooperAverage;
        } else if (inRange(distanse, 1400, 1699)) {
          return S.of(context).cooperBad;
        } else if (distanse < 1400) {
          return S.of(context).cooperTerrible;
        }
      } else if (age > 50) {
        if (distanse > 2400) {
          return S.of(context).cooperExcellent;
        } else if (inRange(distanse, 2000, 2400)) {
          return S.of(context).cooperGood;
        } else if (inRange(distanse, 1600, 1999)) {
          return S.of(context).cooperAverage;
        } else if (inRange(distanse, 1300, 1599)) {
          return S.of(context).cooperBad;
        } else if (distanse < 1300) {
          return S.of(context).cooperTerrible;
        }
      }
      // Gender if
    } else {
      if (inRange(age, 13, 14)) {
        if (distanse > 2000) {
          return S.of(context).cooperExcellent;
        } else if (inRange(distanse, 1900, 2000)) {
          return S.of(context).cooperGood;
        } else if (inRange(distanse, 1600, 1899)) {
          return S.of(context).cooperAverage;
        } else if (inRange(distanse, 1500, 1599)) {
          return S.of(context).cooperBad;
        } else if (distanse < 1500) {
          return S.of(context).cooperTerrible;
        }
      } else if (inRange(age, 15, 16)) {
        if (distanse > 2100) {
          return S.of(context).cooperExcellent;
        } else if (inRange(distanse, 2000, 2100)) {
          return S.of(context).cooperGood;
        } else if (inRange(distanse, 1700, 1999)) {
          return S.of(context).cooperAverage;
        } else if (inRange(distanse, 1600, 1699)) {
          return S.of(context).cooperBad;
        } else if (distanse < 1600) {
          return S.of(context).cooperTerrible;
        }
      } else if (inRange(age, 17, 19)) {
        if (distanse > 2300) {
          return S.of(context).cooperExcellent;
        } else if (inRange(distanse, 2100, 2300)) {
          return S.of(context).cooperGood;
        } else if (inRange(distanse, 1800, 2099)) {
          return S.of(context).cooperAverage;
        } else if (inRange(distanse, 1700, 1799)) {
          return S.of(context).cooperBad;
        } else if (distanse < 1700) {
          return S.of(context).cooperTerrible;
        }
      } else if (inRange(age, 20, 29)) {
        if (distanse > 2700) {
          return S.of(context).cooperExcellent;
        } else if (inRange(distanse, 2200, 2700)) {
          return S.of(context).cooperGood;
        } else if (inRange(distanse, 1800, 2199)) {
          return S.of(context).cooperAverage;
        } else if (inRange(distanse, 1500, 1799)) {
          return S.of(context).cooperBad;
        } else if (distanse < 1500) {
          return S.of(context).cooperTerrible;
        }
      } else if (inRange(age, 30, 39)) {
        if (distanse > 2500) {
          return S.of(context).cooperExcellent;
        } else if (inRange(distanse, 2000, 2500)) {
          return S.of(context).cooperGood;
        } else if (inRange(distanse, 1700, 1999)) {
          return S.of(context).cooperAverage;
        } else if (inRange(distanse, 1400, 1699)) {
          return S.of(context).cooperBad;
        } else if (distanse < 1400) {
          return S.of(context).cooperTerrible;
        }
      } else if (inRange(age, 40, 49)) {
        if (distanse > 2300) {
          return S.of(context).cooperExcellent;
        } else if (inRange(distanse, 1900, 2300)) {
          return S.of(context).cooperGood;
        } else if (inRange(distanse, 1500, 1899)) {
          return S.of(context).cooperAverage;
        } else if (inRange(distanse, 1200, 1499)) {
          return S.of(context).cooperBad;
        } else if (distanse < 1200) {
          return S.of(context).cooperTerrible;
        }
      } else if (age > 50) {
        if (distanse > 2200) {
          return S.of(context).cooperExcellent;
        } else if (inRange(distanse, 1700, 2200)) {
          return S.of(context).cooperGood;
        } else if (inRange(distanse, 1400, 1699)) {
          return S.of(context).cooperAverage;
        } else if (inRange(distanse, 1100, 1399)) {
          return S.of(context).cooperBad;
        } else if (distanse < 1100) {
          return S.of(context).cooperTerrible;
        }
      }
    }
  }
  return '';
}
