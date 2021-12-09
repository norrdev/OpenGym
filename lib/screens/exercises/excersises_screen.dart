import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/screens/exercises/exercises_by_muscle_page.dart';
import 'package:npng/data/models/muscle.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({Key? key}) : super(key: key);
  static String id = '/exercises';

  @override
  _ExercisesScreenState createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  List<Muscle> muscles = [];

  @override
  Widget build(BuildContext context) {
    return _buildMusclesList(context);
  }

  Widget _buildMusclesList(BuildContext context) {
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
                  return ListTile(
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
                    onTap: () {
                      //TODO: Switch to exersises by muscle screen
                      Navigator.push(
                        context,
                        mpPageRoute(
                          builder: (context) {
                            return ExercisesByMusclePage(
                              musclesId: item.id as int,
                              pageTitle: item.name as String,
                            );
                          },
                        ),
                      );
                    },
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