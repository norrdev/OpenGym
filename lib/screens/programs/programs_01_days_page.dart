import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/data/sqlite/db.dart';
import 'package:npng/screens/programs/programs_02_by_day.dart';
import 'package:npng/widgets/modal_popups.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';

class ProgramsDaysPage extends StatefulWidget {
  const ProgramsDaysPage({Key? key, this.programsId, this.pageTitle})
      : super(key: key);
  static String id = 'days';
  final int? programsId;
  final String? pageTitle;

  @override
  _ProgramsDaysPageState createState() => _ProgramsDaysPageState();
}

class _ProgramsDaysPageState extends State<ProgramsDaysPage> {
  List<Map<String, dynamic>> _days = [];
  // ignore: prefer_final_fields
  List<Map<String, dynamic>> _mutableDays = [];

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  Future<int> _insert({String? name, String? description, int? ord}) async {
    return await db!.insert('days', {
      '${kLocale}_name': name,
      'ord': ord,
      '${kLocale}_description': description,
      'programs_id': widget.programsId,
    });
  }

  void _delete({int? id}) async {
    await db!.transaction((txn) async {
      await txn.delete('days', where: 'id = ?', whereArgs: [id]);
      await txn.delete('workouts', where: 'days_id = ?', whereArgs: [id]);
    });
  }

  void _update({int? id, String? name, String? description}) async {
    await db!.transaction((txn) async {
      await txn.update(
        'days',
        {'${kLocale}_name': name, '${kLocale}_description': description},
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  void _refresh() async {
    _days = await db!.query(
      'days',
      columns: [
        'id',
        '${kLocale}_name AS name',
        '${kLocale}_description AS description',
        'programs_id',
      ],
      orderBy: 'ord',
      where: 'programs_id = ?',
      whereArgs: [widget.programsId],
    );
    setState(() {
      _mutableDays.clear();
      _mutableDays.addAll(_days);
    });
  }

  void _updateOrder({int? id, int? ord}) async {
    await db!.transaction((txn) async {
      for (int i = 0; i <= _mutableDays.length - 1; i++) {
        await txn.update(
          'days',
          {'ord': i},
          where: 'id = ?',
          whereArgs: [_mutableDays[i]['id']],
        );
      }
    });
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final Map<String, dynamic> item = _mutableDays.removeAt(oldIndex);
      _mutableDays.insert(newIndex, item);
      _updateOrder(id: item['id'] as int, ord: newIndex);
      _refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController tcName = TextEditingController(text: '');
    TextEditingController tcDesc = TextEditingController(text: '');

    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).pageDaysTitle),
        trailing: MpFlatButton(
          padding: const EdgeInsets.all(8),
          child: Icon(
            (isApple) ? CupertinoIcons.add : Icons.add,
            color: (isApple)
                ? CupertinoTheme.of(context).textTheme.navTitleTextStyle.color
                : Theme.of(context).secondaryHeaderColor,
          ),
          onPressed: () => insertModalPopup(
            context,
            name: tcName,
            description: tcDesc,
            insert: _insert,
            refresh: _refresh,
          ),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: ReorderableListView.builder(
            onReorder: _onReorder,
            itemCount: _mutableDays.length,
            itemBuilder: (context, index) {
              final item = _mutableDays[index];

              return Material(
                type: MaterialType.transparency,
                key: ValueKey(item),
                child: ListTile(
                  title: Text(item['name'] as String),
                  subtitle: Text(item['description'] as String),
                  onTap: () {
                    Navigator.push(
                      context,
                      mpPageRoute(
                        builder: (context) {
                          return ProgramsByDayPage(
                            dayId: item['id'] as int,
                            pageTitle: item['name'] as String,
                          );
                        },
                      ),
                    );
                  },
                  onLongPress: () => editModalPopup(context,
                      id: item['id'] as int,
                      name: item['name'] as String,
                      description: item['description'] as String,
                      update: _update,
                      refresh: _refresh,
                      delete: _delete),
                ),
              );
            },
          ),
        ),
      ),
      //bottomNavigationBar: BottomBar(initialActiveIndex: 0),
    );
  }
}