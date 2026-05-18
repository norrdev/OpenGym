import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/providers/app_providers.dart';
import 'calculators/calc_main_screen.dart';
import 'exercises/exercises_screen.dart';
import 'log/log_calendar_screen.dart';
import 'settings/setings_screen.dart';
import 'workout/workout_00_current_program_screen.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});

  final List<Widget> pageList = <Widget>[
    const WorkoutCurrentProgramScreen(),
    const ExercisesScreen(),
    const LogCalendarScreen(),
    const CalcMainScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(currentTabProvider);
    return IndexedStack(
      index: selectedIndex,
      children: pageList,
    );
  }
}
