import 'package:flutter/material.dart';
import 'package:npng/data/models/exercise.dart';
import 'package:npng/generated/l10n.dart';

class ExerciseViewScreen extends StatelessWidget {
  final Exercise exercise;
  const ExerciseViewScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    String desc = exercise.description.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name.toString()),
      ),
      body: SafeArea(
        child: (desc.isNotEmpty)
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(exercise.description.toString()),
              )
            : Center(child: Text(S.of(context).noDesc)),
      ),
    );
  }
}
