import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/workout.dart';
import '../../../data/models/log_day.dart';
import '../../../data/models/log_workout.dart';
import '../../../data/repository.dart';
import '../../../generated/l10n.dart';

/// Traning volume wrapper
class TraningVolume {
  double value;
  TraningVolume(this.value);

  void add(double amount) {
    value = value + amount;
  }
}

class LogWorkoutScreen extends StatefulWidget {
  final LogDay logDay;
  const LogWorkoutScreen({super.key, required this.logDay});

  @override
  State<LogWorkoutScreen> createState() => _LogWorkoutScreenState();
}

class _LogWorkoutScreenState extends State<LogWorkoutScreen> {
  List<LogWorkout> workouts = [];

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    MarkdownStyleSheet style = MarkdownStyleSheet.fromTheme(Theme.of(context));

    DateTime start = DateTime.parse(widget.logDay.start as String);
    DateTime finish = DateTime.parse(widget.logDay.finish as String);
    String duration = finish.difference(start).inMinutes.toString();
    double trainingVolume = 0.0;
    double traningDistance = 0.0;
    int traningRepeats = 0;
    int traningTime = 0;
    double exTrainingVolume = 0.0;
    int exRepeats = 0;
    int exTime = 0;
    double exDistance = 0.0;
    String output =
        '${S.of(context).wrkDuration}: $duration ${S.of(context).min}\n\r \n\r';

    String flagName = '';
    int count = 0;

    for (LogWorkout item in workouts) {
      if (flagName != item.name) {
        // Traning volume under exercise.
        if (exTrainingVolume > 0) {
          output +=
              '\n\r *${S.of(context).total}: ${exTrainingVolume.toStringAsFixed(2)} kg* \n\r';
          trainingVolume += exTrainingVolume;
          exTrainingVolume = 0.0;
        }
        if (exRepeats > 0) {
          output += '\n\r *${S.of(context).total}: $exRepeats* \n\r';
          traningRepeats += exRepeats;
          exRepeats = 0;
        }
        if (exTime > 0) {
          output += '\n\r *${S.of(context).total}: $exTime* s. \n\r';
          traningTime += exTime;
          exTime = 0;
        }
        if (exDistance > 0) {
          output += '\n\r *${S.of(context).total}: $exDistance* s. \n\r';
          traningDistance += exDistance;
          exDistance = 0;
        }
        output += '**${item.name}** \n\r';
        flagName = item.name as String;
        count = 0;
      }

      switch (item.loadId) {
        case kLoadWeight:
          if (item.limbs == 1) {
            output += '\n\r ${count + 1}. ${item.weight} kg X ${item.repeats}';
            exTrainingVolume += (item.weight ?? 0) * (item.repeats ?? 0);
          }

          if (item.limbs == 2) {
            output +=
                '\n\r ${count + 1}. L: ${item.weightLeft} kg X ${item.repeatsLeft}, R: ${item.weight} kg X ${item.repeats}';
            exTrainingVolume +=
                (item.weightLeft ?? 0) * (item.repeatsLeft ?? 0) +
                    (item.weight ?? 0) * (item.repeats ?? 0);
          }
          break;
        case kLoadRepeats:
          output += '\n\r ${count + 1}. ${item.repeats}';
          exRepeats += item.repeats ?? 0;
          break;
        case kLoadTime:
          output += '\n\r ${count + 1}. ${item.timeLoad} s';
          exTime += item.timeLoad ?? 0;
          break;
        case kLoadDistance:
          output += '\n\r ${count + 1}. ${item.distance}';
          exDistance += item.distance ?? 0;
          break;
        default:
      }
      count++;
    }
    // Last one
    output +=
        '\n\r *${S.of(context).total}: ${exTrainingVolume.toStringAsFixed(2)} kg* \n\r';
    trainingVolume += exTrainingVolume;
    // Global
    output +=
        '\n\r **${S.of(context).wrkTrainingVolume}**: $trainingVolume kg\n\r';

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.logDay.daysName as String),
        ),
        body: SafeArea(
          child: Markdown(
            data: output,
            controller: controller,
            selectable: false,
            styleSheet: style,
            onTapLink: (text, href, title) => launchUrl(Uri.parse(href ?? '')),
          ),
        ));
  }

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  void _refresh() async {
    workouts = await context
        .read<Repository>()
        .findLogWorkoutByDay(widget.logDay.logDayId as int);
    setState(() {});
  }
}
