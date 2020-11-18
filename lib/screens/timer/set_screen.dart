import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/screens/timer/timer_screen.dart';
import 'package:provider/provider.dart';
import 'package:npng/models/set_rest.dart';
import 'package:npng/generated/l10n.dart';

class SetScreen extends StatelessWidget {
  static const String id = '/set';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MpScaffold(
        appBar: MpAppBar(title: Text(S.of(context).title)),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Text(
                    'Подход ${Provider.of<SetRestData>(context).currentSet} из ${Provider.of<SetRestData>(context).sets}'),
                MpButton(
                  label: 'Отдых',
                  onPressed: () {
                    Navigator.pushNamed(context, TimerScreen.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
