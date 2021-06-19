import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:npng/pages/workout/workout_set_page.dart';
import 'package:provider/provider.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/state/set_rest_provider.dart';
import 'package:npng/generated/l10n.dart';

class TrainPage extends StatelessWidget {
  static const String id = '/train';

  const TrainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController tcSets = TextEditingController(
        text: '${Provider.of<SetRestProvider>(context).sets}');
    TextEditingController tcRest = TextEditingController(
        text: '${Provider.of<SetRestProvider>(context).rest}');

    return Scaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).sets),
            MpChangeIntField(
              value: Provider.of<SetRestProvider>(context).sets,
              decreaseCallback:
                  Provider.of<SetRestProvider>(context, listen: false)
                      .decreaseRepeats,
              increaseCallback:
                  Provider.of<SetRestProvider>(context, listen: false)
                      .increaseRepeats,
            ),
            SizedBox(
              height: 40,
            ),
            Text(S.of(context).rest),
            MpChangeIntField(
              value: Provider.of<SetRestProvider>(context).rest,
              decreaseCallback:
                  Provider.of<SetRestProvider>(context, listen: false)
                      .decreaseRest,
              increaseCallback:
                  Provider.of<SetRestProvider>(context, listen: false)
                      .increaseRest,
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
                    sts = int.parse(tcSets.text);
                  } catch (e) {
                    sts = 0;
                  }
                  try {
                    rst = int.parse(tcRest.text);
                  } catch (e) {
                    rst = 90;
                  }
                  Provider.of<SetRestProvider>(context, listen: false)
                      .changeRepeats(sts);
                  Provider.of<SetRestProvider>(context, listen: false)
                      .changeRest(rst);
                  Provider.of<SetRestProvider>(context, listen: false)
                      .resetCurrentRepeat();
                  Navigator.pushNamed(context, WorkoutSetPage.id);
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
