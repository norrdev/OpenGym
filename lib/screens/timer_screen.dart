import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/widgets/mp_widgets.dart';
import 'package:npng/generated/l10n.dart';

class TimerScreen extends StatelessWidget {
  static String id = 'timer';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: mpScaffold(
        context: context,
        appBar: mpAppBar(title: Text(S.of(context).title)),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(),
          ),
        ),
      ),
    );
  }
}
