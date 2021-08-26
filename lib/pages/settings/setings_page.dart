import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/bottom_bar.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:npng/db.dart';
import 'package:share_plus/share_plus.dart';
import 'about_page.dart';
import 'package:file_picker/file_picker.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static String id = '/settings';

  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<String> _getVer() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //String appName = packageInfo.appName;
    //String packageName = packageInfo.packageName;
    return packageInfo.version;
    //String buildNumber = packageInfo.buildNumber;
  }

  /// Preparing data for "About" page
  void _getAboutPage(BuildContext context) async {
    Locale myLocale = Localizations.localeOf(context);
    String version = await _getVer();
    String about = await _loadAsset("assets/texts/$myLocale/about.md");
    about = about.replaceAll('%version%', version);
    String history = await _loadAsset("CHANGELOG.md");
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

  void _share() async {
    String path = await backupDataBase();
    await Share.shareFiles([path], text: 'NpNg database.');
  }

  // void _backup(BuildContext context) async {
  //   String name = await backupDataBase();
  //   _showBasicsFlash(
  //     duration: Duration(seconds: 3),
  //     context: context,
  //     message: 'Backup completed in $name.',
  //   );
  // }

  // void _restore(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     mpPageRoute(
  //       builder: (BuildContext context) => RestoreDbPage(),
  //     ),
  //   );
  // }

  void _importFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['db'],
    );

    if (result != null) {
      importDataBase(result.files.single.path!);
      mpShowToast('DB imported from ${result.files.single.path!}.',
          context: context);
    } else {
      mpShowToast('Nothing selected.', context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).settings),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
          constraints: const BoxConstraints.expand(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MpLinkButton(
              //   label: S.of(context).backup,
              //   onPressed: () => _backup(context),
              // ),
              // MpLinkButton(
              //   label: S.of(context).restore,
              //   onPressed: () => _restore(context),
              // ),
              // Divider(),
              MpLinkButton(
                label: S.of(context).share,
                onPressed: () => _share(),
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
                    //TODO get version
                    //applicationVersion: _getVer(),
                    applicationLegalese: '© Denis Filonov'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(initialActiveIndex: 4),
    );
  }
}