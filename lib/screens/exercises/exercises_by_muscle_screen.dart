import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/widgets/modal_popups.dart';
import 'package:provider/provider.dart';

class ExercisesByMuscleScreen extends StatelessWidget {
  static String id = 'exersises_by_muscle';
  final int musclesId;
  final String pageTitle;

  const ExercisesByMuscleScreen(
      {Key? key, required this.musclesId, required this.pageTitle})
      : super(key: key);

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
        title: Text(pageTitle),
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
      body: _buildExercisesList(context, musclesId),
    );
  }

  Widget _buildExercisesList(BuildContext context, int id) {
    final repository = Provider.of<Repository>(context, listen: false);
    return StreamBuilder<List<Exercise>>(
      stream: repository.watchAllExcersisesByMuscle(id),
      builder: (context, AsyncSnapshot<List<Exercise>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final exes = snapshot.data ?? [];
          return Material(
            type: MaterialType.transparency,
            child: ListView.builder(
              itemCount: exes.length,
              itemBuilder: (context, index) {
                final item = exes[index];
                return Material(
                  type: MaterialType.transparency,
                  //TODO: Make swipes to delete and edit
                  child: ListTile(
                    title: Text(item.name!),
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
