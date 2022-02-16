import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/workout/workout_04_finish_page.dart';
import 'package:npng/data/models/workout_provider.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

// TODO Init provider state
// TODO Continue
// TODO Finish

class WorkoutProcessScreen extends StatefulWidget {
  const WorkoutProcessScreen({Key? key, required this.day}) : super(key: key);
  final Day day;

  @override
  _WorkoutProcessScreenState createState() => _WorkoutProcessScreenState();
}

class _WorkoutProcessScreenState extends State<WorkoutProcessScreen> {
  Map<int, bool> expanded = {};

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
            (!Provider.of<WorkoutProvider>(context, listen: false).active)
                ? const NotAcriveWorkoutBottomBar()
                : const ActiveWorkoutBottomBar(),
          ],
        ),
      ),
      body: SafeArea(
        child: (!Provider.of<WorkoutProvider>(context, listen: false).active)
            ? InitListView(
                repository: repository, widget: widget, expanded: expanded)
            : Center(child: Text(S.of(context).noex)),
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

class NotAcriveWorkoutBottomBar extends StatelessWidget {
  const NotAcriveWorkoutBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MpButton(
      label: S.of(context).start,
      onPressed: () {
        // Provider.of<WorkoutProvider>(context, listen: false)
        //     .resetAllData();
        // Provider.of<WorkoutProvider>(context, listen: false)
        //     .dayID = widget.dayId!;
        // Provider.of<WorkoutProvider>(context, listen: false)
        //     .loadEx(_resultsMutable);

        // Provider.of<WorkoutProvider>(context, listen: false)
        //     .startTime = DateTime.now();
        // Provider.of<WorkoutProvider>(context, listen: false)
        //     .active = true;
        // Wakelock.enable();
        // Navigator.pushNamed(context, WorkoutSetPage.id)
        //     .whenComplete(() => _init());
      },
    );
  }
}

/// This bottom bar for workout-in progress
class ActiveWorkoutBottomBar extends StatelessWidget {
  const ActiveWorkoutBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (!Provider.of<WorkoutProvider>(context, listen: false).finished)
          MpButton(
            label: S.of(context).ccontinue,
            onPressed: () {
              // return Navigator.pushNamed(context, WorkoutSetPage.id)
              //       .whenComplete(() => _init());
            },
          ),
        const SizedBox(width: 16.0),
        MpButton(
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
                builder: (BuildContext context) => const WorkoutFinishPage(),
              ),
              (route) => false,
            );
          },
        ),
      ],
    );
  }
}
