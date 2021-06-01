import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/pages/routines/days_page.dart';
import 'package:npng/db.dart';
import 'package:npng/widgets/modal_popups.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/bottom_bar.dart';

class RoutinesPage extends StatefulWidget {
  static String id = '/routines';

  @override
  _RoutinesPageState createState() => _RoutinesPageState();
}

class _RoutinesPageState extends State<RoutinesPage> {
  List<Map<String, dynamic>> _results = [];

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  void _refresh() async {
    _results = await db!.query('routines');
    setState(() {});
  }

  void _insert({String? name, String? description}) async {
    await db!.transaction((txn) async {
      await txn.insert('routines', {'name': name, 'description': description});
    });
  }

  void _update({int? id, String? name, String? description}) async {
    await db!.transaction((txn) async {
      await txn.update(
        'routines',
        {'name': name, 'description': description},
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  void _delete({int? id}) async {
    await db!.transaction((txn) async {
      await txn.delete('routines', where: 'id = ?', whereArgs: [id]);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController tcName = TextEditingController(text: '');
    TextEditingController tcDesc = TextEditingController(text: '');
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).pageRoutinesTitle),
        trailing: MpFlatButton(
          padding: EdgeInsets.all(8),
          child: Icon(CupertinoIcons.add),
          onPressed: () => setState(() => insertModalPopup(context,
              name: tcName,
              description: tcDesc,
              insert: _insert,
              refresh: _refresh)),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: ListView.builder(
            itemCount: _results.length,
            itemBuilder: (context, index) {
              final item = _results[index];
              return Material(
                type: MaterialType.transparency,
                child: Theme(
                  data: (darkModeOn) ? kMaterialDark : kMaterialLight,
                  child: ListTile(
                    title: Text(item['name']),
                    subtitle: Text(item['description']),
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
                    //onTap: () => Navigator.pushNamed(context, DaysPage.id),
                    onTap: () {
                      Navigator.push(
                        context,
                        mpPageRoute(
                          builder: (context) {
                            return DaysPage(
                              routinesId: item['id'],
                              pageTitle: item['name'],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(initialActiveIndex: 1),
    );
  }
}
