import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/pages/about_page.dart';
import 'package:npng/pages/timer/train_page.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:npng/widgets/bottom_bar.dart';

class RoutinesPage extends StatelessWidget {
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
          return AboutPage(
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
        title: Text(S.of(context).pageRoutinesTitle),
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
                label: S.of(context).timer,
                onPressed: () {
                  Navigator.pushNamed(context, TrainPage.id);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(initialActiveIndex: 0),
    );
  }
}
