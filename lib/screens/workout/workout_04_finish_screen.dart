import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

import 'package:npng/data/models/workout_provider.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/main_screen.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WorkoutFinishScreen extends StatelessWidget {
  const WorkoutFinishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    final wp = context.read<WorkoutProvider>();
    DateTime? start = wp.startTime;
    DateTime? finish = wp.finishTime;
    String duration = finish!.difference(start!).inMinutes.toString();
    String output = S.of(context).wrkDuration +
        ': $duration ' +
        S.of(context).min +
        '\n\r \n\r';

    for (Exerscise item in wp.excersises) {
      output += '**${item.name}**\n\r';
      for (int i = 0; i < item.sets.length; i++) {
        output +=
            '${i + 1}. ${item.sets[i].weight} kg X ${item.sets[i].repeats}\n\r';
      }
    }

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
              wp.active = false;
              wp.finished = true;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
                (route) => false,
              );
            },
          ),
        ),
      ],
    );
  }
}