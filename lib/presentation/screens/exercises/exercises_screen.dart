import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:npng/constants/colors.dart';
import 'package:npng/presentation/screens/exercises/exercises_by_muscle_screen.dart';
import 'package:npng/theme.dart';
import 'package:provider/provider.dart';
import 'package:npng/data/repository.dart';

import 'package:npng/data/models/muscle.dart';
import 'package:npng/generated/l10n.dart';

/// Muscle list screen. Read-only from database, doesn't need any state.
class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});
  static String id = '/exercises';

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    return StreamBuilder<List<Muscle>>(
      stream: repository.watchAllMuscles(),
      builder: (context, AsyncSnapshot<List<Muscle>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final muscles = snapshot.data ?? [];
          return ListView.builder(
              controller: ScrollController(),
              itemCount: muscles.length,
              itemBuilder: (BuildContext context, int index) {
                final item = muscles[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ExercisesByMuscleScreen(
                                musclesId: item.id as int,
                                pageTitle: item.name as String,
                              );
                            },
                          ),
                        ),
                        backgroundColor: kActionColorEdit,
                        foregroundColor: kActionColorIcon,
                        icon: Icons.edit,
                        label: S.of(context).edit,
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: (item.icon != null)
                        ? ColorFiltered(
                            colorFilter: kGrayscale,
                            child: Image.memory(
                              item.icon as Uint8List,
                              width: 96,
                              height: 96,
                            ),
                          )
                        : const SizedBox(
                            width: 96,
                            height: 96,
                          ),
                    title: Text(item.name as String),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ExercisesByMuscleScreen(
                            musclesId: item.id as int,
                            pageTitle: item.name as String,
                          );
                        },
                      ),
                    ),
                  ),
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
