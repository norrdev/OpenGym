import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/pages/exercises/exercises_by_muscle_page.dart';
import 'package:npng/db.dart';
import 'package:npng/widgets/bottom_bar.dart';

class ExercisesPage extends StatefulWidget {
  static String id = 'exercises';

  @override
  _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  List<Map<String, dynamic>> _results = [];

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  void _refresh() async {
    _results = await db!.query('musсles', columns: [
      'id',
      '${kLocale}_name AS name',
      'icon',
    ]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).pageExerciseTitle),
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
                    leading: (item['icon'] != null)
                        ? Container(
                            child: Image.memory(
                            item['icon'],
                            width: 96,
                            height: 96,
                          ))
                        : Container(
                            width: 96,
                            height: 96,
                          ),
                    title: Text(item['name']),
                    onTap: () {
                      Navigator.push(
                        context,
                        mpPageRoute(
                          builder: (context) {
                            return ExercisesByMusclePage(
                              musclesId: item['id'],
                              pageTitle: item['name'],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(initialActiveIndex: 2),
    );
  }
}
