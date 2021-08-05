import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/widgets/modal_popups.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/db.dart';
import 'package:npng/widgets/bottom_bar.dart';

class ExercisePage extends StatefulWidget {
  static String id = 'exersise';
  final int? musclesId;
  final String? pageTitle;

  ExercisePage({this.musclesId, this.pageTitle});

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  List<Map<String, dynamic>> _results = [];

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  void _refresh() async {
//     _results = await DB.rawQuery('''
// SELECT exercises.id AS id, exercises.${kLocale}_name AS name, ${kLocale}_description, equipment.name AS equipment FROM load
// JOIN exercises ON exercises_id = exercises.id
// JOIN equipment ON equipment_id = equipment.id
// WHERE muscles_id = ${widget.musclesId}''');
    _results = await db!.rawQuery('''
SELECT exercises.id AS id, exercises.${kLocale}_name AS name, ${kLocale}_description, icon FROM load  
JOIN exercises ON exercises_id = exercises.id 
WHERE muscles_id = ${widget.musclesId}''');
    setState(() {});
  }

  void _insert({String? name, String? description}) async {
    int id = 0;
    await db!.transaction((txn) async {
      id = await txn.insert('exercises',
          {'${kLocale}_name': name, '${kLocale}_description': description});
      await txn
          .insert('load', {'exercises_id': id, 'muscles_id': widget.musclesId});
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController tcName = TextEditingController(text: '');
    TextEditingController tcDesc = TextEditingController(text: '');
    //int _selected = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle!),
        leading: MpFlatButton(
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            return insertModalPopup(
              context,
              name: tcName,
              description: tcDesc,
              insert: _insert,
              refresh: _refresh,
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
              return ListTile(
                title: Text(item['name']),
                leading: Text('l'),
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
