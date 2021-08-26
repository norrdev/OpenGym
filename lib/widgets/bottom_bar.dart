import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:npng/config.dart';
import 'package:npng/pages/exercises/exercises_page.dart';
import 'package:npng/pages/log/log_start_page.dart';
import 'package:npng/pages/programs/programs_00_page.dart';
import 'package:npng/pages/settings/setings_page.dart';
import 'package:npng/pages/workout/workout_00_start_page.dart';
import 'package:page_transition/page_transition.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key, this.initialActiveIndex}) : super(key: key);

  final int? initialActiveIndex;

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.react,
      items: [
        TabItem(
          icon: Image.asset('assets/icons/icons8-gym-96.png'),
          // title: S.of(context).pageWorkout,
        ),
        TabItem(
          icon: Image.asset('assets/icons/icons8-rules-96.png'),
          // title: S.of(context).pageProgramsTitle
        ),
        TabItem(
          icon: Image.asset('assets/icons/icons8-deadlift-96.png'),
          // title: S.of(context).pageExerciseTitle
        ),
        TabItem(
          icon: Image.asset('assets/icons/icons8-calendar-96.png'),
          // title: S.of(context).log
        ),
        TabItem(
          icon: Image.asset('assets/icons/icons8-settings-96.png'),
          // title: S.of(context).about,
        ),
      ],
      initialActiveIndex: initialActiveIndex,
      onTap: (int i) {
        if (i != initialActiveIndex) {
          switch (i) {
            case 0:
              Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    child: const WorkoutStartPage(),
                    type: PageTransitionType.fade,
                  ),
                  (route) => false);
              break;
            case 1:
              Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    child: const ProgramsPage(),
                    type: PageTransitionType.fade,
                  ),
                  (route) => false);
              break;
            case 2:
              Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    child: const ExercisesPage(),
                    type: PageTransitionType.fade,
                  ),
                  (route) => false);
              break;
            case 3:
              Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    child: const LogStartPage(),
                    type: PageTransitionType.fade,
                  ),
                  (route) => false);
              break;
            case 4:
              Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    child: const SettingsPage(),
                    type: PageTransitionType.fade,
                  ),
                  (route) => false);
              break;

            default:
          }
        }
      },
      color: (isApple)
          ? CupertinoTheme.of(context).primaryColor
          : Theme.of(context).appBarTheme.color,
      activeColor: (isApple)
          ? CupertinoTheme.of(context).primaryColor
          : Theme.of(context).bottomAppBarTheme.color,
      backgroundColor: (isApple)
          ? CupertinoTheme.of(context).barBackgroundColor
          : Theme.of(context).bottomAppBarColor,
    );
  }
}
