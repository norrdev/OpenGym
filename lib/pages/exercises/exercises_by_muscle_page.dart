import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/services/db.dart';
import 'package:npng/widgets/bottom_bar.dart';

class ExercisesByMusclePage extends StatefulWidget {
  static String id = 'exersises_by_muscle';
  final int musclesId;
  final String pageTitle;

  ExercisesByMusclePage({this.musclesId, this.pageTitle});

  @override
  _ExercisesByMusclePageState createState() => _ExercisesByMusclePageState();
}

class _ExercisesByMusclePageState extends State<ExercisesByMusclePage> {
  //List<ExercisesItem> _exercises = [];
  List<Map<String, dynamic>> _results = [];

  @override
  void initState() {
    refresh();
    super.initState();
  }

  void refresh() async {
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

  void update({String name, String description}) async {
    int id = 0;
    await DB.db.transaction((txn) async {
      id = await txn
          .insert('exercises', {'name': name, 'description': description});
      await txn
          .insert('load', {'exercises_id': id, 'muscles_id': widget.musclesId});
    });
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Create validation
    //TODO: Edit excersizes
    //TODO: Delete excersizes
    TextEditingController tcName = TextEditingController(text: '');
    TextEditingController tcDesc = TextEditingController(text: '');
    //int _selected = 0;

    return MpScaffold(
      appBar: MpAppBar(
        title: Text(widget.pageTitle),
        button: MpFlatButton(
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            return mpModalPopup(
              context: context,
              child: Container(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.0,
                child: Column(
                  children: [
                    MpTextField(
                      controller: tcName,
                      labelText: 'Exersise name',
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    MpTextField(
                      controller: tcDesc,
                      labelText: 'Exersise desctiption',
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    // MpGroupSelect<int>(
                    //   groupValue: _selected,
                    //   children: <int, Widget>{
                    //     0: Text('Midnight'),
                    //     1: Text('Viridian'),
                    //     2: Text('Cerulean'),
                    //     3: Text('Cerulean'),
                    //     4: Text('Cerulean'),
                    //     5: Text('Cerulean'),
                    //     6: Text('Cerulean'),
                    //     7: Text('Cerulean'),
                    //     8: Text('Cerulean'),
                    //     9: Text('Cerulean'),
                    //     10: Text('Cerulean'),
                    //     11: Text('Cerulean'),
                    //     12: Text('Cerulean'),
                    //     13: Text('Cerulean'),
                    //     14: Text('Cerulean'),
                    //     15: Text('Cerulean'),
                    //     16: Text('Cerulean'),
                    //     17: Text('Cerulean'),
                    //     18: Text('Cerulean'),
                    //     19: Text('Cerulean'),
                    //   },
                    //   onValueChanged: (int value) {
                    //     setState(() {
                    //       _selected = value;
                    //     });
                    //   },
                    // ),
                    MpButton(
                      label: 'Save',
                      onPressed: () {
                        update(name: tcName.text, description: tcDesc.text);
                        refresh();
                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: ListView.builder(
            itemCount: _results.length,
            itemBuilder: (context, index) {
              final item = _results[index];
              return MpListTile(
                title: Text(item['name']),
                onTap: () {},
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(initialActiveIndex: 3),
    );
  }
}
