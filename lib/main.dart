import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:npng/data/repository.dart';
import 'package:npng/data/sqlite/sqlite_repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/logic/cubit/current_tab_cubit.dart';
import 'package:npng/logic/cubit/default_program_cubit.dart';
import 'package:npng/logic/cubit/workout_cubit.dart';
import 'package:npng/presentation/routes/route_map.dart';
import 'package:npng/theme.dart';

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
  defaultProgram = await repository.getCurrentProgram();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CurrentTabCubit>(
          create: (context) => CurrentTabCubit(),
        ),
        BlocProvider<DefaultProgramCubit>(
          create: (context) =>
              DefaultProgramCubit(defaultProgram: defaultProgram),
        ),
        BlocProvider<WorkoutCubit>(create: (context) => WorkoutCubit()),
      ],
      child: MultiProvider(providers: [
        Provider<Repository>(
          lazy: false,
          create: (_) => repository,
          dispose: (_, Repository repository) => repository.close(),
        ),
      ], child: Application(repository: repository)),
    ),
  );
}

class Application extends StatelessWidget {
  final Repository repository;
  const Application({super.key, required this.repository});
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
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      initialRoute: kInitialRoute,
      routes: appRoutes,
    );
  }
}
