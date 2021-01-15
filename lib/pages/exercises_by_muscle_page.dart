import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/models/exersises_model.dart';
import 'dart:io' show Platform;
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

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(widget.pageTitle),
        button: MpLinkButton(
          label: 'Add',
          onPressed: () {},
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
