import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
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
          onPressed: () => insertModalPopup(context, tcName, tcDesc),
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
                      onPressed: () => editModalPopup(
                          context: context,
                          id: item['id'],
                          name: item['name'],
                          description: item['description']),
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

  //TODO: Refactor — ext widgets

  Future insertModalPopup(BuildContext context, TextEditingController tcName,
      TextEditingController tcDesc) {
    return mpModalPopup(
      context: context,
      child: Container(
        color: (isApple)
            ? CupertinoTheme.of(context).barBackgroundColor
            : Theme.of(context).appBarTheme.color,
        padding: EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.0,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Material(
                type: MaterialType.transparency,
                child: Theme(
                  data: (darkModeOn) ? kMaterialDark : kMaterialLight,
                  child: TextFormField(
                    controller: tcName,
                    decoration: InputDecoration(
                      labelText: S.of(context).exName,
                      border: OutlineInputBorder(
                        //borderRadius: new BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return S.of(context).enterText;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Material(
                type: MaterialType.transparency,
                child: Theme(
                  data: (darkModeOn) ? kMaterialDark : kMaterialLight,
                  child: TextFormField(
                    controller: tcDesc,
                    decoration: InputDecoration(
                      labelText: S.of(context).exDesc,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      // if (value.isEmpty) {
                      //   return S.of(context).enterText;
                      // }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              MpButton(
                label: S.of(context).save,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _insert(name: tcName.text, description: tcDesc.text);
                    _refresh();
                    setState(() {});
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future editModalPopup(
      {BuildContext context, int id, String name, String description}) {
    TextEditingController _tcName = TextEditingController(text: name);
    TextEditingController _tcDesc = TextEditingController(text: description);
    return mpModalPopup(
      context: context,
      child: Container(
        color: (isApple)
            ? CupertinoTheme.of(context).barBackgroundColor
            : Theme.of(context).appBarTheme.color,
        padding: EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.0,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(S.of(context).edit),
              SizedBox(height: 16.0),
              Material(
                type: MaterialType.transparency,
                child: Theme(
                  data: (darkModeOn) ? kMaterialDark : kMaterialLight,
                  child: TextFormField(
                    controller: _tcName,
                    decoration: InputDecoration(
                      labelText: S.of(context).exName,
                      border: OutlineInputBorder(
                        //borderRadius: new BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return S.of(context).enterText;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Material(
                type: MaterialType.transparency,
                child: Theme(
                  data: (darkModeOn) ? kMaterialDark : kMaterialLight,
                  child: TextFormField(
                    controller: _tcDesc,
                    decoration: InputDecoration(
                      labelText: S.of(context).exDesc,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      // if (value.isEmpty) {
                      //   return S.of(context).enterText;
                      // }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MpButton(
                    label: S.of(context).save,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _update(
                            id: id,
                            name: _tcName.text,
                            description: _tcDesc.text);
                        _refresh();
                        setState(() {});
                        Navigator.pop(context);
                      }
                    },
                  ),
                  SizedBox(width: 16.0),
                  MpButton(
                    label: S.of(context).delete,
                    onPressed: () {
                      _delete(id: id);
                      _refresh();
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
