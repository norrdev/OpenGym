import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/workout.dart';
import '../../../data/models/workout_exercise.dart';
import '../../../generated/l10n.dart';
import '../../../logic/cubit/workout_cubit.dart';
import '../main_screen.dart';

/// Traning volume wrapper
class TraningVolume {
  double value;
  TraningVolume(this.value);

  void add(double amount) {
    value = value + amount;
  }
}

class WorkoutFinishScreen extends StatelessWidget {
  const WorkoutFinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    final wp = context.read<WorkoutCubit>();
    DateTime? start = wp.state.startTime;
    DateTime? finish = wp.state.finishTime;
    TraningVolume trainingVolume = TraningVolume(0.0);
    String duration =
        finish?.difference(start ?? DateTime.now()).inMinutes.toString() ?? '';

    String output =
        '${S.of(context).wrkDuration}: $duration ${S.of(context).min}';

    for (WorkoutExercise item in wp.state.exercises) {
      output += '\n\r### ${item.name}';

      switch (item.loadId) {
        case kLoadWeight:
          output += exerciseBasedOnWeight(context, item, trainingVolume);
          break;
        case kLoadRepeats:
          output += exerciseBasedOnRepeats(context, item);
          break;
        case kLoadTime:
          output += exerciseBasedOnTime(context, item);
          break;
        case kLoadDistance:
          output += exerciseBasedOnDistance(context, item);
          break;
        default:
      }
    }

    // TODO move wp.finishWorkout(context); here
    output +=
        '**${S.of(context).wrkTrainingVolume}**: ${trainingVolume.value} kg';

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).workoutFinished),
      ),
      body: SafeArea(
        child: Markdown(
          data: output,
          controller: controller,
          selectable: false,
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)),
          onTapLink: (text, href, title) => launch(href!),
          //launchUrlString(href!),
        ),
      ),
      persistentFooterButtons: [
        Center(
          child: ElevatedButton(
            child: Text(S.of(context).saveToLog),
            onPressed: () {
              // TODO move from here
              wp.finishWorkout(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
                (route) => false,
              );
            },
          ),
        ),
      ],
    );
  }

  String exerciseBasedOnRepeats(BuildContext context, WorkoutExercise item) {
    String output = '';

    int totalRepeats = 0;

    for (int i = 0; i < item.sets.length; i++) {
      output += '\n\r ${i + 1}. ${item.sets[i].repeats}';
      totalRepeats += item.sets[i].repeats ?? 0;
    }
    output +=
        '\n\r *${S.of(context).total}: $totalRepeats ${S.of(context).repeats}* \n\r';

    return output;
  }

  String exerciseBasedOnTime(BuildContext context, WorkoutExercise item) {
    String output = '';
    int totalTime = 0;

    for (int i = 0; i < item.sets.length; i++) {
      output += '\n\r ${i + 1}. ${item.sets[i].timeLoad} s';
      totalTime += item.sets[i].timeLoad ?? 0;
    }

    output += '\n\r *${S.of(context).total}: $totalTime s* \n\r';

    return output;
  }

  String exerciseBasedOnDistance(BuildContext context, WorkoutExercise item) {
    String output = '';
    double totalDistance = 0.0;

    for (int i = 0; i < item.sets.length; i++) {
      output += '\n\r ${i + 1}. ${item.sets[i].distance}';
      totalDistance += item.sets[i].distance ?? 0;
    }

    output +=
        '\n\r *${S.of(context).total}: ${totalDistance.toStringAsFixed(3)}* \n\r';

    return output;
  }

  String exerciseBasedOnWeight(
      BuildContext context, WorkoutExercise item, TraningVolume traningVolume) {
    String output = '';
    double exTrainingVolume = 0;

    if (item.limbs == 1) {
      for (int i = 0; i < item.sets.length; i++) {
        output +=
            '\n\r ${i + 1}. ${item.sets[i].weight} kg X ${item.sets[i].repeats}';
        exTrainingVolume +=
            (item.sets[i].weight ?? 0) * (item.sets[i].repeats ?? 0);
      }
    }

    if (item.limbs == 2) {
      for (int i = 0; i < item.sets.length; i++) {
        output +=
            '\n\r ${i + 1}. L: ${item.sets[i].weightLeft} kg X ${item.sets[i].repeatsLeft}, R: ${item.sets[i].weight} kg X ${item.sets[i].repeats}';
        exTrainingVolume +=
            (item.sets[i].weightLeft ?? 0) * (item.sets[i].repeatsLeft ?? 0) +
                (item.sets[i].weight ?? 0) * (item.sets[i].repeats ?? 0);
      }
    }
    traningVolume.add(exTrainingVolume);
    output +=
        '\n\r*${S.of(context).total}: ${exTrainingVolume.toStringAsFixed(2)} kg* \n\r';

    return output;
  }
}
