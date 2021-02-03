import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/pages/exercises/exercise.dart';
import 'package:npng/services/db.dart';
import 'package:npng/widgets/bottom_bar.dart';

enum Actions { view, edit, delete }

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
    Actions _action_selection = Actions.view;
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(widget.pageTitle),
        trailing: MpFlatButton(
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
                    TextField(
                      controller: tcName,
                      //labelText: 'Exersise name',
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                      controller: tcDesc,
                      //labelText: 'Exersise desctiption',
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
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
              return Material(
                child: ListTile(
                  tileColor: (isApple)
                      ? CupertinoTheme.of(context).scaffoldBackgroundColor
                      : Theme.of(context).backgroundColor,
                  focusColor: (isApple)
                      ? CupertinoTheme.of(context).primaryColor
                      : Theme.of(context).accentColor,
                  title: Text(item['name']),
                  onTap: () {
                    Navigator.pushNamed(context, ExercisePage.id);
                  },
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
