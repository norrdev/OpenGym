import 'dart:io' show Platform;

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'data/sqlite/sqlite_repository.dart';
import 'generated/l10n.dart';
import 'logic/providers/app_providers.dart';
import 'presentation/routes/route_map.dart';

// final bool isApple = !kIsWeb && (Platform.isMacOS || Platform.isIOS);
// bool get isMobileDevice => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
// bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
// bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;

final bool isDesktopDevice =
    !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final repository = SqliteRepository();
  await repository.init();
  late int defaultProgram;

  // Get default program.
  defaultProgram = await repository.getCurrentProgramId();

  runApp(
    ProviderScope(
      overrides: [
        repositoryProvider.overrideWithValue(repository),
        defaultProgramInitialProvider.overrideWithValue(defaultProgram),
      ],
      child: const Application(),
    ),
  );
}

class Application extends ConsumerWidget {
  const Application({super.key});
  static final _defaultLightColorScheme = ColorScheme.fromSwatch();
  static final _defaultDarkColorScheme =
      ColorScheme.fromSwatch(brightness: Brightness.dark);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        //locale: const Locale('ru', 'RU'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateTitle: (BuildContext context) => S.of(context).title,
        theme: ThemeData(
          colorScheme: lightColorScheme ?? _defaultLightColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        initialRoute: kInitialRoute,
        routes: appRoutes,
      );
    });
  }
}
