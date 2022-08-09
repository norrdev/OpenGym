import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../../widgets/calc_button.dart';

class CalcMainScreen extends StatelessWidget {
  const CalcMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        maxCrossAxisExtent: 200.0,
        children: <Widget>[
          CalcButton(
            route: '/bmi',
            title: S.of(context).bmiPageTitle,
            asset: 'assets/icons/icons8-bmi-96.png',
          ),
          CalcButton(
            route: '/absi',
            asset: 'assets/icons/icons8-dead-man-in-a-coffin-96.png',
            title: S.of(context).absiPageTitle,
          ),
          CalcButton(
            route: '/bfp',
            asset: 'assets/icons/icons8-fat-man-cry-96.png',
            title: S.of(context).bfpPageTitle,
          ),
          CalcButton(
            route: '/rfm',
            asset: 'assets/icons/icons8-sumo-96.png',
            title: S.of(context).rfmPageTitle,
          ),
        ],
      ),
    );
  }
}
