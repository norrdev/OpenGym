import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/route_map.dart';
import 'package:npng/theme_cupertino.dart';

class Application extends StatelessWidget {
  final Repository repository;
  const Application({Key? key, required this.repository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).title,
      theme: cupertinoTheme,
      initialRoute: kInitialRoute,
      routes: appRoutes,
    );
  }
}
