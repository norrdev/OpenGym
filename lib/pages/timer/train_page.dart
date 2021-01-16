import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:npng/controllers/set_rest_controller.dart';
import 'package:npng/pages/timer/set_page.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'dart:io' show Platform;

class TrainPage extends StatelessWidget {
  static String id = '/train';

  @override
  Widget build(BuildContext context) {
    Get.put(SetRestController());
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).sets),
            GetBuilder<SetRestController>(
              builder: (_) => ChangeIntField(
                value: _.sets,
                decreaseCallback: _.decreaseSets,
                increaseCallback: _.increaseSets,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(S.of(context).rest),
            GetBuilder<SetRestController>(
              builder: (_) => ChangeIntField(
                value: _.rest,
                decreaseCallback: _.decreaseRest,
                increaseCallback: _.increaseRest,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MpButton(
                label: S.of(context).start,
                onPressed: () {
                  int sts = 5;
                  int rst = 90;
                  try {
                    sts = SetRestController.to.sets;
                  } catch (e) {
                    sts = 0;
                  }
                  try {
                    rst = SetRestController.to.rest;
                  } catch (e) {
                    rst = 90;
                  }
                  SetRestController.to.changeSets(sts);
                  SetRestController.to.changeRest(rst);
                  SetRestController.to.resetCurrentSet();
                  //Navigator.pushNamed(context, SetPage.id);
                  Get.toNamed(SetPage.id);
                },
              ),
            ),
            // Text(
            //     '${Provider.of<SetRestData>(context, listen: false).sets}'),
          ],
        ),
      ),
    );
  }
}

class ChangeIntField extends StatelessWidget {
  final int value;
  final Function increaseCallback;
  final Function decreaseCallback;

  const ChangeIntField({
    Key key,
    this.value,
    this.decreaseCallback,
    this.increaseCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RoundIconButton(
            icon: Icons.arrow_back_ios_rounded,
            fillColor: (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
                ? CupertinoTheme.of(context).barBackgroundColor
                : Theme.of(context).bottomAppBarColor,
            onPressed: decreaseCallback,
          ),
        ),
        SizedBox(
          width: 60.0,
          child: Text(
            value.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: RoundIconButton(
            icon: Icons.arrow_forward_ios_rounded,
            fillColor: (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
                ? CupertinoTheme.of(context).barBackgroundColor
                : Theme.of(context).bottomAppBarColor,
            onPressed: increaseCallback,
          ),
        ),
      ],
    );
  }
}
