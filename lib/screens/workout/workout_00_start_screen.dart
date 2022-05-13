import 'package:flutter/material.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/state/workout_provider.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/workout/workout_01_process_screen.dart';
import 'package:npng/state/days_%20reordered_state.dart';
import 'package:npng/state/default_program_state.dart';
import 'package:provider/provider.dart';

/// This is the first screen of the workout.
class WorkoutStartScreen extends StatelessWidget {
  const WorkoutStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (context.watch<WorkoutState>().active)
          ? const ArtiveWorkoutScreen()
          : const DaysListWidget(),
    );
  }
}

class DaysListWidget extends StatelessWidget {
  const DaysListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = context.read<Repository>();
    // Watch only one defaultProgram, not the whole AppStateProvider.
    final int defaultProgram =
        context.select((DefaultProgramState value) => value.defaultProgram);
    ScrollController scontroller = ScrollController();
    return Selector(
        selector: (BuildContext context, DaysReorderedState value) =>
            value.isDaysReordered,
        builder: (context, bool isDaysReordered, _) {
          return StreamBuilder<List<Day>>(
            stream: repository.findDaysByProgram(defaultProgram),
            builder: (context, AsyncSnapshot<List<Day>> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                // Because must be mutable for sorting
                final List<Day> days =
                    (snapshot.hasData) ? [...snapshot.data!] : [];
                if (days.isEmpty) {
                  return Center(child: Text(S.of(context).selectProgram));
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
        });
  }
}

/// Screen with button "Continue", if the workout is started.
class ArtiveWorkoutScreen extends StatelessWidget {
  const ArtiveWorkoutScreen({
    Key? key,
  }) : super(key: key);

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
