import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/services/db.dart';
import 'package:npng/widgets/bottom_bar.dart';
import 'package:npng/widgets/modal_popups.dart';

class ExercisesByMusclePage extends StatefulWidget {
  static String id = 'exersises_by_muscle';
  final int musclesId;
  final String pageTitle;

  ExercisesByMusclePage({this.musclesId, this.pageTitle});

  @override
  _ExercisesByMusclePageState createState() => _ExercisesByMusclePageState();
}

class _ExercisesByMusclePageState extends State<ExercisesByMusclePage> {
  List<Map<String, dynamic>> _results = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  void _refresh() async {
    //     _results = await DB.rawQuery('''
    // SELECT exercises.id AS id, exercises.name AS name, description, equipment.name AS equipment FROM load
    // JOIN exercises ON exercises_id = exercises.id
    // JOIN equipment ON equipment_id = equipment.id
    // WHERE muscles_id = ${widget.musclesId}''');
    _results = await DB.rawQuery('''
      SELECT exercises.id AS id, exercises.name AS name, description FROM load  
      JOIN exercises ON exercises_id = exercises.id 
      WHERE muscles_id = ${widget.musclesId}''');
    setState(() {});
  }

  void _insert({String name, String description}) async {
    int id = 0;
    await DB.db.transaction((txn) async {
      id = await txn
          .insert('exercises', {'name': name, 'description': description});
      await txn
          .insert('load', {'exercises_id': id, 'muscles_id': widget.musclesId});
    });
  }

  void _update({int id, String name, String description}) async {
    await DB.db.transaction((txn) async {
      await txn.update(
        'exercises',
        {'name': name, 'description': description},
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  void _delete({int id}) async {
    await DB.db.transaction((txn) async {
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
        title: Text(widget.pageTitle),
        trailing: MpFlatButton(
          padding: EdgeInsets.all(8),
          child: Icon(CupertinoIcons.add),
          onPressed: () => insertModalPopup(context,
              name: tcName,
              description: tcDesc,
              insert: _insert,
              refresh: _refresh),
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
      bottomNavigationBar: BottomBar(initialActiveIndex: 3),
    );
  }
}
