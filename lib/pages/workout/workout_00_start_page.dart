import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/pages/programs/programs_page.dart';
import 'package:npng/pages/workout/workout_01_process_page.dart';
import 'package:npng/widgets/bottom_bar.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/db.dart';

class WorkoutStartPage extends StatefulWidget {
  static const String id = '/';

  @override
  _WorkoutStartPageState createState() => _WorkoutStartPageState();
}

class _WorkoutStartPageState extends State<WorkoutStartPage> {
  int defRoutine = 0;
  List<Map<String, dynamic>> _days = [];

  @override
  void initState() {
    _getDefaultRoutine();
    super.initState();
  }

  void _getDefaultRoutine() async {
    List<Map<String, dynamic>> _user = [];
    _user = await db!.query('user', where: 'id = ?', whereArgs: [1]);
    defRoutine = _user.first['programs_id'] ?? 0;
    _refresh();
  }

  void _refresh() async {
    _days = await db!.query(
      'days',
      columns: [
        'id',
        'ord',
        '${kLocale}_name AS name',
        '${kLocale}_description AS description',
        'programs_id'
      ],
      orderBy: 'ord',
      where: 'programs_id = ?',
      whereArgs: [defRoutine],
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Getting locale. Must be on main screen!
    kLocale = Localizations.localeOf(context);
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).pageWorkout),
      ),
      body: (defRoutine == 0)
          ? Row(
              // if default == NULL
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 3,
                    child: MpButton(
                      label: 'Select',
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                          context, ProgramsPage.id, (route) => false),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ])
          : Container(
              //TODO: Make here button or special screen, if workout in process.
              constraints: BoxConstraints.expand(),
              child: SafeArea(
                child: ListView.builder(
                  itemCount: _days.length,
                  itemBuilder: (context, index) {
                    final item = _days[index];
                    return Material(
                      type: MaterialType.transparency,
                      child: ListTile(
                        title: Text(item['name']),
                        subtitle: Text(item['description']),
                        onTap: () => Navigator.push(
                          context,
                          mpPageRoute(
                            builder: (context) {
                              return WorkoutProcessPage(
                                dayId: item['id'],
                              );
                            },
                          ),
                        ),
                        // trailing: Icon(
                        //   (isApple)
                        //       ? CupertinoIcons.play_circle
                        //       : Icons.play_circle,
                        //   color: Theme.of(context).accentColor,
                        // ),
                      ),
                    );
                  },
                ),
              ),
            ),
      bottomNavigationBar: BottomBar(initialActiveIndex: 0),
    );
  }
}
