import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/services.dart';
import 'package:npng/config.dart';
import 'package:npng/pages/about_page.dart';
import 'package:npng/pages/exercises/exercises_page.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/pages/routines_page.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';

class BottomBar extends StatelessWidget {
  BottomBar({this.initialActiveIndex});

  final int initialActiveIndex;

  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  /// Preparing data for "About" page
  void _getAboutPage(BuildContext context) async {
    Locale myLocale = Localizations.localeOf(context);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //String appName = packageInfo.appName;
    //String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    //String buildNumber = packageInfo.buildNumber;

    String about = await _loadAsset("assets/texts/$myLocale/about.md");
    about = about.replaceAll('%version%', version);
    String history = await _loadAsset("CHANGELOG.md");
    Navigator.pushAndRemoveUntil(context, mpPageRoute(
      builder: (context) {
        return AboutPage(
          about: about,
          history: history,
          version: version,
        );
      },
    ), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.react,
      items: [
        TabItem(icon: Icons.list, title: S.of(context).pageRoutinesTitle),
        TabItem(icon: Icons.calendar_today, title: "Measure"),
        TabItem(icon: Icons.assessment, title: "Stats"),
        TabItem(icon: Icons.ac_unit, title: S.of(context).pageExerciseTitle),
        TabItem(icon: Icons.help, title: S.of(context).about),
      ],
      initialActiveIndex: this.initialActiveIndex,
      onTap: (int i) {
        if (i != this.initialActiveIndex) {
          switch (i) {
            case 0:
              Navigator.pushNamedAndRemoveUntil(
                  context, RoutinesPage.id, (route) => false);
              break;
            case 1:
            case 2:
            case 3:
              //Navigator.pushNamed(context, ExercisesPage.id);
              Navigator.pushNamedAndRemoveUntil(
                  context, ExercisesPage.id, (route) => false);
              break;
            case 4:
              _getAboutPage(context);
              break;
            default:
          }
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
