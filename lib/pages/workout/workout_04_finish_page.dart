import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/state/workout_provider.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:provider/provider.dart';

class WorkoutFinishPage extends StatelessWidget {
  const WorkoutFinishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text('Workout finished'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Text(Provider.of<WorkoutProvider>(context, listen: false)
                  .startTime
                  .toString()),
              Text(Provider.of<WorkoutProvider>(context, listen: false)
                  .finishTime
                  .toString()),
              MpButton(
                label: 'Сохранить',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
