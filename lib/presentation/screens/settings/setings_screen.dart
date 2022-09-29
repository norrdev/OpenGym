import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npng/presentation/widgets/burger_menu.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';

import 'package:npng/main.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';

import 'about_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static String id = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String version = '';

  @override
  void initState() {
    super.initState();
    _getVer().then((result) => version = result);
  }

  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<String> _getVer() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  /// Preparing data for "About" page.
  void _getAboutPage(BuildContext context) async {
    Locale myLocale = Localizations.localeOf(context);
    String version = await _getVer();
    String about = await _loadAsset('assets/texts/$myLocale/about.md');
    about = about.replaceAll('%version%', version);
    String history = await _loadAsset('CHANGELOG.md');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => AboutScreen(
          about: about,
          history: history,
          version: version,
        ),
      ),
    );
  }

  /// Preparing data for "Share" dialog.
  void _shareFile(BuildContext context) async {
    final repository =
        RepositoryProvider.of<Repository>(context, listen: false);
    String path = await repository.backupDatabase();
    if (path.isNotEmpty) {
      final Size size = MediaQuery.of(context).size;
      await Share.shareFiles(
        [path],
        sharePositionOrigin: Rect.fromLTWH(0, 0, size.width, size.height / 6),
      );
    }
  }

  /// Preparing data for "Save" dialog.
  void _saveFile(BuildContext context) async {
    final Repository repository =
        RepositoryProvider.of<Repository>(context, listen: false);
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
        RepositoryProvider.of<Repository>(context, listen: false);
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result != null) {
      await repository.importDataBase(result.files.single.path!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              '${S.of(context).dbImportedFrom} ${result.files.single.path}.'),
        ),
      );
      Timer(const Duration(seconds: 3), () {
        exit(0);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).nothingSelected),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BurgerMenu(),
      appBar: AppBar(title: Text(S.of(context).settings)),
      body: ListView(
        children: [
          if (isDesktopDevice)
            ListTile(
              title: Text(S.of(context).saveToFile),
              onTap: () => _saveFile(context),
            ),
          ListTile(
            title: Text(S.of(context).share),
            onTap: () => _shareFile(context),
          ),
          ListTile(
            title: Text(S.of(context).import,
                style: const TextStyle(color: Colors.redAccent)),
            subtitle: Text(
              S.of(context).importWarning,
              style: Theme.of(context).textTheme.caption,
            ),
            onTap: () => _importFile(context),
          ),
          const Divider(),
          ListTile(
            title: Text(S.of(context).about),
            onTap: () => _getAboutPage(context),
          ),
          ListTile(
            title: Text(S.of(context).licenses),
            onTap: () => showLicensePage(
                context: context,
                applicationVersion: version,
                applicationLegalese: S.of(context).copyright),
          ),
        ],
      ),
    );
  }
}
