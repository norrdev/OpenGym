import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npng/logic/cubit/workout_cubit.dart';
import 'package:npng/widgets/change_double_field_extended.dart';
import 'package:npng/widgets/change_int_field.dart';

import 'package:npng/generated/l10n.dart';
import 'package:npng/presentation/screens/workout/workout_03_timer_screen.dart';
import 'package:steps_indicator/steps_indicator.dart';

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
                    builder: (context, state) {
                      final maxSet = state.maxSet;
                      final currentSet = state.currentSet;
                      int mSet = maxSet + 1;
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
                        selectedStep: currentSet,
                        nbSteps: maxSet + 1,
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
            const Expanded(
              child: CurrentSetWidget(),
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
  });

  @override
  Widget build(BuildContext context) {
    WorkoutCubit workoutCubit = context.read<WorkoutCubit>();
    int setNumber = workoutCubit.state.currentSet;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).weight),
        BlocBuilder<WorkoutCubit, WorkoutState>(
          builder: (_, state) {
            return ChangeDoubleFieldExtended(
              value: state
                  .exercises[state.currentExcersise].sets[setNumber].weight,
              increaseCallback: () => workoutCubit.incWeight025(
                  excersiseNumber: state.currentExcersise,
                  setNumber: setNumber),
              decreaseCallback: () => workoutCubit.decWeight025(
                  excersiseNumber: state.currentExcersise,
                  setNumber: setNumber),
              increaseCallbackFast: () => workoutCubit.incWeight5(
                  excersiseNumber: state.currentExcersise,
                  setNumber: setNumber),
              decreaseCallbackFast: () => workoutCubit.decWeight5(
                  excersiseNumber: state.currentExcersise,
                  setNumber: setNumber),
            );
          },
        ),
        Text(S.of(context).repeats),
        BlocBuilder<WorkoutCubit, WorkoutState>(
          builder: (_, state) {
            return ChangeIntField(
              value: workoutCubit
                  .state
                  .exercises[workoutCubit.state.currentExcersise]
                  .sets[setNumber]
                  .repeats,
              decreaseCallback: () => workoutCubit.decRepeats(
                  excersiseNumber: workoutCubit.state.currentExcersise,
                  setNumber: setNumber),
              increaseCallback: () => workoutCubit.incRepeats(
                  excersiseNumber: workoutCubit.state.currentExcersise,
                  setNumber: setNumber),
            );
          },
        ),
      ],
    );
  }
}
