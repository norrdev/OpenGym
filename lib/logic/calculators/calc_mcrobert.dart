import 'package:flutter/material.dart';
import 'package:npng/generated/l10n.dart';

///  MacRobert fomula of body proportions.
///  Part, minimum size and maximum size.
Map<String, List<double>> mcRobert(
    {required double heightCm, required BuildContext context}) {
  double delta = heightCm - 157.0;
  if (delta < 0) delta = 0;

  Map<String, List<double>> res = {
    S.of(context).mcChest: [95.0 + 0.75 * delta, 95.0 + 0.75 * delta + 7.0],
    S.of(context).mcWaist: [70.0 + 0.5 * delta, 70.0 + 0.5 * delta],
    S.of(context).mcThigh: [53.0 + 0.33 * delta, 53.0 + 0.33 * delta + 2.5],
    S.of(context).mcNeck: [35.0 + 0.25 * delta, 35.0 + 0.25 * delta + 2.5],
    S.of(context).mcBicep: [35.0 + 0.25 * delta, 35.0 + 0.25 * delta + 2.5],
    S.of(context).mcCalf: [35.0 + 0.25 * delta, 35.0 + 0.25 * delta + 2.5]
  };

  return res;
}
