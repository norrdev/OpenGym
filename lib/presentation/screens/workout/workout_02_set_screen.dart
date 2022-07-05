import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npng/logic/cubit/workout_cubit.dart';
import 'package:npng/widgets/change_double_field_extended.dart';
import 'package:npng/widgets/change_int_field.dart';
import 'package:steps_indicator/steps_indicator.dart';

import 'package:npng/generated/l10n.dart';
import 'package:npng/presentation/screens/workout/workout_03_timer_screen.dart';

class WorkoutSetScreen extends StatelessWidget {
  static const String id = '/set';

  const WorkoutSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<WorkoutCubit, WorkoutState>(
          builder: (_, wk) {
            return Text(wk.exercises[wk.currentExcersise].name);
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
                        context.read<WorkoutCubit>().manualRemoveOneSet(),
                  ),
                  BlocBuilder<WorkoutCubit, WorkoutState>(
                    builder: (context, workout) {
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
                      // TODO: move in Theme
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
                        context.read<WorkoutCubit>().manualAddOneSet(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<WorkoutCubit, WorkoutState>(
                builder: (_, workout) {
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
    super.key,
    required this.setNumber,
  });

  final int setNumber;

  @override
  Widget build(BuildContext context) {
    WorkoutCubit workout = context.read<WorkoutCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).weight),
        ChangeDoubleFieldExtended(
          value: workout.state.exercises[workout.state.currentExcersise]
              .sets[setNumber].weight,
          increaseCallback: () => workout.incWeight025(
              excersiseNumber: workout.state.currentExcersise,
              setNumber: setNumber),
          decreaseCallback: () => workout.decWeight025(
              excersiseNumber: workout.state.currentExcersise,
              setNumber: setNumber),
          increaseCallbackFast: () => workout.incWeight5(
              excersiseNumber: workout.state.currentExcersise,
              setNumber: setNumber),
          decreaseCallbackFast: () => workout.decWeight5(
              excersiseNumber: workout.state.currentExcersise,
              setNumber: setNumber),
        ),
        Text(S.of(context).repeats),
        ChangeIntField(
          value: workout.state.exercises[workout.state.currentExcersise]
              .sets[setNumber].repeats,
          decreaseCallback: () => workout.decRepeats(
              excersiseNumber: workout.state.currentExcersise,
              setNumber: setNumber),
          increaseCallback: () => workout.incRepeats(
              excersiseNumber: workout.state.currentExcersise,
              setNumber: setNumber),
        ),
      ],
    );
  }
}
