import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:npng/presentation/widgets/help_icon_button.dart';

import '../../../data/models/models.dart';
import '../../../data/repository.dart';
import '../../../generated/l10n.dart';
import '../../../theme.dart';
import '../../widgets/workout_exercise_settings.dart';
import 'program_day_add_exercise.dart';

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
    final repository =
        RepositoryProvider.of<Repository>(context, listen: false);
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
          HelpIconButton(help: S.of(context).hintProgramsDay),
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
                    child: WorkoutExerciseSettings(
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
