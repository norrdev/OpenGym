import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_indicator/steps_indicator.dart';

import '../../../constants/workout.dart';
import '../../../generated/l10n.dart';
import '../../../logic/cubit/workout_cubit.dart';
import '../../../widgets/help_icon_button.dart';
import '../../../widgets/widgets.dart';

class CurrentSetWidget extends StatelessWidget {
  const CurrentSetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WorkoutCubit workoutCubit = context.read<WorkoutCubit>();
    return BlocBuilder<WorkoutCubit, WorkoutState>(
      builder: (_, state) {
        if (kDebugMode) {
          print(
              '${state.exercises[state.currentExcersise].sets[state.currentSet]} '
              'Ex : ${state.currentExcersise} '
              'Set: ${state.currentSet}');
        }
        return ListView(
          children: [
            const SizedBox(height: 8),
            // Repeats
            if (state.exercises[state.currentExcersise].limbs == 1 &&
                state.exercises[state.currentExcersise].loadId != kLoadTime &&
                state.exercises[state.currentExcersise].loadId != kLoadDistance)
              Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: SpinEditInt(
                  key: ValueKey(state.exercises[state.currentExcersise]
                      .sets[state.currentSet].repeats),
                  label: S.of(context).repeats,
                  initialValue: state.exercises[state.currentExcersise]
                          .sets[state.currentSet].repeats ??
                      0,
                  onChange: (newValue) => workoutCubit.setRepeats(
                      excersiseNumber: state.currentExcersise,
                      setNumber: state.currentSet,
                      repeats: newValue.toInt()),
                ),
              ),
            if (state.exercises[state.currentExcersise].limbs == 2 &&
                state.exercises[state.currentExcersise].loadId != kLoadTime &&
                state.exercises[state.currentExcersise].loadId != kLoadDistance)
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                    child: SpinEditInt(
                      key: ValueKey(state.exercises[state.currentExcersise]
                          .sets[state.currentSet].repeatsLeft),
                      label: '${S.of(context).repeats} ${S.of(context).left}',
                      initialValue: state.exercises[state.currentExcersise]
                              .sets[state.currentSet].repeatsLeft ??
                          1,
                      onChange: (newValue) => workoutCubit.setRepeatsLeft(
                          excersiseNumber: state.currentExcersise,
                          setNumber: state.currentSet,
                          repeatsLeft: newValue.toInt()),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                    child: SpinEditInt(
                      key: ValueKey(state.exercises[state.currentExcersise]
                          .sets[state.currentSet].repeats),
                      label: '${S.of(context).repeats} ${S.of(context).right}',
                      initialValue: state.exercises[state.currentExcersise]
                              .sets[state.currentSet].repeats ??
                          1,
                      onChange: (newValue) => workoutCubit.setRepeats(
                          excersiseNumber: state.currentExcersise,
                          setNumber: state.currentSet,
                          repeats: newValue.toInt()),
                    ),
                  ),
                ],
              ),
            if (state.exercises[state.currentExcersise].limbs == 1 &&
                state.exercises[state.currentExcersise].loadId == kLoadWeight)
              Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: SpinEditDouble(
                  key: ValueKey(state.exercises[state.currentExcersise]
                      .sets[state.currentSet].weight),
                  label: S.of(context).weight,
                  initialValue: state.exercises[state.currentExcersise]
                          .sets[state.currentSet].weight ??
                      0,
                  onChange: (newValue) => workoutCubit.setWeight(
                      excersiseNumber: state.currentExcersise,
                      setNumber: state.currentSet,
                      weight: newValue.toDouble()),
                ),
              ),
            if (state.exercises[state.currentExcersise].limbs == 2 &&
                state.exercises[state.currentExcersise].loadId == kLoadWeight)
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                    child: SpinEditDouble(
                      key: ValueKey(state.exercises[state.currentExcersise]
                          .sets[state.currentSet].weightLeft),
                      label: '${S.of(context).weight} ${S.of(context).left}',
                      initialValue: state.exercises[state.currentExcersise]
                              .sets[state.currentSet].weightLeft ??
                          0,
                      onChange: (newValue) => workoutCubit.setWeightLeft(
                          excersiseNumber: state.currentExcersise,
                          setNumber: state.currentSet,
                          weightLeft: newValue.toDouble()),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                    child: SpinEditDouble(
                      key: ValueKey(state.exercises[state.currentExcersise]
                          .sets[state.currentSet].weight),
                      label: '${S.of(context).weight} ${S.of(context).right}',
                      initialValue: state.exercises[state.currentExcersise]
                              .sets[state.currentSet].weight ??
                          0,
                      onChange: (newValue) => workoutCubit.setWeight(
                          excersiseNumber: state.currentExcersise,
                          setNumber: state.currentSet,
                          weight: newValue.toDouble()),
                    ),
                  ),
                ],
              ),
            if (state.exercises[state.currentExcersise].loadId == kLoadTime)
              Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: SpinEditInt(
                  key: ValueKey(state.exercises[state.currentExcersise]
                      .sets[state.currentSet].timeLoad),
                  label: S.of(context).time,
                  initialValue: state.exercises[state.currentExcersise]
                          .sets[state.currentSet].timeLoad ??
                      0,
                  onChange: (newValue) => workoutCubit.setTimeLoad(
                      excersiseNumber: state.currentExcersise,
                      setNumber: state.currentSet,
                      timeLoad: newValue.toInt()),
                ),
              ),
            if (state.exercises[state.currentExcersise].loadId == kLoadDistance)
              SpinEditDouble(
                key: ValueKey(state.exercises[state.currentExcersise]
                    .sets[state.currentSet].distance),
                initialValue: state.exercises[state.currentExcersise]
                        .sets[state.currentSet].distance ??
                    0,
                onChange: (newValue) => workoutCubit.setDistance(
                    excersiseNumber: state.currentExcersise,
                    setNumber: state.currentSet,
                    distance: newValue.toDouble()),
                label: S.of(context).cooperDistanse,
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: SpinEditInt(
                key: ValueKey(state.currentSetRestTime),
                label: S.of(context).rest,
                initialValue: state.currentSetRestTime,
                onChange: (newValue) => workoutCubit.setRestForSet(
                    excersiseNumber: state.currentExcersise,
                    setNumber: state.currentSet,
                    rest: newValue.toInt()),
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}

class WorkoutSetScreen extends StatelessWidget {
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
        actions: [HelpIconButton(help: S.of(context).hintWorkoutSets)],
      ),
      persistentFooterButtons: [
        Center(
          child: ElevatedButton(
            child: Text(S.of(context).restButton),
            onPressed: () {
              Navigator.pushNamed(context, '/timer');
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
              child: BlocBuilder<WorkoutCubit, WorkoutState>(
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

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_rounded),
                        onPressed: () {
                          if (maxSet > 0) {
                            context.read<WorkoutCubit>().manualRemoveOneSet();
                          }
                        },
                      ),
                      StepsIndicator(
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
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                        onPressed: () {
                          context.read<WorkoutCubit>().manualAddOneSet();
                        },
                      ),
                    ],
                  );
                },
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
