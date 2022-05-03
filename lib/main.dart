import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/route_map.dart';
import 'package:npng/theme_material.dart';
import 'package:provider/provider.dart';

import 'package:npng/data/models/workout_provider.dart';
import 'package:npng/data/repository.dart';

import 'package:npng/data/sqlite/sqlite_repository.dart';

//final bool isApple = !kIsWeb && (Platform.isMacOS || Platform.isIOS);
const bool isApple = false;

// bool get isMobileDevice => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
final bool isDesktopDevice =
    !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
// bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
// bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = SqliteRepository();
  await repository.init();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => WorkoutProvider()),
      Provider<Repository>(
        lazy: false,
        create: (_) => repository,
        dispose: (_, Repository repository) => repository.close(),
      ),
    ], child: Application(repository: repository)),
  );
}

class Application extends StatelessWidget {
  final Repository repository;
  const Application({Key? key, required this.repository}) : super(key: key);
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
      //theme: AppTheme.light,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialRoute: kInitialRoute,
      routes: appRoutes,
    );
  }
}
