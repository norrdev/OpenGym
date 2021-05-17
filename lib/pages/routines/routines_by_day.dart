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
    await db.transaction((txn) async {
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
                  child: Column(
                    children: [
                      ListTile(
                          title: Text(item['name']),
                          subtitle: Text(item['description'] ?? '')
                          // (item['description'] != null)
                          //     ? Text(item['description'])
                          //     : null,
                          ),
                      Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text(S.of(context).sets),
                                MpChangeIntField(value: item['sets']),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width / 2 - 8,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text(S.of(context).rest),
                                MpChangeIntField(value: item['repeats']),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width / 2 - 8,
                          ),
                        ],
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
