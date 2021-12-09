import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/exercises/exercises_by_muscle_page.dart';
import 'package:npng/data/sqlite/db.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({Key? key}) : super(key: key);
  static String id = '/exercises_old';

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
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: ListView.builder(
            itemCount: _results.length,
            itemBuilder: (context, index) {
              final item = _results[index];

              return Material(
                type: MaterialType.transparency,
                child: ListTile(
                  leading: (item['icon'] != null)
                      ? Image.memory(
                          item['icon'] as Uint8List,
                          width: 96,
                          height: 96,
                        )
                      : const SizedBox(
                          width: 96,
                          height: 96,
                        ),
                  title: Text(item['name'] as String),
                  onTap: () {
                    Navigator.push(
                      context,
                      mpPageRoute(
                        builder: (context) {
                          return ExercisesByMusclePage(
                            musclesId: item['id'] as int,
                            pageTitle: item['name'] as String,
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
