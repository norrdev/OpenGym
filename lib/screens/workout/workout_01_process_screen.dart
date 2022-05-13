import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

import 'package:npng/data/models/models.dart';
import 'package:npng/state/workout_provider.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/workout/workout_02_set_screen.dart';
import 'package:npng/screens/workout/workout_04_finish_screen.dart';
import 'package:npng/widgets/change_int_field.dart';

/// Shows current workouprogram day and sets.
class WorkoutProcessScreen extends StatelessWidget {
  final Day? day;

  const WorkoutProcessScreen({Key? key, this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).currentWorkout),
      ),
      persistentFooterButtons: [
        Consumer<WorkoutState>(
          builder: (context, workout, _) {
            if (workout.active) {
              return const ActiveBottomBar();
            } else {
              return InitBottomBar(dayId: day?.id as int);
            }
          },
        ),
      ],
      body: SafeArea(
        child: Consumer<WorkoutState>(
          builder: (context, workout, _) {
            if (workout.active) {
              return const ActiveListView();
            } else {
              return InitListView(day: day);
            }
          },
        ),
      ),
    );
  }
}

/// Current workout before start.
class InitListView extends StatelessWidget {
  const InitListView({
    Key? key,
    required this.day,
  }) : super(key: key);

  final Day? day;

  @override
  Widget build(BuildContext context) {
    Map<int, bool> expanded = {};
    final repository = context.read<Repository>();
    return StreamBuilder<List<Workout>>(
      stream: repository.findWorkoutByDay(day?.id as int),
      builder: (context, AsyncSnapshot<List<Workout>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final List<Workout> workouts =
              (snapshot.hasData) ? [...snapshot.data!] : [];
          if (workouts.isNotEmpty) {
            context.read<WorkoutState>().workoutsSnapshot = workouts;
          }
          return ReorderableListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              final item = workouts[index];
              return Column(
                key: ValueKey(item),
                children: [
                  ExpansionTile(
                    onExpansionChanged: (value) => expanded[index] = value,
                    key: Key(index.toString()),
                    initiallyExpanded: expanded[index] ?? false,
                    tilePadding: const EdgeInsets.only(right: 30.0, left: 16.0),
                    title: Text(
                      item.name as String,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    iconColor: Theme.of(context).primaryColor,
                    collapsedIconColor: Theme.of(context).primaryColor,
                    subtitle: Text(
                      item.description as String,
                      style: TextStyle(
                          color: Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedItemColor),
                    ),
                    children: [
                      Column(
                        children: [
                          Text(S.of(context).sets),
                          ChangeIntField(
                            value: item.sets as int,
                            decreaseCallback: () {
                              if (item.sets as int > 1) {
                                item.sets = item.sets! - 1;
                                repository.updateWorkoutSetsRepeatsRest(item);
                              }
                            },
                            increaseCallback: () {
                              item.sets = item.sets! + 1;
                              repository.updateWorkoutSetsRepeatsRest(item);
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(S.of(context).repeats),
                          ChangeIntField(
                            value: item.repeats as int,
                            decreaseCallback: () {
                              if (item.repeats as int > 1) {
                                item.repeats = item.repeats! - 1;
                                repository.updateWorkoutSetsRepeatsRest(item);
                              }
                            },
                            increaseCallback: () {
                              item.repeats = item.repeats! + 1;
                              repository.updateWorkoutSetsRepeatsRest(item);
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(S.of(context).rest),
                          ChangeIntField(
                            value: item.rest as int,
                            decreaseCallback: () {
                              if (item.rest as int > 5) {
                                item.rest = item.rest! - 5;
                                repository.updateWorkoutSetsRepeatsRest(item);
                              }
                            },
                            increaseCallback: () {
                              item.rest = item.rest! + 5;
                              repository.updateWorkoutSetsRepeatsRest(item);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                ],
              );
            },
            onReorder: (int oldIndex, int newIndex) {
              if (newIndex > oldIndex) newIndex -= 1;
              final Workout movedWorkout = workouts.removeAt(oldIndex);
              workouts.insert(newIndex, movedWorkout);
              repository.reorderWorkouts(workouts);
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

/// Shows active workout after start screen.
class ActiveListView extends StatelessWidget {
  const ActiveListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: context.read<WorkoutState>().excersises.length,
      itemBuilder: (context, index) {
        return Consumer<WorkoutState>(builder: (context, workout, child) {
          return ListTile(
              leading: (workout.excersises[index].completed)
                  ? const Icon(
                      Icons.done,
                    )
                  : null,
              title: Text(workout.excersises[index].name));
        });
      },
    );
  }
}

/// This bottom bar on workout init with start button.
class InitBottomBar extends StatelessWidget {
  final int dayId;

  const InitBottomBar({Key? key, required this.dayId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // Start button
      child: ElevatedButton(
        child: Text(S.of(context).start),
        onPressed: () {
          context.read<WorkoutState>().dayID = dayId;
          context.read<WorkoutState>().startTime = DateTime.now();
          context.read<WorkoutState>().active = true;
          Wakelock.enable();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WorkoutSetScreen(),
            ),
          ).whenComplete(() => context.read<WorkoutState>().notify());
          // TODO: Here is a problem with a state
        },
      ),
    );
  }
}

/// This bottom bar for workout-in progress
class ActiveBottomBar extends StatelessWidget {
  const ActiveBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (!context.read<WorkoutState>().finished)
          ElevatedButton(
            child: Text(S.of(context).ccontinue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WorkoutSetScreen(),
                ),
              );
            },
          ),
        const SizedBox(width: 16.0),
        ElevatedButton(
          child: Text(S.of(context).finish),
          onPressed: () {
            Wakelock.disable();
            context.read<WorkoutState>().finishTime = DateTime.now();
            context.read<WorkoutState>().finished = true;
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const WorkoutFinishScreen(),
              ),
              (route) => false,
            );
          },
        ),
      ],
    );
  }
}
