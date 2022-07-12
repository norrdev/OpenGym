import 'package:flutter/material.dart';
import 'package:npng/generated/l10n.dart';

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
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {
              // Navigator.pushNamed(context, BmiPage.id);
            },
            child: Column(
              children: [
                Image.asset('assets/icons/icons8-bmi-96.png'),
                Text(
                  S.of(context).bmiPageTitle,
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.9,
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {
              //Navigator.pushNamed(context, AbsiPage.id);
            },
            child: Column(
              children: [
                Image.asset('assets/icons/icons8-dead-man-in-a-coffin-96.png'),
                Text(
                  S.of(context).absiPageTitle,
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.9,
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {
              //Navigator.pushNamed(context, BfpPage.id);
            },
            child: Column(
              children: [
                Image.asset('assets/icons/icons8-fat-man-cry-96.png'),
                Text(
                  S.of(context).bfpPageTitle,
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.9,
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {
              //Navigator.pushNamed(context, RfmPage.id);
            },
            child: Column(
              children: [
                Image.asset('assets/icons/icons8-sumo-96.png'),
                Text(
                  S.of(context).rfmPageTitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {
              // Navigator.pushNamed(context, LbmPage.id);
            },
            child: Column(
              children: [
                Image.asset('assets/icons/icons8-thriller-96.png'),
                Text(
                  S.of(context).lbmPageTitle,
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.9,
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {
              //Navigator.pushNamed(context, McCallumPage.id);
            },
            child: Column(
              children: [
                Image.asset('assets/icons/icons8-bodybuilder-96.png'),
                Text(
                  S.of(context).mcPageTitle,
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.9,
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {
              //Navigator.pushNamed(context, McRobertPage.id);
            },
            child: Column(
              children: [
                Image.asset('assets/icons/icons8-torso-96.png'),
                Text(
                  S.of(context).mcrobertPageTitle,
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.9,
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {
              //Navigator.pushNamed(context, RmPage.id);
            },
            child: Column(
              children: [
                Image.asset('assets/icons/icons8-deadlift-96.png'),
                Text(
                  S.of(context).rmPageTitle,
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.9,
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {
              //Navigator.pushNamed(context, IfpPage.id);
            },
            child: Column(
              children: [
                Image.asset('assets/icons/icons8-deadlift-96.png'),
                Text(
                  S.of(context).ifpPageTitle,
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.9,
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {
              //Navigator.pushNamed(context, CooperPage.id);
            },
            child: Column(
              children: [
                Image.asset('assets/icons/icons8-running-96.png'),
                Text(
                  S.of(context).cooperPageTitle,
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.9,
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {
              //Navigator.pushNamed(context, CooperStrongPage.id);
            },
            child: Column(
              children: [
                Image.asset('assets/icons/icons8-pushups-96.png'),
                Text(
                  S.of(context).cooperStrongPageTitle,
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.9,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
