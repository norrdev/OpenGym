import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/widgets/modal_popups.dart';

class ExercisesByMuscleScreen extends StatefulWidget {
  static String id = 'exersises_by_muscle';
  final int? musclesId;
  final String? pageTitle;

  const ExercisesByMuscleScreen({Key? key, this.musclesId, this.pageTitle})
      : super(key: key);

  @override
  _ExercisesByMuscleScreenState createState() =>
      _ExercisesByMuscleScreenState();
}

class _ExercisesByMuscleScreenState extends State<ExercisesByMuscleScreen> {
  List<Map<String, dynamic>> _results = [];

  // void _refresh() async {
  //   _results = await db!.rawQuery('''
  //     SELECT exercises.id AS id, exercises.${kLocale}_name AS name, ${kLocale}_description AS description, equipment_id FROM load
  //     JOIN exercises ON exercises_id = exercises.id
  //     WHERE muscles_id = ${widget.musclesId}''');
  //   setState(() {});
  // }

  // void _insert({String? name, String? description}) async {
  //   int id = 0;
  //   await db!.transaction((txn) async {
  //     id = await txn.insert('exercises', {
  //       '${kLocale}_name': name,
  //       '${kLocale}_description': description,
  //     });
  //     await txn.insert('load', {
  //       'exercises_id': id,
  //       'muscles_id': widget.musclesId,
  //     });
  //   });
  // }

  // void _update({int? id, String? name, String? description}) async {
  //   await db!.transaction((txn) async {
  //     await txn.update(
  //       'exercises',
  //       {'${kLocale}_name': name, '${kLocale}_description': description},
  //       where: 'id = ?',
  //       whereArgs: [id],
  //     );
  //   });
  // }

  // void _delete({int? id}) async {
  //   await db!.transaction((txn) async {
  //     await txn.delete('exercises', where: 'id = ?', whereArgs: [id]);
  //     await txn.delete('load', where: 'exercises_id = ?', whereArgs: [id]);
  //   });
  // }

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
          // onPressed: () => insertModalPopup(
          //   context,
          //   name: tcName,
          //   description: tcDesc,
          //   insert: _insert,
          //   refresh: _refresh,
          // ),
        ),
      ),
      body: ListView.builder(
        itemCount: _results.length,
        itemBuilder: (context, index) {
          final item = _results[index];
          return Material(
            type: MaterialType.transparency,
            //TODO: Make swipes to delete and edit
            child: ListTile(
              title: Text(item['name'].toString()),
              //TODO: New Add page
              // onLongPress: () => editModalPopup(
              //   context,
              //   id: item['id'] as int,
              //   name: item['name'] as String,
              //   description: item['description'] as String,
              //   update: _update,
              //   refresh: _refresh,
              //   delete: _delete,
              // ),
            ),
          );
        },
      ),
    );
  }
}
