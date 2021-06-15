import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/widgets/bottom_bar.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/db.dart';

class TrainStartPage extends StatefulWidget {
  static String id = '/';

  @override
  _TrainStartPageState createState() => _TrainStartPageState();
}

class _TrainStartPageState extends State<TrainStartPage> {
  int defRoutine = 0;

  @override
  void initState() {
    getDefaultRoutine();
    super.initState();
  }

  void getDefaultRoutine() async {
    List<Map<String, dynamic>> _user = [];
    _user = await db!.query('user', where: 'id = ?', whereArgs: [1]);
    defRoutine = _user.first['routines_id'] ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).pageWorkout),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Text('Default: $defRoutine'),
      ),
      bottomNavigationBar: BottomBar(initialActiveIndex: 0),
    );
  }
}
