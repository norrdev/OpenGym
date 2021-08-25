import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/db.dart';
import 'package:npng/widgets/bottom_bar.dart';
import 'package:npng/widgets/modal_popups.dart';

class ExercisesByMusclePage extends StatefulWidget {
  static String id = 'exersises_by_muscle';
  final int? musclesId;
  final String? pageTitle;

  const ExercisesByMusclePage({Key? key, this.musclesId, this.pageTitle})
      : super(key: key);

  @override
  _ExercisesByMusclePageState createState() => _ExercisesByMusclePageState();
}

class _ExercisesByMusclePageState extends State<ExercisesByMusclePage> {
  List<Map<String, dynamic>> _results = [];

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  void _refresh() async {
    // _results = await DB.rawQuery('''
    // SELECT exercises.id AS id, exercises.${kLocale}_name AS name, ${kLocale}_description, equipment.name AS equipment FROM load
    // JOIN exercises ON exercises_id = exercises.id
    // JOIN equipment ON equipment_id = equipment.id
    // WHERE muscles_id = ${widget.musclesId}''');

    _results = await db!.rawQuery('''
      SELECT exercises.id AS id, exercises.${kLocale}_name AS name, ${kLocale}_description AS description, equipment_id FROM load  
      JOIN exercises ON exercises_id = exercises.id 
      WHERE muscles_id = ${widget.musclesId}''');
    setState(() {});
  }

  void _insert({String? name, String? description}) async {
    int id = 0;
    await db!.transaction((txn) async {
      id = await txn.insert('exercises', {
        '${kLocale}_name': name,
        '${kLocale}_description': description,
      });
      await txn.insert('load', {
        'exercises_id': id,
        'muscles_id': widget.musclesId,
      });
    });
  }

  void _update({int? id, String? name, String? description}) async {
    await db!.transaction((txn) async {
      await txn.update(
        'exercises',
        {'${kLocale}_name': name, '${kLocale}_description': description},
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  void _delete({int? id}) async {
    await db!.transaction((txn) async {
      await txn.delete('exercises', where: 'id = ?', whereArgs: [id]);
      await txn.delete('load', where: 'exercises_id = ?', whereArgs: [id]);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController tcName = TextEditingController(text: '');
    TextEditingController tcDesc = TextEditingController(text: '');

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
          child: ListView.builder(
            itemCount: _results.length,
            itemBuilder: (context, index) {
              final item = _results[index];

              return Material(
                type: MaterialType.transparency,
                child: ListTile(
                  title: Text(item['name'].toString()),
                  trailing: MpLinkButton(
                    label: S.of(context).edit,
                    onPressed: () => editModalPopup(
                      context,
                      id: item['id'] as int,
                      name: item['name'] as String,
                      description: item['description'] as String,
                      update: _update,
                      refresh: _refresh,
                      delete: _delete,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(initialActiveIndex: 3),
    );
  }
}
