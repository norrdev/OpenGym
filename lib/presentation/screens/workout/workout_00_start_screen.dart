import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/logic/cubit/default_program_cubit.dart';
import 'package:npng/logic/cubit/workout_cubit.dart';
import 'package:npng/presentation/screens/programs/programs_screen.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/presentation/screens/workout/workout_01_process_screen.dart';

/// This is the first screen of the workout.
class WorkoutStartScreen extends StatelessWidget {
  const WorkoutStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (context.watch<WorkoutCubit>().state.active)
          ? const ArtiveWorkoutScreen()
          : const DaysListWidget(),
    );
  }
}

class DaysListWidget extends StatelessWidget {
  const DaysListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final repository = context.read<Repository>();
    // Watch only one defaultProgram, not the whole AppStateProvider.

    ScrollController scontroller = ScrollController();
    return BlocBuilder<DefaultProgramCubit, DefaultProgramState>(
      builder: (context, state) {
        return StreamBuilder<List<Day>>(
          stream: repository.findDaysByProgram(
              state is DefaultProgramLoaded ? state.defaultProgram : 0),
          builder: (context, AsyncSnapshot<List<Day>> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Because must be mutable for sorting
              final List<Day> days =
                  (snapshot.hasData) ? [...snapshot.data!] : [];
              if (days.isEmpty) {
                return Container(
                  constraints: const BoxConstraints.expand(),
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_upward_rounded),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 16,
                        child: Center(
                          child: ElevatedButton(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(S.of(context).selectProgram),
                                const SizedBox(width: 8),
                                const Icon(Icons.checklist_rounded),
                              ],
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProgramsScreen(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                controller: scontroller,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final item = days[index];
                  return ListTile(
                    title: Text(item.name as String),
                    subtitle: Text(item.description as String),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkoutProcessScreen(
                          day: item,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}

/// Screen with button "Continue", if the workout is started.
class ArtiveWorkoutScreen extends StatelessWidget {
  const ArtiveWorkoutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).workoutInProgress),
            const SizedBox(height: 20),
            ElevatedButton(
              child: Text(S.of(context).ccontinue),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WorkoutProcessScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
