import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/models/musles_model.dart';
import 'package:npng/pages/exercises/exercises_by_muscle_page.dart';
import 'dart:io' show Platform;
import 'package:npng/services/db.dart';
import 'package:npng/widgets/bottom_bar.dart';

class ExercisesPage extends StatefulWidget {
  static String id = 'exersises';

  @override
  _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  List<MusclesItem> _musles = [];

  @override
  void initState() {
    refresh();
    super.initState();
  }

  void refresh() async {
    List<Map<String, dynamic>> _results = await DB.query(MusclesItem.table);

    _musles = _results.map((item) => MusclesItem.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exersises'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: ListView.builder(
            itemCount: _musles.length,
            itemBuilder: (context, index) {
              final item = _musles[index];
              return ListTile(
                title: Text(item.name),
                leading: Text('l'),
                trailing: Text('edit'),
                onTap: () {
                  Navigator.push(
                    context,
                    mpPageRoute(
                      builder: (context) {
                        return ExercisesByMusclePage(
                          musclesId: item.id,
                          pageTitle: item.name,
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(initialActiveIndex: 3),
    );
  }
}
