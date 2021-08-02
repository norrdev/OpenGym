import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:npng/config.dart';
import 'package:npng/db.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/state/workout_provider.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LogShowWorkoutPage extends StatefulWidget {
  final int? logDayId;
  final String? name;
  const LogShowWorkoutPage({Key? key, this.logDayId, this.name})
      : super(key: key);

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
    _resultsEx = await db!.rawQuery('''
    select log_days.id AS logDaysId, log_days.days_id AS daysId, start, days.${kLocale}_name AS daysName,
    routines.${kLocale}_name as routinesName
    from log_days
    join days on log_days.days_id = days.id 
    join routines on days.routines_id = routines.id
    WHERE log_days.id = ${widget.logDayId}
    ORDER BY logDaysId
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
    String output = 'Продолжительность тренировки:  минут. \n\r';

    for (Map<String, dynamic> item in _resultsEx) {
      output += '';
    }

    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).workoutFinished),
      ),
      body: SafeArea(
        child: Markdown(
          data: output,
          controller: controller,
          selectable: false,
          styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
          //onTapLink: (href) => launch(href),
          onTapLink: (text, href, title) => launch(href!),
        ),
      ),
    );
  }
}
