import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/pages/workout/timer_page.dart';
import 'package:npng/state/workout_provider.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/config.dart';

class WorkoutSetPage extends StatelessWidget {
  static const String id = '/set';

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(title: Consumer<WorkoutProvider>(
        builder: (context, wk, child) {
          return Text(wk.excersises[wk.currentExcersise]['name']);
        },
      )),
      body: SafeArea(
        child: Theme(
          data: (darkModeOn) ? kMaterialDark : kMaterialLight,
          child: Material(
            type: MaterialType.transparency,
            child:
                Consumer<WorkoutProvider>(builder: (context, workout, child) {
              List<Step> steps = [];

              for (int i = 0;
                  i < workout.excersises[workout.currentExcersise]['sets'];
                  i++) {
                steps.add(Step(
                  isActive: (workout.currentSet == i) ? true : false,
                  title: Text(
                    //TODO: Get weight from previous log!
                    workout.excersises[workout.currentExcersise]['weight']
                            .toString() +
                        ' kg x ' +
                        workout.excersises[workout.currentExcersise]['repeats']
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
                                ['repeats'],
                          ),
                          Text(S.of(context).weight),
                          MpChangeDoubleField(
                            //TODO: Get from previous log!
                            value: workout.excersises[workout.currentExcersise]
                                ['weight'],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: MpButton(
                              label: S.of(context).restButton,
                              onPressed: () {
                                workout.incCurrentSet();
                                Navigator.pushNamed(context, TimerPage.id);
                              },
                            ),
                          ),
                        ],
                      )),
                ));
              }

              return Stepper(
                currentStep: workout.currentSet,
                controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                  return Container();
                },
                onStepTapped: (int index) {
                  workout.currentSet = index;
                },
                steps: steps,
              );
            }),
          ),
        ),
      ),
    );
  }
}
