import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CalcButton extends StatelessWidget {
  final String route;
  final String asset;
  final String title;

  const CalcButton({
    super.key,
    required this.route,
    required this.asset,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(8.0),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          ColorFiltered(
            colorFilter: kGrayscaleColorFilter,
            child: Image.asset(asset),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            textScaler: const TextScaler.linear(0.9),
          ),
        ],
      ),
    );
  }
}
