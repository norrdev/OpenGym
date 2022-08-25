import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npng/logic/cubit/workout_cubit.dart';
import 'package:wakelock/wakelock.dart';

import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/presentation/screens/workout/workout_02_set_screen.dart';
import 'package:npng/presentation/screens/workout/workout_04_finish_screen.dart';
import 'package:npng/widgets/change_int_field.dart';

/// Shows current workout program day and sets.
class WorkoutProcessScreen extends StatelessWidget {
  final Day? day;

  const WorkoutProcessScreen({super.key, this.day});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).currentWorkout),
      ),
      persistentFooterButtons: [
        Builder(
          builder: (context) {
            final activeValue = context.select(
                (WorkoutCubit workoutCubit) => workoutCubit.state.active);
            if (activeValue) {
              return const ActiveBottomBar();
            } else {
              return InitBottomBar(dayId: day?.id as int);
            }
          },
        ),
      ],
      body: SafeArea(
        child: Builder(
          builder: (context) {
            final activeValue = context.select(
                (WorkoutCubit workoutCubit) => workoutCubit.state.active);
            if (activeValue) {
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
    super.key,
    required this.day,
  });

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
            context.read<WorkoutCubit>().workoutsSnapshot = workouts;
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
                      item.description ?? '',
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
                            value: item.sets ?? 0,
                            decreaseCallback: () {
                              if (item.sets as int > 1) {
                                repository.updateWorkout(
                                    item.copyWith(sets: item.sets! - 1));
                              }
                            },
                            increaseCallback: () {
                              repository.updateWorkout(
                                  item.copyWith(sets: item.sets! + 1));
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(S.of(context).repeats),
                          ChangeIntField(
                            value: item.repeats ?? 0,
                            decreaseCallback: () {
                              if (item.repeats as int > 1) {
                                repository.updateWorkout(
                                    item.copyWith(repeats: item.repeats! - 1));
                              }
                            },
                            increaseCallback: () {
                              repository.updateWorkout(
                                  item.copyWith(repeats: item.repeats! + 1));
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(S.of(context).rest),
                          ChangeIntField(
                            value: item.rest ?? 0,
                            decreaseCallback: () {
                              if (item.rest as int > 5) {
                                repository.updateWorkout(
                                    item.copyWith(rest: item.rest! - 5));
                              }
                            },
                            increaseCallback: () {
                              repository.updateWorkout(
                                  item.copyWith(rest: item.rest! + 5));
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
  const ActiveListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: context.read<WorkoutCubit>().state.exercises.length,
      itemBuilder: (context, index) {
        return BlocBuilder<WorkoutCubit, WorkoutState>(builder: (_, state) {
          return ListTile(
              leading: (state.exercises[index].completed)
                  ? const Icon(
                      Icons.done,
                    )
                  : null,
              title: Text(state.exercises[index].name));
        });
      },
    );
  }
}

/// This bottom bar on workout init with start button.
class InitBottomBar extends StatelessWidget {
  final int dayId;

  const InitBottomBar({super.key, required this.dayId});

  @override
  Widget build(BuildContext context) {
    return Center(
      // Start button
      child: ElevatedButton(
        child: Text(S.of(context).start),
        onPressed: () {
          context.read<WorkoutCubit>().startWorkout(dayId);
          Wakelock.enable();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WorkoutSetScreen(),
            ),
          );
        },
      ),
    );
  }
}

/// This bottom bar for workout-in progress
class ActiveBottomBar extends StatelessWidget {
  const ActiveBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (!context.read<WorkoutCubit>().state.finished)
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
