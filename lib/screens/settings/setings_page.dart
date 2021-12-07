import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:npng/data/db.dart';
import 'package:share_plus/share_plus.dart';
import 'about_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static String id = '/settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String version = '';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> _isImperial;

  @override
  void initState() {
    super.initState();
    _getVer().then((result) => version = result);
    _isImperial = _prefs.then((SharedPreferences prefs) {
      return (prefs.getBool('isImperial') ?? false);
    });
  }

  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<String> _getVer() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  /// Preparing data for "About" page
  void _getAboutPage(BuildContext context) async {
    Locale myLocale = Localizations.localeOf(context);
    String version = await _getVer();
    String about = await _loadAsset('assets/texts/$myLocale/about.md');
    about = about.replaceAll('%version%', version);
    String history = await _loadAsset('CHANGELOG.md');
    Navigator.push(
      context,
      mpPageRoute(
        builder: (BuildContext context) => AboutPage(
          about: about,
          history: history,
          version: version,
        ),
      ),
    );
  }

  void _share(BuildContext context) async {
    String path = await backupDataBase();
    final Size size = MediaQuery.of(context).size;
    await Share.shareFiles(
      [path],
      text: 'NpNg database.',
      sharePositionOrigin: Rect.fromLTWH(0, 0, size.width, size.height / 6),
    );
  }

  void _importFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      importDataBase(result.files.single.path!);
      mpShowToast('DB imported from ${result.files.single.path}.',
          context: context);
    } else {
      mpShowToast('Nothing selected.', context: context);
    }
  }

  Future<void> _saveImperial(bool isImperial) async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      _isImperial =
          prefs.setBool('isImperial', isImperial).then((bool success) {
        return isImperial;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).settings),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: Implement US metrics
            FutureBuilder<bool>(
              future: _isImperial,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return MpSwitch(
                        title: 'Metric / Imperial (UK, US) - not work',
                        value: false,
                        onChanged: (val) {});
                  default:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return MpSwitch(
                          title: 'Metric / Imperial (UK, US) - not work',
                          value: snapshot.data!,
                          onChanged: _saveImperial);
                    }
                }
              },
            ),
            const Divider(),
            MpLinkButton(
              label: S.of(context).share,
              onPressed: () => _share(context),
            ),
            MpLinkButton(
              label: S.of(context).import,
              onPressed: () => _importFile(context),
            ),
            const Divider(),
            MpLinkButton(
              label: S.of(context).about,
              onPressed: () => _getAboutPage(context),
            ),
            MpLinkButton(
              label: S.of(context).licenses,
              onPressed: () => showLicensePage(
                  context: context,
                  applicationVersion: version,
                  applicationLegalese: '© Denis Filonov'),
            ),
          ],
        ),
      ),
    );
  }
}
