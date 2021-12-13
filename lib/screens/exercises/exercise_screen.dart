import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';

class ExerciseScreen extends StatelessWidget {
  final int exeId;
  const ExerciseScreen({Key? key, required this.exeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
        appBar: MpAppBar(
          title: Text('Exe $exeId'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}
