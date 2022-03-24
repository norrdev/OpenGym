import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:npng/config.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'about_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static String id = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
        builder: (BuildContext context) => AboutScreen(
          about: about,
          history: history,
          version: version,
        ),
      ),
    );
  }

  void _shareFile(BuildContext context) async {
    final repository = Provider.of<Repository>(context, listen: false);
    String path = await repository.backupDatabase();
    if (path.isNotEmpty) {
      final Size size = MediaQuery.of(context).size;
      await Share.shareFiles(
        [path],
        //text: 'NpNg database.',
        sharePositionOrigin: Rect.fromLTWH(0, 0, size.width, size.height / 6),
      );
    }
  }

  void _saveFile(BuildContext context) async {
    final Repository repository =
        Provider.of<Repository>(context, listen: false);
    String path = await repository.backupDatabase();
    final File file = File(path);
    String? result = await FilePicker.platform.saveFile(
      dialogTitle: S.of(context).save,
      fileName: 'npng-backup-v2.db',
      lockParentWindow: true,
    );
    if (result != null) file.copySync(result);
  }

  void _importFile(BuildContext context) async {
    final Repository repository =
        Provider.of<Repository>(context, listen: false);
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result != null) {
      await repository.importDataBase(result.files.single.path!);
      mpShowToast('DB imported from ${result.files.single.path}.',
          context: context);
      Timer(const Duration(seconds: 3), () {
        exit(0);
      });
    } else {
      mpShowToast('Nothing selected.', context: context);
    }
  }

  // Future<void> _saveImperial(bool isImperial) async {
  //   final SharedPreferences prefs = await _prefs;
  //   setState(() {
  //     _isImperial =
  //         prefs.setBool('isImperial', isImperial).then((bool success) {
  //       return isImperial;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // // Implement US metrics
            // FutureBuilder<bool>(
            //   future: _isImperial,
            //   builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            //     switch (snapshot.connectionState) {
            //       case ConnectionState.waiting:
            //         return MpSwitch(
            //             title: 'Metric / Imperial (UK, US) - not work',
            //             value: false,
            //             onChanged: (val) {});
            //       default:
            //         if (snapshot.hasError) {
            //           return Text('Error: ${snapshot.error}');
            //         } else {
            //           return MpSwitch(
            //               title: 'Metric / Imperial (UK, US) - not work',
            //               value: snapshot.data!,
            //               onChanged: _saveImperial);
            //         }
            //     }
            //   },
            // ),
            // const Divider(),
            if (isDesktopDevice)
              MpLinkButton(
                label: S.of(context).saveToFile,
                onPressed: () => _saveFile(context),
              ),
            MpLinkButton(
              label: S.of(context).share,
              onPressed: () => _shareFile(context),
            ),
            MpLinkButton(
              label: S.of(context).import,
              onPressed: () => _importFile(context),
            ),
            Text(
              S.of(context).importWarning,
              style: Theme.of(context).textTheme.caption,
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
