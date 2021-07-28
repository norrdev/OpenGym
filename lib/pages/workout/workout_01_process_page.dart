import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/db.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/pages/workout/workout_02_set_page.dart';
import 'package:npng/pages/workout/workout_00_start_page.dart';
import 'package:npng/state/workout_provider.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

class WorkoutProcessPage extends StatefulWidget {
  static const String id = 'TrainProcessPage';
  final int? dayId;

  WorkoutProcessPage({Key? key, this.dayId}) : super(key: key);

  @override
  _WorkoutProcessPageState createState() => _WorkoutProcessPageState();
}

class _WorkoutProcessPageState extends State<WorkoutProcessPage> {
  List<Map<String, dynamic>> _results = [];
  List<Map<String, dynamic>> _resultsMutable = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    _results = await db!.rawQuery('''
SELECT workouts.id AS id, exercises.name AS name, exercises.description as description, sets, ord, repeats, rest, weight FROM workouts 
JOIN exercises on workouts.exerscises_id = exercises.id 
WHERE days_id = ${widget.dayId} ORDER BY ord;
    ''');
    _resultsMutable.clear();
    _resultsMutable.addAll(_results);
    setState(() {});
  }

  void _updateOrder({int? id, int? ord}) async {
    await db!.transaction((txn) async {
      for (int i = 0; i <= _resultsMutable.length - 1; i++) {
        await txn.update(
          'workouts',
          {'ord': i},
          where: 'id = ?',
          whereArgs: [_resultsMutable[i]['id']],
        );
      }
    });
  }

  void _onReorder(int oldIndex, int newIndex) {
    if (!Provider.of<WorkoutProvider>(context, listen: false).active) {
      setState(() {
        if (newIndex > oldIndex) newIndex -= 1;
        final Map<String, dynamic> item = _resultsMutable.removeAt(oldIndex);
        _resultsMutable.insert(newIndex, item);
        _updateOrder(id: item['id'], ord: newIndex);
        _init();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).currentWorkout),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: (_resultsMutable.length > 0)
              ? Theme(
                  data: (darkModeOn) ? kMaterialDark : kMaterialLight,
                  child: (!Provider.of<WorkoutProvider>(context, listen: false)
                          .active)
                      ? buildReorderableListView()
                      : buildListView(),
                )
              //TODO: Create warning screen.
              : Container(child: Text(S.of(context).noex)),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            (!Provider.of<WorkoutProvider>(context, listen: false).active)
                // Start workout
                ? MpButton(
                    label: S.of(context).start,
                    onPressed: () {
                      Provider.of<WorkoutProvider>(context, listen: false)
                          .resetAllData();
                      Provider.of<WorkoutProvider>(context, listen: false)
                          .dayID = widget.dayId!;
                      Provider.of<WorkoutProvider>(context, listen: false)
                          .loadEx(_resultsMutable);

                      Provider.of<WorkoutProvider>(context, listen: false)
                          .startTime = DateTime.now();
                      Provider.of<WorkoutProvider>(context, listen: false)
                          .active = true;
                      Wakelock.enable();
                      Navigator.pushNamed(context, WorkoutSetPage.id)
                          .whenComplete(() => _init());
                    },
                  )
                // Continue or finish workout
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (!Provider.of<WorkoutProvider>(context, listen: false)
                          .finished)
                        MpButton(
                          label: S.of(context).ccontinue,
                          onPressed: () =>
                              Navigator.pushNamed(context, WorkoutSetPage.id)
                                  .whenComplete(() => _init()),
                        ),
                      SizedBox(width: 16.0),
                      MpButton(
                        label: S.of(context).finish,
                        onPressed: () {
                          // Provider.of<WorkoutProvider>(context, listen: false)
                          //     .resetAllData();
                          Wakelock.disable();
                          Navigator.pushAndRemoveUntil(
                              context,
                              PageTransition(
                                child: WorkoutStartPage(),
                                type: PageTransitionType.fade,
                              ),
                              (route) => false);
                        },
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  /// This shows before start. Can reorder items.
  ReorderableListView buildReorderableListView() {
    return ReorderableListView.builder(
      onReorder: _onReorder,
      itemCount: _resultsMutable.length,
      itemBuilder: (context, index) {
        final item = _resultsMutable[index];
        return Material(
          type: MaterialType.transparency,
          key: ValueKey(item),
          child: ListTile(
            title: Text(item['name']),
            subtitle: Text(item['description'] ?? ''),
          ),
        );
      },
    );
  }

  /// This shows after start. Do not allows to reorder items.
  ListView buildListView() {
    return ListView.builder(
      itemCount: _resultsMutable.length,
      itemBuilder: (context, index) {
        final item = _resultsMutable[index];
        return Material(
          type: MaterialType.transparency,
          key: ValueKey(item),
          child: ListTile(
            //TODO: Show status of excersises, check completed.
            leading: (Provider.of<WorkoutProvider>(context, listen: false)
                    .excersiseCompleted(index))
                ? Icon(
                    Icons.done,
                    color: Theme.of(context).accentColor,
                  )
                : Icon(
                    Icons.fitness_center,
                    //color: Theme.of(context).accentColor,
                  ),

            title: Text(item['name']),
            subtitle: Text(item['description'] ?? ''),
          ),
        );
      },
    );
  }
}
