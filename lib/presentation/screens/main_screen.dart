import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/current_tab_cubit.dart';
import 'calculators/calc_main_screen.dart';
import 'exercises/exercises_screen.dart';
import 'log/log_calendar_screen.dart';
import 'settings/setings_screen.dart';
import 'workout/workout_00_current_program_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pageList = <Widget>[
    const WorkoutCurrentProgramScreen(),
    const ExercisesScreen(),
    const LogCalendarScreen(),
    const CalcMainScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentTabCubit, CurrentTabState>(
      builder: (context, state) {
        return IndexedStack(
          index: state is CurrentTabLoaded ? state.selectedIndex : 0,
          children: pageList,
        );
      },
    );
  }
}
