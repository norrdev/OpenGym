import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/db.dart';
import 'package:npng/pages/routines/add_excersise.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';

class RoutinesByDayPage extends StatefulWidget {
  static String id = 'routines_by_day';
  final String pageTitle;
  final int dayId;

  RoutinesByDayPage({@required this.pageTitle, @required this.dayId});

  @override
  _RoutinesByDayPageState createState() => _RoutinesByDayPageState();
}

class _RoutinesByDayPageState extends State<RoutinesByDayPage> {
  List<Map<String, dynamic>> _results = [];
  List<Map<String, dynamic>> _resultsMutable = [];

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() async {
    _results = await db.rawQuery('''
SELECT workouts.id AS id, exercises.name AS name, exercises.description as description, sets, ord, repeats, rest FROM workouts 
JOIN exercises on workouts.exerscises_id = exercises.id 
WHERE days_id = ${widget.dayId} ORDER BY ord;
    ''');
    _resultsMutable.addAll(_results);
    setState(() {});
  }

  void _updateOrder({int id, int ord}) async {
    //BUG: must reorder all items on UPDATE
    // https://stackoverflow.com/questions/812630/how-can-i-reorder-rows-in-sql-database
    await db.transaction((txn) async {
      await txn.update(
        'workouts',
        {'ord': ord},
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(widget.pageTitle),
        trailing: MpFlatButton(
          padding: EdgeInsets.all(8),
          child: Icon(CupertinoIcons.add),
          onPressed: () => Navigator.push(
            context,
            mpPageRoute(
              builder: (context) {
                return AddExcersisePage(dayId: widget.dayId);
              },
            ),
          ).whenComplete(() => _refresh()),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Theme(
            data: (darkModeOn) ? kMaterialDark : kMaterialLight,
            child: ReorderableListView.builder(
              onReorder: _onReorder,
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final item = _resultsMutable[index];
                return Card(
                  key: ValueKey(item),
                  child: Row(
                    children: [
                      Container(
                        child: Text(item['name']),
                        width: MediaQuery.of(context).size.width / 2.0 - 8.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        //TODO: Sets and reps editor
                        child: Text(item['sets'].toString()),
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(item['repeats'].toString()),
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final Map<String, dynamic> item = _resultsMutable.removeAt(oldIndex);
      _resultsMutable.insert(newIndex, item);
      _updateOrder(id: item['id'], ord: newIndex);
      _refresh();
    });
  }
}