import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/pages/workout/workout_03_timer_page.dart';
import 'package:npng/state/workout_provider.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/config.dart';

class WorkoutSetPage extends StatelessWidget {
  static const String id = '/set';

  @override
  Widget build(BuildContext context) {
    if (Provider.of<WorkoutProvider>(context, listen: false).finished == true) {
      Navigator.pop(context);
    }

    return MpScaffold(
      appBar: MpAppBar(title: Consumer<WorkoutProvider>(
        builder: (context, wk, child) {
          return Text(wk.excersises[wk.currentExcersise].name);
        },
      )),
      body: SafeArea(
        child: Material(
          type: MaterialType.transparency,
          child: Consumer<WorkoutProvider>(builder: (context, workout, child) {
            List<Step> steps = [];

            for (int i = 0; i <= workout.maxSet; i++) {
              steps.add(
                Step(
                  isActive: (workout.currentSet == i) ? true : false,
                  title: Text(
                    //TODO: Get weight from previous log!
                    workout.excersises[workout.currentExcersise].sets[i].weight
                            .toString() +
                        ' kg x ' +
                        workout.excersises[workout.currentExcersise].sets[i]
                            .repeats
                            .toString(),
                    style: TextStyle(
                        fontSize: 20.0,
                        color: (isApple)
                            ? CupertinoTheme.of(context)
                                .textTheme
                                .tabLabelTextStyle
                                .color
                            : Theme.of(context).textTheme.caption!.color),
                  ),
                  content: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            S.of(context).setsText,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(S.of(context).repeats),
                        MpChangeIntField(
                          value: workout.excersises[workout.currentExcersise]
                              .sets[i].repeats,
                          decreaseCallback: () => workout.decRepeats(
                              excersiseNumber: workout.currentExcersise,
                              setNumber: i),
                          increaseCallback: () => workout.incRepeats(
                              excersiseNumber: workout.currentExcersise,
                              setNumber: i),
                        ),
                        Text(S.of(context).weight),
                        MpChangeDoubleFieldExtended(
                          //TODO: Get from previous log!
                          value: workout.excersises[workout.currentExcersise]
                              .sets[i].weight,
                          increaseCallback: () => workout.incWeight025(
                              excersiseNumber: workout.currentExcersise,
                              setNumber: i),
                          decreaseCallback: () => workout.decWeight025(
                              excersiseNumber: workout.currentExcersise,
                              setNumber: i),
                          increaseCallbackFast: () => workout.incWeight5(
                              excersiseNumber: workout.currentExcersise,
                              setNumber: i),
                          decreaseCallbackFast: () => workout.decWeight5(
                              excersiseNumber: workout.currentExcersise,
                              setNumber: i),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: MpButton(
                            label: S.of(context).restButton,
                            onPressed: () {
                              Navigator.pushNamed(context, TimerPage.id);
                              // .whenComplete(
                              //     () => workout.incCurrentSet());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } // for

            return Stepper(
              // https://github.com/flutter/flutter/issues/27187
              key: Key(Random.secure().nextDouble().toString()),
              steps: steps,
              currentStep: workout.currentSet,
              onStepTapped: (int index) {
                workout.currentSet = index;
              },
              controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                return Container();
              },
            );
          }),
        ),
      ),
    );
  }
}
