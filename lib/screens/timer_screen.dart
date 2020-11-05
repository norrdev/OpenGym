import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/reusable_card.dart';

class TimerScreen extends StatelessWidget {
  static String id = '/';
  TextEditingController repeatController;
  TextEditingController restController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MpScaffold(
        appBar: MpAppBar(title: Text(S.of(context).title)),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MpTextField(
                    controller: repeatController,
                    labelText: "Подходы",
                    readOnly: true),
                MpTextField(
                    controller: restController,
                    labelText: "Отдых",
                    readOnly: true),
                Expanded(
                  child: ReusableCard(
                    color: Colors.blueAccent,
                    cardChild: Text('card'),
                  ),
                ),
                RoundIconButton(icon: Icons.ac_unit_outlined, onPressed: () {}),
                MpButton(label: 'Начать', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
