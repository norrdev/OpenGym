import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/widgets/bottom_bar.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';

class TrainStartPage extends StatelessWidget {
  static String id = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).pageWorkout),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
      ),
      bottomNavigationBar: BottomBar(initialActiveIndex: 0),
    );
  }
}
