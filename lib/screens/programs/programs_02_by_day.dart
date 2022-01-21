import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/data/sqlite/db.dart';
import 'package:npng/screens/programs/programs_add_excersise_page.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';

class ProgramsByDayPage extends StatefulWidget {
  static String id = 'programs_by_day';
  final String? pageTitle;
  final int? dayId;

  const ProgramsByDayPage(
      {Key? key, required this.pageTitle, required this.dayId})
      : super(key: key);

  @override
  _ProgramsByDayPageState createState() => _ProgramsByDayPageState();
}

class _ProgramsByDayPageState extends State<ProgramsByDayPage> {
  List<Map<String, dynamic>> _results = [];
  // ignore: prefer_final_fields
  List<Map<String, dynamic>> _resultsMutable = [];

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() async {
    _results = await db!.rawQuery('''
    SELECT workouts.id AS id, exercises.${kLocale}_name AS name, exercises.${kLocale}_description as description, sets, ord, repeats, rest FROM workouts 
    JOIN exercises on workouts.exercises_id = exercises.id 
    WHERE days_id = ${widget.dayId} ORDER BY ord;
    ''');
    setState(() {
      _resultsMutable.clear();
      _resultsMutable.addAll(_results);
    });
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
          padding: const EdgeInsets.all(8),
          child: Icon(
            (isApple) ? CupertinoIcons.add : Icons.add,
            color: (isApple)
                ? CupertinoTheme.of(context).textTheme.navTitleTextStyle.color
                : Theme.of(context).secondaryHeaderColor,
          ),
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
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: ReorderableListView.builder(
            onReorder: _onReorder,
            itemCount: _resultsMutable.length,
            itemBuilder: (context, index) {
              final item = _resultsMutable[index];

              return Card(
                key: ValueKey(item),
                //TODO: Do not close on button click
                child: Column(
                  // ExpansionTile(
                  //   tilePadding: EdgeInsets.only(right: 30.0, left: 16.0),
                  //   title: Text(item['name']),
                  //   subtitle: Text(item['description'] ?? ''),
                  children: [
                    ListTile(
                      title: Text(item['name'] as String),
                      subtitle: Text(item['description'] as String),
                    ),
                    Column(
                      children: [
                        Text(S.of(context).sets),
                        MpChangeIntField(
                          value: item['sets'] as int,
                          decreaseCallback: () => _decreaseSets(index),
                          increaseCallback: () => _increaseSets(index),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(S.of(context).repeats),
                        MpChangeIntField(
                          value: item['repeats'] as int,
                          decreaseCallback: () => _decreaseRepeats(index),
                          increaseCallback: () => _increseRepeats(index),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(S.of(context).rest),
                        MpChangeIntField(
                          value: item['rest'] as int,
                          decreaseCallback: () => _decreaseRest(index),
                          increaseCallback: () => _increaseRest(index),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          if (!isApple) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                //FIXME: Translate!!!
                                title: const Text('Delete something'),
                                //FIXME: Translate!!!
                                content: const Text('Are you shure?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        //FIXME: Translate!!!
                                        Navigator.pop(context, 'Cancel'),
                                    //FIXME: Translate!!!
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _deleteRow(id: item['id'] as int);
                                      _refresh();
                                      //FIXME: Translate!!!
                                      Navigator.pop(context, 'OK');
                                    },
                                    //FIXME: Translate!!!
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
                                //FIXME: Translate!!!
                                title: const Text('Delete something'),
                                //FIXME: Translate!!!
                                content: const Text('Are you shure?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        //FIXME: Translate!!!
                                        Navigator.pop(context, 'Cancel'),
                                    //FIXME: Translate!!!
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _deleteRow(id: item['id'] as int);
                                      _refresh();
                                      //FIXME: Translate!!!
                                      Navigator.pop(context, 'OK');
                                    },
                                    //FIXME: Translate!!!
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.delete)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _decreaseSets(int index) {
    if (_resultsMutable[index]['sets'] as int > 1) {
      _updateSets(
          id: _resultsMutable[index]['id'] as int,
          sets: (_resultsMutable[index]['sets'] as int) - 1);
      _refresh();
    }
  }

  void _increaseSets(int index) {
    _updateSets(
        id: _resultsMutable[index]['id'] as int,
        sets: (_resultsMutable[index]['sets'] as int) + 1);
    _refresh();
  }

  void _decreaseRepeats(int index) {
    if (_resultsMutable[index]['sets'] as int > 1) {
      _updateRepeats(
        id: _resultsMutable[index]['id'] as int,
        repeats: (_resultsMutable[index]['repeats'] as int) - 1,
      );
      _refresh();
    }
  }

  void _increseRepeats(int index) {
    _updateRepeats(
      id: _resultsMutable[index]['id'] as int,
      repeats: (_resultsMutable[index]['repeats'] as int) + 1,
    );
    _refresh();
  }

  void _decreaseRest(int index) {
    if (_resultsMutable[index]['rest'] as int > 5) {
      _updateRest(
          id: _resultsMutable[index]['id'] as int,
          rest: (_resultsMutable[index]['rest'] as int) - 5);
      _refresh();
    }
  }

  void _increaseRest(int index) {
    _updateRest(
        id: _resultsMutable[index]['id'] as int,
        rest: (_resultsMutable[index]['rest'] as int) + 5);
    _refresh();
  }

  void _onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final Map<String, dynamic> item = _resultsMutable.removeAt(oldIndex);
    _resultsMutable.insert(newIndex, item);
    _updateOrder(id: item['id'] as int, ord: newIndex);
    _refresh();
  }
}
