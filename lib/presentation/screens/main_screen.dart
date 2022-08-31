import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npng/logic/cubit/current_tab_cubit.dart';

import 'package:npng/generated/l10n.dart';
import 'package:npng/presentation/screens/calculators/calc_main_screen.dart';
import 'package:npng/presentation/screens/exercises/exercises_screen.dart';
import 'package:npng/presentation/screens/log/log_calendar_screen.dart';
import 'package:npng/presentation/screens/programs/programs_screen.dart';
import 'package:npng/presentation/screens/settings/setings_screen.dart';
import 'package:npng/presentation/screens/workout/workout_00_start_screen.dart';

import '../../widgets/help_icon_button.dart';
import 'programs/program_new_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pageList = <Widget>[
    const WorkoutStartScreen(),
    const ProgramsScreen(),
    const ExercisesScreen(),
    const LogCalendarScreen(),
    const CalcMainScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    String title = '';

    return BlocListener<CurrentTabCubit, CurrentTabState>(
      listener: (context, state) {
        if (state is CurrentTabLoaded) {
          switch (state.selectedIndex) {
            case 0:
              title = S.of(context).pageWorkout;
              break;
            case 1:
              title = S.of(context).pageProgramsTitle;
              break;
            case 2:
              title = S.of(context).pageExerciseTitle;
              break;
            case 3:
              title = S.of(context).log;
              break;
            case 4:
              title = S.of(context).calculate;
              break;
            case 5:
              title = S.of(context).settings;
              break;
            default:
          }
        }
      },
      child: BlocBuilder<CurrentTabCubit, CurrentTabState>(
        builder: (context, state) {
          return Scaffold(
            drawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Image.asset('assets/icon/icon-alfa.png'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.fitness_center_rounded),
                    title: Text(S.of(context).pageWorkout),
                    onTap: () {
                      context.read<CurrentTabCubit>().saveCurrentIndex(0);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.library_books),
                    title: Text(S.of(context).pageProgramsTitle),
                    onTap: () {
                      context.read<CurrentTabCubit>().saveCurrentIndex(1);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.directions_run_rounded),
                    title: Text(S.of(context).pageExerciseTitle),
                    onTap: () {
                      context.read<CurrentTabCubit>().saveCurrentIndex(2);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_month_rounded),
                    title: Text(S.of(context).log),
                    onTap: () {
                      context.read<CurrentTabCubit>().saveCurrentIndex(3);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.gas_meter_rounded),
                    title: Text(S.of(context).calculate),
                    onTap: () {
                      context.read<CurrentTabCubit>().saveCurrentIndex(4);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings_rounded),
                    title: Text(S.of(context).settings),
                    onTap: () {
                      context.read<CurrentTabCubit>().saveCurrentIndex(5);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: Text(title),
              actions: <Widget>[
                if ((state is CurrentTabLoaded ? state.selectedIndex : 0) == 0)
                  HelpIconButton(help: S.of(context).hintWorkout),
                if ((state is CurrentTabLoaded ? state.selectedIndex : 0) == 1)
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProgramNewScreen(),
                      ),
                    ),
                  ),
                if ((state is CurrentTabLoaded ? state.selectedIndex : 0) == 1)
                  IconButton(
                    onPressed: () {
                      const snackBar = SnackBar(
                        content: Text(''),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: const Icon(Icons.help),
                  ),
              ],
            ),
            body: IndexedStack(
              index: state is CurrentTabLoaded ? state.selectedIndex : 0,
              children: pageList,
            ),
          );
        },
      ),
    );
  }
}
