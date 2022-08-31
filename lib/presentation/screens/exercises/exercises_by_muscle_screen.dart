import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/models.dart';
import '../../../data/repository.dart';
import '../../../generated/l10n.dart';
import '../../../theme.dart';
import 'exercise_edit_screen.dart';
import 'exercise_new_screen.dart';
import 'exercise_view_screen.dart';

class ExercisesByMuscleScreen extends StatefulWidget {
  final int musclesId;
  final String pageTitle;

  const ExercisesByMuscleScreen(
      {super.key, required this.musclesId, required this.pageTitle});

  @override
  State<ExercisesByMuscleScreen> createState() =>
      _ExercisesByMuscleScreenState();
}

class _ExercisesByMuscleScreenState extends State<ExercisesByMuscleScreen> {
  @override
  Widget build(BuildContext context) {
    final repository =
        RepositoryProvider.of<Repository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseNewScreen(
                  muscleId: widget.musclesId,
                ),
              ),
            ).then((value) => setState(() {})),
          ),
        ],
      ),
      body: StreamBuilder<List<Exercise>>(
        stream: repository.findExcersisesByMuscle(widget.musclesId),
        builder: (context, AsyncSnapshot<List<Exercise>> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final exes = snapshot.data ?? [];
            return ListView.builder(
              itemCount: exes.length,
              itemBuilder: (context, index) {
                final item = exes[index];
                return Slidable(
                  key: ValueKey(item),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ExerciseEditScreen(
                                exercise: item,
                              );
                            },
                          ),
                        ).then((value) {
                          // TODO change to bloc event
                          setState(() {});
                        }),
                        backgroundColor: kActionColorEdit,
                        foregroundColor: kActionColorIcon,
                        icon: Icons.edit,
                        label: S.of(context).edit,
                      ),
                      // Delete only arter log changes
                      // SlidableAction(
                      //   onPressed: (context) {
                      //     repository.deleteExercise(item);
                      //     setState(() {});
                      //   },
                      //   backgroundColor: kActionColorDelete,
                      //   foregroundColor: kActionColorIcon,
                      //   icon: Icons.delete,
                      //   label: S.of(context).delete,
                      // ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(item.name!),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ExerciseViewScreen(
                            exercise: item,
                          );
                        },
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
      ),
    );
  }
}
