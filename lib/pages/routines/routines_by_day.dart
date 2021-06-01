import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/db.dart';
import 'package:npng/pages/routines/add_excersise.dart';
import 'package:npng/widgets/modal_popups.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';

class RoutinesByDayPage extends StatefulWidget {
  static String id = 'routines_by_day';
  final String? pageTitle;
  final int? dayId;

  RoutinesByDayPage({required this.pageTitle, required this.dayId});

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
    _results = await db!.rawQuery('''
SELECT workouts.id AS id, exercises.name AS name, exercises.description as description, sets, ord, repeats, rest FROM workouts 
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

  void _updateSets({int? id, int? sets}) async {
    await db!.update(
      'workouts',
      {'sets': sets},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  void _updateRepeats({int? id, int? repeats}) async {
    await db!.update(
      'workouts',
      {'repeats': repeats},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  void _updateRest({int? id, int? rest}) async {
    await db!.update(
      'workouts',
      {'rest': rest},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  void _deleteRow({int? id}) async {
    await db!.delete(
      'workouts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(widget.pageTitle!),
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
              itemCount: _resultsMutable.length,
              itemBuilder: (context, index) {
                final item = _resultsMutable[index];
                return Card(
                  key: ValueKey(item),
                  child: Column(
                    children: [
                      ExpansionTile(
                        title: Text(item['name']),
                        subtitle: Text(item['description'] ?? ''),
                        trailing: IconButton(
                            onPressed: () {
                              if (!isApple) {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Delete something'),
                                    content: const Text('Are you shure?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _deleteRow(id: item['id']);
                                          _refresh();
                                          Navigator.pop(context, 'OK');
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                    title: const Text('Delete something'),
                                    content: const Text('Are you shure?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _deleteRow(id: item['id']);
                                          _refresh();
                                          Navigator.pop(context, 'OK');
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            icon: Icon(Icons.delete)),
                        children: [
                          Column(
                            children: [
                              Text(S.of(context).sets),
                              MpChangeIntField(
                                  value: item['sets'],
                                  decreaseCallback: () => _decreaseSets(index),
                                  increaseCallback: () => _increaseSets(index)),
                            ],
                          ),
                          Column(
                            children: [
                              Text(S.of(context).repeats),
                              MpChangeIntField(
                                value: item['repeats'],
                                decreaseCallback: () => _decreaseRepeats(index),
                                increaseCallback: () => _increseRepeats(index),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(S.of(context).rest),
                              MpChangeIntField(
                                value: item['rest'],
                                decreaseCallback: () => _decreaseRest(index),
                                increaseCallback: () => _increaseRest(index),
                              ),
                            ],
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

  void _decreaseSets(int index) {
    setState(() {
      if (_resultsMutable[index]['sets'] > 1) {
        _updateSets(
            id: _resultsMutable[index]['id'],
            sets: _resultsMutable[index]['sets'] - 1);
        _refresh();
      }
    });
  }

  void _increaseSets(int index) {
    setState(() {
      _updateSets(
          id: _resultsMutable[index]['id'],
          sets: _resultsMutable[index]['sets'] + 1);
      _refresh();
    });
  }

  void _decreaseRepeats(int index) {
    setState(() {
      if (_resultsMutable[index]['sets'] > 1) {
        _updateRepeats(
          id: _resultsMutable[index]['id'],
          repeats: _resultsMutable[index]['repeats'] - 1,
        );
        _refresh();
      }
    });
  }

  void _increseRepeats(int index) {
    setState(() {
      _updateRepeats(
        id: _resultsMutable[index]['id'],
        repeats: _resultsMutable[index]['repeats'] + 1,
      );
      _refresh();
    });
  }

  void _decreaseRest(int index) {
    setState(() {
      if (_resultsMutable[index]['rest'] > 5) {
        _updateRest(
            id: _resultsMutable[index]['id'],
            rest: _resultsMutable[index]['rest'] - 5);
        _refresh();
      }
    });
  }

  void _increaseRest(int index) {
    setState(() {
      _updateRest(
          id: _resultsMutable[index]['id'],
          rest: _resultsMutable[index]['rest'] + 5);
      _refresh();
    });
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
