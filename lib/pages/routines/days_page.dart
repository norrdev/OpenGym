import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/db.dart';
import 'package:npng/pages/routines/routines_by_day.dart';
import 'package:npng/widgets/modal_popups.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/bottom_bar.dart';

class DaysPage extends StatefulWidget {
  static String id = 'days';
  final int? routinesId;
  final String? pageTitle;

  DaysPage({this.routinesId, this.pageTitle});

  @override
  _DaysPageState createState() => _DaysPageState();
}

class _DaysPageState extends State<DaysPage> {
  List<Map<String, dynamic>> _days = [];

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  Future<int> _insert({String? name, String? description, int? ord}) async {
    return await db!.insert('days', {
      'name': name,
      'ord': ord,
      'description': description,
      'routines_id': widget.routinesId
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
        {'name': name, 'description': description},
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  void _refresh() async {
    _days = await db!.query('days', orderBy: 'ord');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController tcName = TextEditingController(text: '');
    TextEditingController tcDesc = TextEditingController(text: '');
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).pageDaysTitle),
        trailing: MpFlatButton(
          padding: EdgeInsets.all(8),
          child: Icon(CupertinoIcons.add),
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
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          //TODO: SortedList from Flutter 2.0
          child: ListView.builder(
            itemCount: _days.length,
            itemBuilder: (context, index) {
              final item = _days[index];
              return Material(
                type: MaterialType.transparency,
                child: Theme(
                  data: (darkModeOn) ? kMaterialDark : kMaterialLight,
                  child: ListTile(
                    title: Text(item['name']),
                    subtitle: Text(item['description']),
                    onTap: () {
                      Navigator.push(
                        context,
                        mpPageRoute(
                          builder: (context) {
                            return RoutinesByDayPage(
                              dayId: item['id'],
                              pageTitle: item['name'],
                            );
                          },
                        ),
                      );
                    },
                    trailing: MpLinkButton(
                      label: S.of(context).edit,
                      onPressed: () => editModalPopup(context,
                          id: item['id'],
                          name: item['name'],
                          description: item['description'],
                          update: _update,
                          refresh: _refresh,
                          delete: _delete),
                    ),
                  ),
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
