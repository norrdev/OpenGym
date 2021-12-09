import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:npng/data/repository.dart';
import 'data/sqlite/sqlite_repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/data/models/workout_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = SqliteRepository();
  await repository.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WorkoutProvider()),
        Provider<Repository>(
          lazy: false,
          create: (_) => repository,
          dispose: (_, Repository repository) => repository.close(),
        ),
      ],
      child: (isApple)
          ? AppCupertino(repository: repository)
          : AppMaterial(repository: repository),
    ),
  );
}

class AppMaterial extends StatelessWidget {
  final Repository repository;
  const AppMaterial({Key? key, required this.repository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
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
  final Repository repository;
  const AppCupertino({Key? key, required this.repository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: (darkModeOn) ? kMaterialDark : kMaterialLight,
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
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
      ),
    );
  }
}
