import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:npng/data/models/log_day.dart';
import 'package:npng/data/models/log_workout.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LogWorkoutScreen extends StatefulWidget {
  const LogWorkoutScreen({super.key, required this.logday});
  final LogDay logday;

  @override
  State<LogWorkoutScreen> createState() => _LogWorkoutScreenState();
}

class _LogWorkoutScreenState extends State<LogWorkoutScreen> {
  List<LogWorkout> workouts = [];

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  void _refresh() async {
    workouts = await context
        .read<Repository>()
        .findLogWorkoutByDay(widget.logday.logDaysId as int);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    MarkdownStyleSheet style = MarkdownStyleSheet.fromTheme(Theme.of(context));

    DateTime start = DateTime.parse(widget.logday.start as String);
    DateTime finish = DateTime.parse(widget.logday.finish as String);
    String duration = finish.difference(start).inMinutes.toString();
    double trainingVolume = 0.0;
    double exTrainingVolume = 0.0;
    String output =
        '${S.of(context).wrkDuration}: $duration ${S.of(context).min}\n\r \n\r';

    String flagName = '';
    int count = 0;

    for (LogWorkout item in workouts) {
      if (flagName != item.name) {
        if (exTrainingVolume > 0) {
          output +=
              '\n\r *${S.of(context).total}: ${exTrainingVolume.toStringAsFixed(2)} kg* \n\r';
          trainingVolume += exTrainingVolume;
          exTrainingVolume = 0.0;
        }
        output += '**${item.name}** \n\r';
        flagName = item.name as String;
        count = 0;
      }
      output += '${count + 1}. ${item.weight} kg X ${item.repeat}\n\r';
      exTrainingVolume += item.weight! * item.repeat!;
    }
    output +=
        '\n\r *${S.of(context).total}: ${exTrainingVolume.toStringAsFixed(2)} kg* \n\r';
    trainingVolume += exTrainingVolume;
    output +=
        '\n\r **${S.of(context).wrkTrainingVolume}**: $trainingVolume kg\n\r';

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.logday.daysName as String),
        ),
        body: SafeArea(
          child: Markdown(
            data: output,
            controller: controller,
            selectable: false,
            styleSheet: style,
            onTapLink: (text, href, title) => launchUrl(Uri.parse(href!)),
          ),
        ));
  }
}
