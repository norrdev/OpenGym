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
  const WorkoutSetPage({Key? key}) : super(key: key);
  static const String id = '/set';

  @override
  Widget build(BuildContext context) {
    if (Provider.of<WorkoutProvider>(context, listen: false).finished) {
      Navigator.pop(context);
    }

    return MpScaffold(
      appBar: MpAppBar(
        title: Consumer<WorkoutProvider>(
          builder: (context, wk, child) {
            return Text(wk.excersises[wk.currentExcersise].name);
          },
        ),
        // trailing: MpLinkButton(
        //   label: S.of(context).skip,
        //   onPressed: () {
        //     if (!isApple) {
        //       showDialog(
        //         context: context,
        //         builder: (BuildContext context) => AlertDialog(
        //           title: Text(S.of(context).skip),
        //           content: Text(S.of(context).skipDialog),
        //           actions: <Widget>[
        //             TextButton(
        //               onPressed: () =>
        //                   Navigator.pop(context, S.of(context).cancel),
        //               child: Text(S.of(context).cancel),
        //             ),
        //             TextButton(
        //               onPressed: () {
        //                 // action
        //                 Provider.of<WorkoutProvider>(context, listen: false)
        //                     .manualSkipExersise();
        //                 Navigator.pop(context, 'OK');
        //               },
        //               child: const Text('OK'),
        //             ),
        //           ],
        //         ),
        //       );
        //     } else {
        //       showDialog(
        //         context: context,
        //         builder: (BuildContext context) => CupertinoAlertDialog(
        //           title: Text(S.of(context).skip),
        //           content: Text(S.of(context).skipDialog),
        //           actions: <Widget>[
        //             TextButton(
        //               onPressed: () =>
        //                   Navigator.pop(context, S.of(context).cancel),
        //               child: Text(S.of(context).cancel),
        //             ),
        //             TextButton(
        //               onPressed: () {
        //                 // action
        //                 Provider.of<WorkoutProvider>(context, listen: false)
        //                     .manualSkipExersise();
        //                 Navigator.pop(context, 'OK');
        //               },
        //               child: const Text('OK'),
        //             ),
        //           ],
        //         ),
        //       );
        //     }
        //   },
        // ),
      ),
      bottomNavigationBar: const BottomNavBar(),
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

/// Bottom navigation bar
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (isApple)
            ? CupertinoTheme.of(context).barBackgroundColor
            : Theme.of(context).bottomAppBarColor,
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          MpFlatButton(
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () =>
                Provider.of<WorkoutProvider>(context, listen: false)
                    .manualRemoveOneSet(),
          ),
          MpButton(
            label: S.of(context).restButton,
            onPressed: () {
              Navigator.pushNamed(context, TimerPage.id);
              // .whenComplete(
              //     () => workout.incCurrentSet());
            },
          ),
          MpFlatButton(
            child: const Icon(Icons.exposure_plus_1),
            onPressed: () =>
                Provider.of<WorkoutProvider>(context, listen: false)
                    .manualAddOneSet(),
          ),
        ],
      ),
    );
  }
}
