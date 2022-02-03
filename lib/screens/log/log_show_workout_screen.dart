import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:npng/data/models/log_day.dart';
import 'package:npng/data/models/log_workout.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:provider/src/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LogWorkoutScreen extends StatefulWidget {
  const LogWorkoutScreen({Key? key, required this.logday}) : super(key: key);
  final LogDay logday;

  @override
  _LogWorkoutScreenState createState() => _LogWorkoutScreenState();
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
    String output = S.of(context).wrkDuration +
        ': $duration ' +
        S.of(context).min +
        '\n\r \n\r';

    String flagName = '';
    int count = 0;

    for (LogWorkout item in workouts) {
      if (flagName != item.name) {
        output += '**${item.name}** \n\r';
        flagName = item.name as String;
        count = 0;
      }
      output += '${count + 1}. ${item.weight} kg X ${item.repeat}\n\r';
    }

    return MpScaffold(
        appBar: MpAppBar(
          title: Text(widget.logday.daysName as String),
        ),
        body: SafeArea(
          child: Markdown(
            data: output,
            controller: controller,
            selectable: false,
            styleSheet: style,
            //styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
            //onTapLink: (href) => launch(href),
            onTapLink: (text, href, title) => launch(href!),
          ),
        ));
  }
}
