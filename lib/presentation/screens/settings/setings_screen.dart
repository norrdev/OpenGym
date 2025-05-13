import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:npng/presentation/widgets/burger_menu.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
    if (context.mounted) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BurgerMenu(),
      appBar: AppBar(title: Text(S.of(context).settings)),
      body: ListView(
        children: [
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
