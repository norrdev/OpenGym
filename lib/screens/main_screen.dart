import 'package:flutter/material.dart';
import 'package:npng/state/current_tab_state.dart';
import 'package:provider/provider.dart';

import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/exercises/exercises_screen.dart';
import 'package:npng/screens/log/log_calendar_screen.dart';
import 'package:npng/screens/programs/programs_screen.dart';
import 'package:npng/screens/settings/setings_screen.dart';
import 'package:npng/screens/workout/workout_00_start_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pageList = <Widget>[
    const WorkoutStartScreen(),
    const ExercisesScreen(),
    const LogCalendarScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    String title = 'NpNg';
    switch (context.watch<CurrentTabState>().selectedIndex) {
      case 0:
        title = S.of(context).pageWorkout;
        break;
      case 1:
        title = S.of(context).pageExerciseTitle;
        break;
      case 2:
        title = S.of(context).log;
        break;
      case 3:
        title = S.of(context).settings;
        break;
      default:
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.fitness_center_rounded),
            label: S.of(context).pageWorkout,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.directions_run_rounded),
            label: S.of(context).pageExerciseTitle,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_month_rounded),
            label: S.of(context).log,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_rounded),
            label: S.of(context).settings,
          ),
        ],
        currentIndex: context.watch<CurrentTabState>().selectedIndex,
        onTap: (int index) {
          context.read<CurrentTabState>().selectedIndex = index;
        },
      ),
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          if (context.watch<CurrentTabState>().selectedIndex == 0)
            IconButton(
              padding: const EdgeInsets.all(8),
              icon: const Icon(Icons.checklist_rounded),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProgramsScreen(),
                ),
              ),
            )
        ],
      ),
      body: IndexedStack(
        index: context.watch<CurrentTabState>().selectedIndex,
        children: pageList,
      ),
    );
  }
}
