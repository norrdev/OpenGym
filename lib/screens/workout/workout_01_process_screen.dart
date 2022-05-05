import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

import 'package:npng/data/models/models.dart';
import 'package:npng/data/models/workout_provider.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/workout/workout_02_set_screen.dart';
import 'package:npng/screens/workout/workout_04_finish_screen.dart';
import 'package:npng/widgets/change_int_field.dart';

/// Shows current workouprogram day and sets.
class WorkoutProcessScreen extends StatefulWidget {
  final Day? day;

  const WorkoutProcessScreen({Key? key, this.day}) : super(key: key);

  @override
  _WorkoutProcessScreenState createState() => _WorkoutProcessScreenState();
}

class _WorkoutProcessScreenState extends State<WorkoutProcessScreen> {
  Map<int, bool> expanded = {};

  void pushBack() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).currentWorkout),
      ),
      persistentFooterButtons: [
        Consumer<WorkoutProvider>(builder: (context, workout, child) {
          if (workout.active == true) {
            return const ActiveBottomBar();
          } else {
            return InitBottomBar(
                dayId: widget.day?.id as int, pushBack: pushBack);
          }
        }),
      ],
      body: SafeArea(
        child: Consumer<WorkoutProvider>(builder: (context, workout, child) {
          if (workout.active == true) {
            return const ActiveListView();
          } else {
            return InitListView(
              repository: repository,
              widget: widget,
              expanded: expanded,
            );
          }
        }),
      ),
    );
  }
}

/// Current workout before start.
class InitListView extends StatelessWidget {
  const InitListView({
    Key? key,
    required this.repository,
    required this.widget,
    required this.expanded,
  }) : super(key: key);

  final Repository repository;
  final WorkoutProcessScreen widget;
  final Map<int, bool> expanded;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Workout>>(
      stream: repository.findWorkoutByDay(widget.day?.id as int),
      builder: (context, AsyncSnapshot<List<Workout>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final List<Workout> workouts =
              (snapshot.hasData) ? [...snapshot.data!] : [];
          if (workouts.isNotEmpty) {
            Provider.of<WorkoutProvider>(context, listen: false)
                .workoutsSnapshot = workouts;
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
      itemCount: Provider.of<WorkoutProvider>(context, listen: false)
          .excersises
          .length,
      itemBuilder: (context, index) {
        return Consumer<WorkoutProvider>(builder: (context, workout, child) {
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
  final void Function() pushBack;

  const InitBottomBar({Key? key, required this.dayId, required this.pushBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // Start button
      child: ElevatedButton(
        child: Text(S.of(context).start),
        onPressed: () {
          Provider.of<WorkoutProvider>(context, listen: false).dayID = dayId;
          Provider.of<WorkoutProvider>(context, listen: false).startTime =
              DateTime.now();
          Provider.of<WorkoutProvider>(context, listen: false).active = true;
          Wakelock.enable();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WorkoutSetScreen(),
            ),
          ).whenComplete(() => pushBack());
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
        if (!Provider.of<WorkoutProvider>(context, listen: false).finished)
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
            Provider.of<WorkoutProvider>(context, listen: false).finishTime =
                DateTime.now();
            Provider.of<WorkoutProvider>(context, listen: false).finished =
                true;
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
