import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/bottom_bar.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flash/flash.dart';
import 'package:npng/db.dart';
import 'about_page.dart';
import 'package:file_picker/file_picker.dart';

class SettingsPage extends StatelessWidget {
  static String id = '/settings';
  late String version;

  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  void _getVer() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //String appName = packageInfo.appName;
    //String packageName = packageInfo.packageName;
    version = packageInfo.version;
    //String buildNumber = packageInfo.buildNumber;
  }

  /// Preparing data for "About" page
  void _getAboutPage(BuildContext context) async {
    Locale myLocale = Localizations.localeOf(context);
    String about = await _loadAsset("assets/texts/$myLocale/about.md");
    about = about.replaceAll('%version%', version);
    String history = await _loadAsset("CHANGELOG.md");

    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: AboutPage(
          about: about,
          history: history,
          version: version,
        ),
      ),
    );

    // Navigator.pushAndRemoveUntil(
    //     context,
    //     PageTransition(
    //       child: AboutPage(
    //         about: about,
    //         history: history,
    //         version: version,
    //       ),
    //       type: PageTransitionType.fade,
    //     ),
    //     (route) => false);
  }

  void _share() {
    shareDataBase();
  }

  void _backup(BuildContext context) async {
    String name = await backupDataBase();
    _showBasicsFlash(
      duration: Duration(seconds: 3),
      context: context,
      message: 'Backup completed in $name.',
      //child: Text('Basics | Duration'),
    );
  }

  void _restore(BuildContext context) {}

  void _importFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['db'],
    );

    if (result != null) {
      importDataBase(result.files.single.path!);
      _showBasicsFlash(
        duration: Duration(seconds: 3),
        context: context,
        message: 'DB importedfrom ${result.files.single.path!}.',
      );
    } else {
      // User canceled the picker
    }
  }

  void _showBasicsFlash({
    Duration? duration,
    required BuildContext context,
    String? message,
    flashStyle = FlashBehavior.floating,
  }) {
    showFlash(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return Flash(
          controller: controller,
          behavior: flashStyle,
          position: FlashPosition.bottom,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Text(message ?? ''),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _getVer();

    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).settings),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16.0, right: 8.0),
          constraints: BoxConstraints.expand(),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MpLinkButton(
                label: 'Share database',
                onPressed: () => _share(),
              ),
              MpLinkButton(
                label: 'Backup database',
                onPressed: () => _backup(context),
              ),
              MpLinkButton(
                label: 'Restore database',
                onPressed: () => _restore(context),
              ),
              MpLinkButton(
                label: 'Import database',
                onPressed: () => _importFile(context),
              ),
              Divider(),
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
      ),
      bottomNavigationBar: BottomBar(initialActiveIndex: 4),
    );
  }
}
