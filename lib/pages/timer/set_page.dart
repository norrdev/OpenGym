import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/controllers/set_rest_controller.dart';
import 'package:npng/pages/timer/timer_page.dart';
import 'package:npng/generated/l10n.dart';

class SetPage extends StatelessWidget {
  static const String id = '/set';

  @override
  Widget build(BuildContext context) {
    Get.put(SetRestController());
    return MpScaffold(
      appBar: MpAppBar(title: Text(S.of(context).title)),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  S.of(context).setsText,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 50),
              GetBuilder<SetRestController>(
                builder: (_) => Text(
                  '${_.currentSet} ${S.of(context).from} ${_.sets}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 50),
              MpButton(
                label: S.of(context).restButton,
                onPressed: () {
                  //Navigator.pushNamed(context, TimerPage.id);
                  Get.toNamed(TimerPage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
