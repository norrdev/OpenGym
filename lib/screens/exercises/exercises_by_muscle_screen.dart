import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/data/models/models.dart';
import 'package:npng/data/repository.dart';
import 'package:npng/screens/exercises/exercise_screen.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/widgets/modal_popups.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
      stream: repository.findExcersisesByMuscle(id),
      builder: (context, AsyncSnapshot<List<Exercise>> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final exes = snapshot.data ?? [];
          return Material(
            type: MaterialType.transparency,
            child: ListView.builder(
              itemCount: exes.length,
              itemBuilder: (context, index) {
                final item = exes[index];
                return Slidable(
                  key: ValueKey(item),
                  child: ListTile(
                    title: Text(item.name!),
                    onTap: () => Navigator.push(
                      context,
                      mpPageRoute(
                        builder: (context) {
                          return ExerciseScreen(
                            exeId: item.id as int,
                          );
                        },
                      ),
                    ),
                  ),
                  endActionPane: const ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: doNothing,
                        backgroundColor: Color(0xFF0392CF),
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                      SlidableAction(
                        // An action can be bigger than the others.
                        //flex: 2,
                        onPressed: doNothing,
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
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

void doNothing(BuildContext context) {}
