import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:npng/config.dart';
import 'package:npng/db.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class LogShowWorkoutPage extends StatefulWidget {
  final int? logDayId;
  const LogShowWorkoutPage({Key? key, this.logDayId}) : super(key: key);

  @override
  _LogShowWorkoutPageState createState() => _LogShowWorkoutPageState();
}

class _LogShowWorkoutPageState extends State<LogShowWorkoutPage> {
  List<Map<String, dynamic>> _resultsEx = [];
  List<Map<String, dynamic>> _resultsDay = [];

  @override
  void initState() {
    _refreshDay();
    _refreshEx();
    super.initState();
  }

  void _refreshDay() async {
    _resultsDay = await db!.rawQuery('''
    SELECT log_days.id AS logDaysId,
          log_days.days_id AS daysId,
          start,
          finish,
          days.${kLocale}_name AS daysName,
          programs.${kLocale}_name AS programsName
      FROM log_days
          JOIN
          days ON log_days.days_id = days.id
          JOIN
          programs ON days.programs_id = programs.id
    WHERE log_days.id = ${widget.logDayId}
    ORDER BY logDaysId
    LIMIT 1;
    ''');
    setState(() {});
  }

  void _refreshEx() async {
    _resultsEx = await db!.rawQuery('''
    SELECT log_ex.exercises_id AS id,
          repeat,
          weight,
          exercises.${kLocale}_name AS name
    FROM log_ex
          JOIN
          exercises ON log_ex.exercises_id = exercises.id
    WHERE log_ex.log_days_id = ${widget.logDayId}
    ORDER BY log_ex.id;
   ''');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    DateTime start = DateTime.parse(_resultsDay.first['start'] as String);
    DateTime finish = DateTime.parse(_resultsDay.first['finish'] as String);
    String duration = finish.difference(start).inMinutes.toString();
    String output = S.of(context).wrkDuration +
        ': $duration ' +
        S.of(context).min +
        '\n\r \n\r';

    String flagName = '';
    int count = 0;

    for (Map<String, dynamic> item in _resultsEx) {
      if (flagName != item['name']) {
        output += "**${item['name']}** \n\r";
        flagName = item['name'] as String;
        count = 0;
      }
      output += '${count + 1}. ${item['weight']} kg X ${item['repeat']}\n\r';
    }

    // DateTime? start = wp.startTime;
    // DateTime? finish = wp.finishTime;
    // String duration = finish!.difference(start!).inMinutes.toString();
    // String output = 'Продолжительность тренировки: $duration минут. \n\r';

    // for (Exerscise item in wp.excersises) {
    //   output += '**${item.name}**\n\r';
    //   for (int i = 0; i < item.sets.length; i++) {
    //     output +=
    //         '${i + 1}. ${item.sets[i].weight} kg X ${item.sets[i].repeats}\n\r';
    //   }
    // }
    MarkdownStyleSheet style = MarkdownStyleSheet.fromTheme(Theme.of(context));

    return MpScaffold(
      appBar: MpAppBar(
        title: Text((_resultsDay.first['programsName'] as String) +
            ': ' +
            (_resultsDay.first['daysName'] as String)),
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
      ),
    );
  }
}
