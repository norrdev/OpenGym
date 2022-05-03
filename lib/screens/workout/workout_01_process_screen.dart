import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/main.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/workout/workout_02_set_screen.dart';
import 'package:npng/screens/workout/workout_04_finish_screen.dart';
import 'package:npng/data/models/workout_provider.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

class WorkoutProcessScreen extends StatefulWidget {
  const WorkoutProcessScreen({Key? key, required this.day}) : super(key: key);
  final Day day;

  @override
  _WorkoutProcessScreenState createState() => _WorkoutProcessScreenState();
}

class _WorkoutProcessScreenState extends State<WorkoutProcessScreen> {
  Map<int, bool> expanded = {};

  void pushBack() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).currentWorkout),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: (isApple)
              ? CupertinoTheme.of(context).barBackgroundColor
              : Theme.of(context).bottomAppBarColor,
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            (Provider.of<WorkoutProvider>(context, listen: false).active)
                ? ActiveBottomBar(
                    pushBack: pushBack,
                  )
                : InitBottomBar(
                    dayId: widget.day.id as int,
                    pushBack: pushBack,
                  ),
          ],
        ),
      ),
      body: SafeArea(
        child: (Provider.of<WorkoutProvider>(context, listen: false).active)
            ? const ActiveListView()
            : InitListView(
                repository: repository,
                widget: widget,
                expanded: expanded,
              ),
      ),
    );
  }
}

/// Current workout not started view.
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
      stream: repository.findWorkoutByDay(widget.day.id as int),
      builder: (context, AsyncSnapshot<List<Workout>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final List<Workout> workouts =
              (snapshot.hasData) ? [...snapshot.data!] : [];
          if (workouts.isNotEmpty) {
            Provider.of<WorkoutProvider>(context, listen: false)
                .workoutsSnapshot = workouts;
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              type: MaterialType.transparency,
              child: ReorderableListView.builder(
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
                        tilePadding:
                            const EdgeInsets.only(right: 30.0, left: 16.0),
                        title: Text(item.name as String),
                        subtitle: Text(item.description as String),
                        children: [
                          Column(
                            children: [
                              Text(S.of(context).sets),
                              MpChangeIntField(
                                value: item.sets as int,
                                decreaseCallback: () {
                                  if (item.sets as int > 1) {
                                    item.sets = item.sets! - 1;
                                    repository
                                        .updateWorkoutSetsRepeatsRest(item);
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
                              MpChangeIntField(
                                value: item.repeats as int,
                                decreaseCallback: () {
                                  if (item.repeats as int > 1) {
                                    item.repeats = item.repeats! - 1;
                                    repository
                                        .updateWorkoutSetsRepeatsRest(item);
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
                              MpChangeIntField(
                                value: item.rest as int,
                                decreaseCallback: () {
                                  if (item.rest as int > 5) {
                                    item.rest = item.rest! - 5;
                                    repository
                                        .updateWorkoutSetsRepeatsRest(item);
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
              ),
            ),
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

/// Shows active workout screen.
class ActiveListView extends StatelessWidget {
  const ActiveListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<WorkoutProvider>(context, listen: false)
          .excersises
          .length,
      itemBuilder: (context, index) {
        final item = Provider.of<WorkoutProvider>(context, listen: false)
            .excersises[index];
        return Material(
          type: MaterialType.transparency,
          key: ValueKey(item),
          child: ListTile(
              //FIXME: Show status of excersises, check completed.
              leading: (item.completed)
                  ? const Icon(
                      Icons.done,
                    )
                  : const Icon(
                      Icons.fitness_center,
                    ),
              title: Text(item.name)),
        );
      },
    );
  }
}

/// This bottom bar on workout init
class InitBottomBar extends StatelessWidget {
  final int dayId;
  final Function? pushBack;

  const InitBottomBar({
    Key? key,
    required this.dayId,
    this.pushBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MpButton(
      label: S.of(context).start,
      onPressed: () {
        Provider.of<WorkoutProvider>(context, listen: false).dayID = dayId;
        Provider.of<WorkoutProvider>(context, listen: false).startTime =
            DateTime.now();
        Provider.of<WorkoutProvider>(context, listen: false).active = true;
        Wakelock.enable();
        pushBack!();
        Navigator.push(
          context,
          mpPageRoute(
            builder: (context) => const WorkoutSetScreen(),
          ),
        ).whenComplete(() => pushBack);
      },
    );
  }
}

/// This bottom bar for workout-in progress
class ActiveBottomBar extends StatelessWidget {
  final Function? pushBack;
  const ActiveBottomBar({
    Key? key,
    this.pushBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (!Provider.of<WorkoutProvider>(context, listen: false).finished)
          MpFlatButton(
            label: S.of(context).ccontinue,
            onPressed: () {
              Navigator.push(
                context,
                mpPageRoute(
                  builder: (context) => const WorkoutSetScreen(),
                ),
              ).whenComplete(() => pushBack);
            },
          ),
        const SizedBox(width: 16.0),
        MpFlatButton(
          label: S.of(context).finish,
          onPressed: () {
            // Provider.of<WorkoutProvider>(context, listen: false)
            //     .resetAllData();
            Wakelock.disable();
            Provider.of<WorkoutProvider>(context, listen: false).finishTime =
                DateTime.now();
            Provider.of<WorkoutProvider>(context, listen: false).finished =
                true;
            Navigator.pushAndRemoveUntil(
              context,
              mpPageRoute(
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
