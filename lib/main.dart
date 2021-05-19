import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Localization
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:npng/config.dart';
import 'package:npng/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'db.dart';
import 'state/set_rest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await SQLite.init();
  await initDataBase();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SetRestProvider()),
      ],
      child: (isApple) ? AppCupertino() : AppMaterial(),
    ),
  );
}

class AppMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).title,
      theme: kMaterialLight,
      darkTheme: kMaterialDark,
      initialRoute: kInitialRoute,
      routes: kAppRoutes,
    );
  }
}

class AppCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).title,
      theme: kCupertinoTheme,
      initialRoute: kInitialRoute,
      routes: kAppRoutes,
    );
  }
}
