import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/data/models/excercise.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';

class ExerciseViewScreen extends StatelessWidget {
  final Exercise exercise;
  const ExerciseViewScreen({Key? key, required this.exercise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String desc = exercise.description.toString();
    return MpScaffold(
      appBar: MpAppBar(
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
