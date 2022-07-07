import 'package:flutter/material.dart';
import 'package:npng/generated/l10n.dart';

///  MacCallum fomula of body proportions
Map<String, double> mcCallum(
    {required double wristCm, required BuildContext context}) {
  final double grud = wristCm * 6.5;
  final Map<String, double> res = {
    S.of(context).mcChest: grud,
    S.of(context).mcButt: grud / 100.0 * 85.0,
    S.of(context).mcWaist: grud / 100.0 * 70.0,
    S.of(context).mcThigh: grud / 100.0 * 53.0,
    S.of(context).mcNeck: grud / 100.0 * 37.0,
    S.of(context).mcBicep: grud / 100.0 * 36.0,
    S.of(context).mcCalf: grud / 100.0 * 34.0,
    S.of(context).mcForearm: grud / 100.0 * 29.0,
  };
  return res;
}
