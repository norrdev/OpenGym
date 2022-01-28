import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:npng/screens/exercises/exercises_by_muscle_screen.dart';
import 'package:provider/provider.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/data/models/muscle.dart';
import 'package:npng/generated/l10n.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({Key? key}) : super(key: key);
  static String id = '/exercises';

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Repository>(context, listen: false);
    return StreamBuilder<List<Muscle>>(
      stream: repository.watchAllMuscles(),
      builder: (context, AsyncSnapshot<List<Muscle>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final muscles = snapshot.data ?? [];
          return Material(
            type: MaterialType.transparency,
            child: ListView.builder(
                itemCount: muscles.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = muscles[index];
                  return Slidable(
                    child: ListTile(
                      leading: (item.icon != null)
                          ? Image.memory(
                              item.icon as Uint8List,
                              width: 96,
                              height: 96,
                            )
                          : const SizedBox(
                              width: 96,
                              height: 96,
                            ),
                      title: Text(item.name as String),
                      onTap: () => Navigator.push(
                        context,
                        mpPageRoute(
                          builder: (context) {
                            return ExercisesByMuscleScreen(
                              musclesId: item.id as int,
                              pageTitle: item.name as String,
                            );
                          },
                        ),
                      ),
                    ),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => Navigator.push(
                            context,
                            mpPageRoute(
                              builder: (context) {
                                return ExercisesByMuscleScreen(
                                  musclesId: item.id as int,
                                  pageTitle: item.name as String,
                                );
                              },
                            ),
                          ),
                          backgroundColor: const Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: S.of(context).edit,
                        ),
                      ],
                    ),
                  );
                }),
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
