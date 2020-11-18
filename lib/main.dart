import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Localization
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:npng/config.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/home_screen.dart';
import 'package:npng/screens/timer/set_screen.dart';
import 'package:npng/screens/timer/timer_screen.dart';
import 'package:npng/screens/timer/train_screen.dart';
import 'package:provider/provider.dart';

import 'models/set_rest.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SetRestData()),
      ],
      child: (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
          ? AppCupertino()
          : AppMaterial(),
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonColor: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      initialRoute: HomeScreen.id,
      routes: appRoutes,
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
      theme: cupertinoTheme(),
      initialRoute: HomeScreen.id,
      routes: appRoutes,
    );
  }
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  HomeScreen.id: (context) => HomeScreen(),
  TrainScreen.id: (context) => TrainScreen(),
  SetScreen.id: (context) => SetScreen(),
  TimerScreen.id: (context) => TimerScreen(),
};
