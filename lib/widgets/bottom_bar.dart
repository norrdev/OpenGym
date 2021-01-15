import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:npng/pages/exer%D1%81ises_page.dart';
import 'dart:io' show Platform;
import 'package:npng/generated/l10n.dart';
import 'package:npng/pages/routines_page.dart';

class BottomBar extends StatelessWidget {
  BottomBar({this.initialActiveIndex});

  final int initialActiveIndex;

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.react,
      items: [
        TabItem(icon: Icons.list, title: S.of(context).pageRoutinesTitle),
        TabItem(icon: Icons.calendar_today, title: "Measure"),
        TabItem(icon: Icons.assessment, title: "Stats"),
        TabItem(icon: Icons.ac_unit, title: "Exercises"),
      ],
      initialActiveIndex: this.initialActiveIndex,
      color: CupertinoTheme.of(context).primaryColor,
      activeColor: CupertinoTheme.of(context).primaryColor,
      // ignore: todo
      //TODO: Make settings provider.
      backgroundColor: (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
          ? CupertinoTheme.of(context).barBackgroundColor
          : Theme.of(context).backgroundColor, //appBarTheme.backgroundColor,
      onTap: (int i) {
        switch (i) {
          case 0:
            Navigator.pushNamed(context, RoutinesPage.id);
            break;
          case 3:
            Navigator.pushNamed(context, ExercisesPage.id);
            break;
          default:
        }
      },
    );
  }
}
