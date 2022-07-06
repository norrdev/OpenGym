import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:npng/data/models/workout_exercise.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/logic/cubit/workout_cubit.dart';
import 'package:npng/presentation/screens/main_screen.dart';

class WorkoutFinishScreen extends StatelessWidget {
  const WorkoutFinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    final wp = context.read<WorkoutCubit>();
    DateTime? start = wp.state.startTime;
    DateTime? finish = wp.state.finishTime;
    double trainingVolume = 0.0;
    double exTrainingVolume = 0.0;

    String duration = finish!.difference(start!).inMinutes.toString();
    String output =
        '${S.of(context).wrkDuration}: $duration ${S.of(context).min}';

    for (WorkoutExercise item in wp.state.exercises) {
      output += '\n\r**${item.name}**';
      for (int i = 0; i < item.sets.length; i++) {
        output +=
            '\n\r ${i + 1}. ${item.sets[i].weight} kg X ${item.sets[i].repeats}';
        exTrainingVolume += item.sets[i].weight * item.sets[i].repeats;
      }
      output +=
          '\n\r *${S.of(context).total}: ${exTrainingVolume.toStringAsFixed(2)} kg* \n\r';
      trainingVolume += exTrainingVolume;
      exTrainingVolume = 0.0;
    }

    output +=
        '\n\r **${S.of(context).wrkTrainingVolume}**: $trainingVolume kg\n\r';

    MarkdownStyleSheet style = MarkdownStyleSheet.fromTheme(Theme.of(context));

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).workoutFinished),
      ),
      body: SafeArea(
        child: Markdown(
          data: output,
          controller: controller,
          selectable: false,
          styleSheet: style,
          onTapLink: (text, href, title) => launchUrlString(href!),
        ),
      ),
      persistentFooterButtons: [
        Center(
          child: ElevatedButton(
            child: Text(S.of(context).saveToLog),
            onPressed: () async {
              final repository =
                  Provider.of<Repository>(context, listen: false);
              await repository.insertLog(context);
              wp.finishWorkout();
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
}
