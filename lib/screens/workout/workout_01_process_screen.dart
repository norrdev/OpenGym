import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/sqlite/db_old.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/workout/workout_02_set_page.dart';
import 'package:npng/screens/workout/workout_04_finish_page.dart';
import 'package:npng/data/models/workout_provider.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

// TODO Load from DB
// TODO Reorder
// TODO Init provider state
// TODO Continue
// TODO Finish

class WorkoutProcessScreen extends StatefulWidget {
  const WorkoutProcessScreen({Key? key, required this.day}) : super(key: key);
  final Day day;

  @override
  _WorkoutProcessScreenState createState() => _WorkoutProcessScreenState();
}

class _WorkoutProcessScreenState extends State<WorkoutProcessScreen> {
  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).currentWorkout),
      ),
      body: SafeArea(child: Center(child: CircularProgressIndicator())),
    );
  }
}
