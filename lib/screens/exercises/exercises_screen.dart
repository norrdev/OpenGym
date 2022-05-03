import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:npng/screens/exercises/exercises_by_muscle_screen.dart';
import 'package:provider/provider.dart';
import 'package:npng/data/repository.dart';

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
          return ListView.builder(
              controller: ScrollController(),
              itemCount: muscles.length,
              itemBuilder: (BuildContext context, int index) {
                final item = muscles[index];
                return Slidable(
                  child: ListTile(
                    leading: (item.icon != null)
                        ? ColorFiltered(
                            colorFilter: const ColorFilter.matrix(
                              <double>[
                                0.2126,
                                0.7152,
                                0.0722,
                                0,
                                0,
                                0.2126,
                                0.7152,
                                0.0722,
                                0,
                                0,
                                0.2126,
                                0.7152,
                                0.0722,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1,
                                0,
                              ],
                            ),
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
                        // TODO: Make const colors
                        backgroundColor: const Color(0xFF0392CF),
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: S.of(context).edit,
                      ),
                    ],
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
