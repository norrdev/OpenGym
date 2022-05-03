import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:npng/app_cupertino.dart';
import 'package:npng/data/models/workout_provider.dart';
import 'package:npng/data/repository.dart';

import 'package:npng/data/sqlite/sqlite_repository.dart';

//final bool isApple = !kIsWeb && (Platform.isMacOS || Platform.isIOS);
//TODO: Remove in all files
const bool isApple = true;

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
