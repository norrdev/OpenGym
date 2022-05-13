import 'package:flutter/material.dart';
import 'package:npng/widgets/change_double_field_extended.dart';
import 'package:npng/widgets/change_int_field.dart';
import 'package:provider/provider.dart';
import 'package:steps_indicator/steps_indicator.dart';

import 'package:npng/state/workout_provider.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/workout/workout_03_timer_screen.dart';

class WorkoutSetScreen extends StatelessWidget {
  static const String id = '/set';

  const WorkoutSetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<WorkoutState>(
          builder: (context, wk, _) {
            return Text(wk.excersises[wk.currentExcersise].name);
          },
        ),
      ),
      persistentFooterButtons: [
        Center(
          child: ElevatedButton(
            child: Text(S.of(context).restButton),
            onPressed: () {
              Navigator.pushNamed(context, TimerScreen.id);
            },
          ),
        )
      ],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(S.of(context).sets),
            ),
            SizedBox(
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () =>
                        context.read<WorkoutState>().manualRemoveOneSet(),
                  ),
                  Consumer<WorkoutState>(
                    builder: (context, workout, _) {
                      int mSet = workout.maxSet + 1;
                      double maxLineLength =
                          MediaQuery.of(context).size.width * 0.65;
                      double linelength = maxLineLength;
                      if (mSet > 1) {
                        linelength = maxLineLength / (mSet - 1) -
                            14 / (mSet - 1) -
                            10 / (mSet - 1) * mSet;
                        if (linelength < 0) {
                          linelength = 0;
                        }
                      }
                      return StepsIndicator(
                        lineLength: linelength,
                        selectedStep: workout.currentSet,
                        nbSteps: workout.maxSet + 1,
                        selectedStepColorIn: Colors.transparent,
                        selectedStepColorOut: Theme.of(context).primaryColor,
                        unselectedStepColorIn: Theme.of(context).primaryColor,
                        unselectedStepColorOut: Theme.of(context).primaryColor,
                        doneStepColor: Theme.of(context).primaryColor,
                        doneLineColor: Theme.of(context).primaryColor,
                        undoneLineColor: Theme.of(context).primaryColor,
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () =>
                        context.read<WorkoutState>().manualAddOneSet(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<WorkoutState>(
                builder: (context, workout, child) {
                  return CurrentSetWidget(
                    setNumber: workout.currentSet,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentSetWidget extends StatelessWidget {
  const CurrentSetWidget({
    Key? key,
    required this.setNumber,
  }) : super(key: key);

  final int setNumber;

  @override
  Widget build(BuildContext context) {
    WorkoutState workout = context.read<WorkoutState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).weight),
        ChangeDoubleFieldExtended(
          value: workout
              .excersises[workout.currentExcersise].sets[setNumber].weight,
          increaseCallback: () => workout.incWeight025(
              excersiseNumber: workout.currentExcersise, setNumber: setNumber),
          decreaseCallback: () => workout.decWeight025(
              excersiseNumber: workout.currentExcersise, setNumber: setNumber),
          increaseCallbackFast: () => workout.incWeight5(
              excersiseNumber: workout.currentExcersise, setNumber: setNumber),
          decreaseCallbackFast: () => workout.decWeight5(
              excersiseNumber: workout.currentExcersise, setNumber: setNumber),
        ),
        Text(S.of(context).repeats),
        ChangeIntField(
          value: workout
              .excersises[workout.currentExcersise].sets[setNumber].repeats,
          decreaseCallback: () => workout.decRepeats(
              excersiseNumber: workout.currentExcersise, setNumber: setNumber),
          increaseCallback: () => workout.incRepeats(
              excersiseNumber: workout.currentExcersise, setNumber: setNumber),
        ),
      ],
    );
  }
}
