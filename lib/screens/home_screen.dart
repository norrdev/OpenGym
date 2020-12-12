import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/screens/timer/train_screen.dart';

class HomeScreen extends StatelessWidget {
  static String id = '/';

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(title: Text(S.of(context).title)),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: MpButton(
                  label: 'Таймер',
                  onPressed: () {
                    Navigator.pushNamed(context, TrainScreen.id);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
