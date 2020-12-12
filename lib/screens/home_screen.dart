import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/about_screen.dart';
import 'package:npng/screens/timer/train_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:io' show Platform;

class HomeScreen extends StatelessWidget {
  static String id = '/';

  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  /// Preparing data for "About" page
  // ignore: todo
  /// TODO: Change to FutureBuilder
  void getAboutPage(BuildContext context) async {
    Locale myLocale = Localizations.localeOf(context);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //String appName = packageInfo.appName;
    //String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    //String buildNumber = packageInfo.buildNumber;

    String about = await _loadAsset("assets/texts/$myLocale/about.md");
    about = about.replaceAll('%version%', version);
    String history = await _loadAsset("CHANGELOG.md");
    Navigator.push(
      context,
      mpPageRoute(
        builder: (context) {
          return AboutScreen(
            about: about,
            history: history,
            version: version,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).title),
        button: MpLinkButton(
          label: S.of(context).about,
          onPressed: () {
            // Navigator.pushNamed(context, AboutPage.id);
            getAboutPage(context);
          },
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              MpButton(
                label: 'Таймер',
                onPressed: () {
                  Navigator.pushNamed(context, TrainScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.list),
          TabItem(icon: Icons.calendar_today),
          TabItem(icon: Icons.assessment),
        ],
        initialActiveIndex: 1 /*optional*/,
        //TODO: Make settings provider.
        backgroundColor: (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
            ? CupertinoTheme.of(context).barBackgroundColor
            : Theme.of(context).bottomAppBarColor,
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}
