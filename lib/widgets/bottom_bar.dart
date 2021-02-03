import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:npng/config.dart';
import 'package:npng/pages/exercises/exercises_page.dart';
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
      onTap: (int i) {
        switch (i) {
          case 0:
            Navigator.pushNamed(context, RoutinesPage.id);
            break;
          case 1:
          case 2:
          case 3:
            Navigator.pushNamed(context, ExercisesPage.id);
            break;
          default:
        }
      },
      color: (isApple)
          ? CupertinoTheme.of(context).primaryColor
          : Theme.of(context).primaryColor,
      activeColor: (isApple)
          ? CupertinoTheme.of(context).primaryColor
          : Theme.of(context).primaryColor,
      backgroundColor: (isApple)
          ? CupertinoTheme.of(context).barBackgroundColor
          : Theme.of(context).backgroundColor,
    );
  }
}
