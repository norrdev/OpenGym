import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/pages/workout/timer_page.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:npng/state/set_rest_provider.dart';
import 'package:npng/generated/l10n.dart';

import '../../config.dart';

class WorkoutSetPage extends StatefulWidget {
  static const String id = '/set';

  @override
  _WorkoutSetPageState createState() => _WorkoutSetPageState();
}

class _WorkoutSetPageState extends State<WorkoutSetPage> {
  TextEditingController tcRepeats = TextEditingController(text: '');

  int _currentStep = 0;
  int _currentAction = 0;

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(title: Text('Жим лёжа')),
      body: SafeArea(
        child: Theme(
          data: (darkModeOn) ? kMaterialDark : kMaterialLight,
          child: Material(
            type: MaterialType.transparency,
            child: Stepper(
              currentStep: _currentStep,
              controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                return Container();
              },
              onStepTapped: (int index) {
                setState(() {
                  _currentStep = index;
                });
              },
              steps: [
                Step(
                  isActive: true,
                  title: Text(
                    //TODO: Add 1 RM
                    "5 x 67 kg",
                    style: TextStyle(fontSize: 20.0),
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
                            value: 5,
                          ),
                          Text(S.of(context).weight),
                          MpChangeDoubleField(
                            value: 60.0,
                          ),
                          MpButton(
                            label: S.of(context).restButton,
                            onPressed: () =>
                                Navigator.pushNamed(context, TimerPage.id),
                          ),
                        ],
                      )),
                ),
                Step(
                  isActive: false,
                  title: Text(
                    //TODO: Add 1 RM
                    "5 x 67 kg",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  content: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(S.of(context).repeats),
                          MpChangeIntField(
                            value: 5,
                          ),
                          Text(S.of(context).weight),
                          MpChangeDoubleField(
                            value: 60.0,
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: (isApple)
              ? CupertinoTheme.of(context).barBackgroundColor
              : Theme.of(context).bottomAppBarColor,
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Text(
            //   '${Provider.of<SetRestProvider>(context).currentSet} ${S.of(context).from} ${Provider.of<SetRestProvider>(context).sets}',
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            //   textAlign: TextAlign.center,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MpButton(
                  label: 'Add set',
                  onPressed: () {},
                ),
                MpButton(
                  label: 'Remove set',
                  onPressed: () {},
                ),
                MpButton(
                  label: 'Finish',
                  onPressed: () {
                    //TODO: Dialog with promise to add all data and
                  },
                ),
                // MpButton(
                //   label: S.of(context).finish,
                //   onPressed: () {},
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
