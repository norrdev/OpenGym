import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/db.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';

class TrainProcessPage extends StatefulWidget {
  static const String id = 'TrainProcessPage';
  final int? dayId;

  TrainProcessPage({Key? key, this.dayId}) : super(key: key);

  @override
  _TrainProcessPageState createState() => _TrainProcessPageState();
}

class _TrainProcessPageState extends State<TrainProcessPage> {
  List<Map<String, dynamic>> _results = [];
  int _currentStep = 0;
  List<Step> _ex = [];
  List<int> _exId = [];
  List<bool> _exDone = [];

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  void _refresh() async {
    _results = await db!.rawQuery('''
SELECT workouts.id AS id, exercises.name AS name, exercises.description as description, sets, ord, repeats, rest FROM workouts 
JOIN exercises on workouts.exerscises_id = exercises.id 
WHERE days_id = ${widget.dayId} ORDER BY ord;
    ''');
    _ex.clear();
    _exId.clear();
    for (var item in _results) {
      _ex.add(
        Step(
          title: Text(item['name']),
          content: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [Text(item['description'] ?? ''), Text('repeat')],
              )),
        ),
      );
      _exId.add(item['id']);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text('-------'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Material(
            type: MaterialType.transparency,
            child: Theme(
              data: (darkModeOn) ? kMaterialDark : kMaterialLight,
              child: Column(
                children: [
                  Stepper(
                    currentStep: _currentStep,
                    onStepCancel: () {
                      if (_currentStep > 0) {
                        setState(() {
                          _currentStep -= 1;
                        });
                      }
                    },
                    onStepContinue: () {
                      if (_currentStep <= 0) {
                        setState(() {
                          _currentStep += 1;
                        });
                      }
                    },
                    onStepTapped: (int index) {
                      setState(() {
                        _currentStep = index;
                      });
                    },
                    steps: _ex,
                    controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                      return Container();
                    },
                  ),
                  MpButton(label: 'Start'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
