import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:npng/screens/about_screen.dart';
import 'package:npng/screens/timer/set_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/models/set_rest.dart';
import 'package:npng/generated/l10n.dart';
import 'dart:io' show Platform;

class TrainScreen extends StatelessWidget {
  static String id = '/train';

  const TrainScreen({Key key}) : super(key: key);

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
    TextEditingController tcSets = TextEditingController(
        text: '${Provider.of<SetRestData>(context).sets}');
    TextEditingController tcRest = TextEditingController(
        text: '${Provider.of<SetRestData>(context).rest}');

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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).sets),
            ChangeIntField(
              value: Provider.of<SetRestData>(context).sets,
              decreaseCallback:
                  Provider.of<SetRestData>(context, listen: false).decreaseSets,
              increaseCallback:
                  Provider.of<SetRestData>(context, listen: false).increaseSets,
            ),
            SizedBox(
              height: 40,
            ),
            Text(S.of(context).rest),
            ChangeIntField(
              value: Provider.of<SetRestData>(context).rest,
              decreaseCallback:
                  Provider.of<SetRestData>(context, listen: false).decreaseRest,
              increaseCallback:
                  Provider.of<SetRestData>(context, listen: false).increaseRest,
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MpButton(
                label: S.of(context).start,
                onPressed: () {
                  int sts = 5;
                  int rst = 90;
                  try {
                    sts = int.parse(tcSets.text);
                  } catch (e) {
                    sts = 0;
                  }
                  try {
                    rst = int.parse(tcRest.text);
                  } catch (e) {
                    rst = 90;
                  }
                  Provider.of<SetRestData>(context, listen: false)
                      .changeSets(sts);
                  Provider.of<SetRestData>(context, listen: false)
                      .changeRest(rst);
                  Provider.of<SetRestData>(context, listen: false)
                      .resetCurrentSet();
                  Navigator.pushNamed(context, SetScreen.id);
                },
              ),
            ),
            // Text(
            //     '${Provider.of<SetRestData>(context, listen: false).sets}'),
          ],
        ),
      ),
    );
  }
}

class ChangeIntField extends StatelessWidget {
  final int value;
  final Function increaseCallback;
  final Function decreaseCallback;

  const ChangeIntField({
    Key key,
    this.value,
    this.decreaseCallback,
    this.increaseCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RoundIconButton(
            icon: Icons.arrow_back_ios_rounded,
            fillColor: (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
                ? CupertinoTheme.of(context).barBackgroundColor
                : Theme.of(context).bottomAppBarColor,
            onPressed: decreaseCallback,
          ),
        ),
        SizedBox(
          width: 60.0,
          child: Text(
            value.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: RoundIconButton(
            icon: Icons.arrow_forward_ios_rounded,
            fillColor: (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
                ? CupertinoTheme.of(context).barBackgroundColor
                : Theme.of(context).bottomAppBarColor,
            onPressed: increaseCallback,
          ),
        ),
      ],
    );
  }
}
