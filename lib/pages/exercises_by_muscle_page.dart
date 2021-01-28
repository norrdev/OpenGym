import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/models/exersises_model.dart';
import 'package:npng/services/db.dart';
import 'package:npng/widgets/bottom_bar.dart';

//TODO: make stateless
class ExercisesByMusclePage extends StatefulWidget {
  static String id = 'exersises_by_muscle';
  final int musclesId;
  final String pageTitle;

  ExercisesByMusclePage({this.musclesId, this.pageTitle});

  @override
  _ExercisesByMusclePageState createState() => _ExercisesByMusclePageState();
}

class _ExercisesByMusclePageState extends State<ExercisesByMusclePage> {
  List<ExercisesItem> _exercises = [];

  @override
  void initState() {
    refresh();
    super.initState();
  }

  void refresh() async {
    List<Map<String, dynamic>> _results = await DB.rawQuery('''
SELECT exercises.id AS id, exercises.name AS name, description, equipment.name AS equipment FROM load  
JOIN exercises ON exercises_id = exercises.id 
JOIN equipment ON equipment_id = equipment.id
WHERE muscles_id = ${widget.musclesId}''');

    _exercises = _results.map((item) => ExercisesItem.fromMap(item)).toList();

    setState(() {});
  }

  void update({String name, String description}) async {
    int id = 0;
    await DB.db.transaction((txn) async {
      id = await DB.db
          .insert('exercises', {'name': name, 'desctiption': description});
      print(DB.db.insert(
          'load', {'exercises_id': id, 'muscles_id': widget.musclesId}));
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController tcName = TextEditingController(text: 'Test name');
    TextEditingController tcDesc = TextEditingController(text: 'Test desc');

    return MpScaffold(
      appBar: MpAppBar(
        title: Text(widget.pageTitle),
        button: MpLinkButton(
          label: 'Add',
          onPressed: () {
            return mpModalPopup(
              context: context,
              child: Container(
                padding: EdgeInsets.all(8.0),
                //color: CupertinoTheme.of(context).scaffoldBackgroundColor,
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
                    MpButton(
                      label: 'Save',
                      onPressed: () {
                        update(name: tcName.text, description: tcDesc.text);
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
            itemCount: _exercises.length,
            itemBuilder: (context, index) {
              final item = _exercises[index];
              return MpListTile(
                title: Text(item.name),
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
