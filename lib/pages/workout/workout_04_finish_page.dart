import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:npng/config.dart';
import 'package:npng/db.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/pages/workout/workout_00_start_page.dart';
import 'package:npng/state/workout_provider.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkoutFinishPage extends StatelessWidget {
  const WorkoutFinishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    final wp = context.read<WorkoutProvider>();
    DateTime? start = wp.startTime;
    DateTime? finish = wp.finishTime;
    String duration = finish!.difference(start!).inMinutes.toString();
    String output = S.of(context).wrkDuration +
        ": $duration " +
        S.of(context).min +
        "\n\r \n\r";

    for (Exerscise item in wp.excersises) {
      output += '**${item.name}**\n\r';
      for (int i = 0; i < item.sets.length; i++) {
        output +=
            '${i + 1}. ${item.sets[i].weight} kg X ${item.sets[i].repeats}\n\r';
      }
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: (isApple)
              ? CupertinoTheme.of(context).barBackgroundColor
              : Theme.of(context).bottomAppBarColor,
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          MpButton(
            label: S.of(context).saveToLog,
            onPressed: () async {
              int logDaysId = 0;
              // Save to table log_days
              final wp = context.read<WorkoutProvider>();
              logDaysId = await db!.insert('log_days', {
                'start': start.toLocal().toString(),
                'finish': finish.toLocal().toString(),
                'days_id': wp.dayID,
              });
              await db!.transaction((txn) async {
                for (Exerscise item in wp.excersises) {
                  for (int i = 0; i < item.sets.length; i++) {
                    await txn.insert('log_ex', {
                      'log_days_id': logDaysId,
                      'exercises_id': item.id,
                      'repeat': item.sets[i].repeats,
                      'weight': item.sets[i].weight,
                    });
                  }
                }
              });
              Navigator.pushAndRemoveUntil(
                  context,
                  PageTransition(
                    child: WorkoutStartPage(),
                    type: PageTransitionType.fade,
                  ),
                  (route) => false);
            },
          )
        ]),
      ),
    );
  }
}
