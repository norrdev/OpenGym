import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../../data/models/models.dart';
import '../../../data/repository.dart';
import '../../../generated/l10n.dart';
import '../../../theme.dart';
import '../../../widgets/spin_edit.dart';
import 'program_day_add_exercise.dart';

class ExerciseSettingWidget extends StatelessWidget {
  final int index;

  final Map<int, bool> expanded;
  final Workout item;
  final Repository repository;
  const ExerciseSettingWidget({
    super.key,
    required this.expanded,
    required this.item,
    required this.repository,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(item);
    }
    return ExpansionTile(
      onExpansionChanged: (value) => expanded[index] = value,
      key: Key(index.toString()),
      initiallyExpanded: expanded[index] ?? false,
      tilePadding: const EdgeInsets.only(right: 30.0, left: 16.0),
      title: Text(
        item.name ?? '',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      iconColor: Theme.of(context).primaryColor,
      collapsedIconColor: Theme.of(context).primaryColor,
      subtitle: Text(
        item.description ?? '',
        style: TextStyle(
            color:
                Theme.of(context).bottomNavigationBarTheme.unselectedItemColor),
      ),
      children: [
        // TODO: move limbs and load to constants
        SpinEditInt(
            label: S.of(context).sets,
            initialValue: item.sets ?? 0,
            onChange: (newValue) {
              repository.updateWorkout(item.copyWith(sets: newValue.toInt()));
            }),

        if (item.limbs == 1 && item.loadId != 2 && item.loadId != 3)
          SpinEditInt(
            label: S.of(context).repeats,
            initialValue: item.repeats ?? 0,
            onChange: (newValue) => repository
                .updateWorkout(item.copyWith(repeats: newValue.toInt())),
          ),

        if (item.limbs == 2 && item.loadId != 2 && item.loadId != 3)
          Column(
            children: [
              SpinEditInt(
                // TODO: Move L&R to localization
                label: '${S.of(context).repeats} L',
                initialValue: item.repeatsLeft ?? 0,
                onChange: (newValue) {
                  repository.updateWorkout(
                      item.copyWith(repeatsLeft: newValue.toInt()));
                },
              ),
              SpinEditInt(
                // TODO: Move L&R to localization
                label: '${S.of(context).repeats} R',
                initialValue: item.repeats ?? 0,
                onChange: (newValue) => repository
                    .updateWorkout(item.copyWith(repeats: newValue.toInt())),
              ),
            ],
          ),

        if (item.bars == 1 && item.loadId == 1)
          SpinEditDouble(
            label: S.of(context).weight,
            initialValue: item.weight ?? 0,
            onChange: (newValue) => repository
                .updateWorkout(item.copyWith(weight: newValue.toDouble())),
          ),

        if (item.bars == 2 && item.loadId == 1)
          Column(
            children: [
              SpinEditDouble(
                // TODO: Move L&R to localization
                label: '${S.of(context).weight} L',
                initialValue: item.weightLeft ?? 0,
                onChange: (newValue) => repository.updateWorkout(
                    item.copyWith(weightLeft: newValue.toDouble())),
              ),
              SpinEditDouble(
                label: '${S.of(context).weight} R',
                initialValue: item.weight ?? 0,
                onChange: (newValue) => repository
                    .updateWorkout(item.copyWith(weight: newValue.toDouble())),
              ),
            ],
          ),

        if (item.loadId == 2)
          SpinEditInt(
            initialValue: item.timeLoad ?? 0,
            onChange: (val) =>
                repository.updateWorkout(item.copyWith(timeLoad: val.toInt())),
            label: S.of(context).time,
          ),

        if (item.loadId == 3)
          SpinEditDouble(
            initialValue: item.distance ?? 0,
            onChange: (val) => repository
                .updateWorkout(item.copyWith(distance: val.toDouble())),
            label: S.of(context).cooperDistanse,
          ),

        SpinEditInt(
          label: S.of(context).rest,
          initialValue: item.rest ?? 0,
          onChange: (newValue) =>
              repository.updateWorkout(item.copyWith(rest: newValue.toInt())),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class ProgramDayScreen extends StatefulWidget {
  final Day day;
  const ProgramDayScreen({super.key, required this.day});

  @override
  State<ProgramDayScreen> createState() => _ProgramDayScreenState();
}

class _ProgramDayScreenState extends State<ProgramDayScreen> {
  Map<int, bool> expanded = {};

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.day.name as String),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProgramDayAddExercise(
                  day: widget.day,
                ),
              ),
            ).then((value) => setState(() {})),
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<List<Workout>>(
          stream: repository.findWorkoutByDay(widget.day.id as int),
          builder: (context, AsyncSnapshot<List<Workout>> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final List<Workout> workouts =
                  (snapshot.hasData) ? [...snapshot.data!] : [];
              return ReorderableListView.builder(
                itemCount: workouts.length,
                itemBuilder: (context, index) {
                  final item = workouts[index];
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            repository.deleteWorkout(item);
                            setState(() {});
                          },
                          backgroundColor: kActionColorDelete,
                          foregroundColor: kActionColorIcon,
                          icon: Icons.delete,
                          label: S.of(context).delete,
                        ),
                      ],
                    ),
                    key: ValueKey(item),
                    child: ExerciseSettingWidget(
                        index: index,
                        expanded: expanded,
                        item: item,
                        repository: repository),
                  );
                },
                onReorder: (int oldIndex, int newIndex) {
                  if (newIndex > oldIndex) newIndex -= 1;
                  final Workout movedWorkout = workouts.removeAt(oldIndex);
                  workouts.insert(newIndex, movedWorkout);
                  repository.reorderWorkouts(workouts);
                  // There is no need to update state here.
                  // repository.reorderDays(days).then((value) {
                  //   setState(() {});
                  // });
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
