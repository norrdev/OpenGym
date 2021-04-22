import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/db.dart';
import 'package:npng/pages/routines/add_excersise.dart';
import 'package:npng/widgets/modal_popups.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/bottom_bar.dart';

class RoutinesByDayPage extends StatefulWidget {
  static String id = 'routines_by_day';
  final String pageTitle;
  final int dayId;

  RoutinesByDayPage({@required this.pageTitle, @required this.dayId});

  @override
  _RoutinesByDayPageState createState() => _RoutinesByDayPageState();
}

class _RoutinesByDayPageState extends State<RoutinesByDayPage> {
  List<Map<String, dynamic>> _results = [];
  TextEditingController tcSets = TextEditingController(text: '');

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  void _refresh() async {
    _results = await db.rawQuery('''
SELECT exercises.name AS name, exercises.description as description, sets, repeats, rest FROM workouts 
JOIN exercises on workouts.exerscises_id = exercises.id 
WHERE days_id = ${widget.dayId};
    ''');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
        appBar: MpAppBar(
          title: Text(widget.pageTitle),
          trailing: MpFlatButton(
            padding: EdgeInsets.all(8),
            child: Icon(CupertinoIcons.add),
            onPressed: () => Navigator.push(
              context,
              mpPageRoute(
                builder: (context) {
                  return AddExcersisePage(dayId: widget.dayId);
                },
              ),
            ).whenComplete(() => _refresh()),
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
                      subtitle: (item['description'] != null)
                          ? Text(item['description'])
                          : Text(''),
                      trailing: CupertinoButton(child: Icon(Icons.delete)),
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
