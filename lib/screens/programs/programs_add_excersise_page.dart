import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/data/sqlite/db.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';

class AddExcersisePage extends StatefulWidget {
  const AddExcersisePage({Key? key, required this.dayId}) : super(key: key);
  static String id = 'AddExcersisePage';
  final int? dayId;

  @override
  _AddExcersisePageState createState() => _AddExcersisePageState();
}

class _AddExcersisePageState extends State<AddExcersisePage> {
  List<Map<String, dynamic>> _dynamicChips = [];
  List<Map<String, dynamic>> _exersises = [];
  int selectedMuscle = -1;
  List<bool> selectedEx = [];

  void _refreshChips() async {
    _dynamicChips = await db!.query('musсles', orderBy: 'id', columns: [
      'id',
      '${kLocale}_name AS name',
    ]);
    setState(() {});
  }

  void _refreshEx() async {
    _exersises = await db!.rawQuery('''
      SELECT exercises.id AS id, exercises.${kLocale}_name AS name, ${kLocale}_description, equipment_id FROM load  
      JOIN exercises ON exercises_id = exercises.id 
      WHERE muscles_id = ${_dynamicChips[selectedMuscle]['id']}''');
    selectedEx = List<bool>.filled(_exersises.length, false);
    setState(() {});
  }

  void _insert(List<int?> exIds) async {
    await db!.transaction((txn) async {
      for (var i = 0; i < exIds.length; i++) {
        List<Map<String, dynamic>> itemForMax =
            await txn.rawQuery('SELECT MAX(ord) AS maxOrd FROM workouts');
        int maxOrd = itemForMax.first['maxOrd'] as int;
        // (itemForMax.first['maxOrd'] == null)
        //     ? -1
        //     : itemForMax.first['maxOrd'];
        await txn.insert('workouts', {
          'days_id': widget.dayId,
          'exercises_id': exIds[i],
          'ord': maxOrd + 1,
        });
      }
    });
  }

  @override
  void initState() {
    _refreshChips();
    _refreshEx();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).pageAddEx),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isApple) const SizedBox(height: 56.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              S.of(context).muscles,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Material(
              type: MaterialType.transparency,
              child: Wrap(
                spacing: 4.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children:
                    List<Widget>.generate(_dynamicChips.length, (int index) {
                  final item = _dynamicChips[index];
                  return ChoiceChip(
                    selected: (index == selectedMuscle) ? true : false,
                    label: Text(
                      item['name'] as String,
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        selectedMuscle = index;
                        _refreshEx();
                      });
                    },
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              S.of(context).pageExerciseTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Material(
              type: MaterialType.transparency,
              child: Wrap(
                spacing: 4.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: List<Widget>.generate(_exersises.length, (int index) {
                  final item = _exersises[index];
                  return FilterChip(
                    selected: selectedEx[index],
                    //labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    label: Text(
                      (item['name'] ?? '') as String,
                      textScaleFactor: 1.2,
                    ),
                    tooltip: (item['description'] ?? '') as String,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedEx[index] = !selectedEx[index];
                      });
                    },
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MpButton(
              label: S.of(context).add,
              onPressed: () {
                List<int?> buffer = [];
                for (var i = 0; i < selectedEx.length; i++) {
                  if (selectedEx[i] == true) {
                    buffer.add(_exersises[i]['id'] as int);
                  }
                }
                _insert(buffer);
                mpShowToast('Exercise added.', context: context);
                //setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
