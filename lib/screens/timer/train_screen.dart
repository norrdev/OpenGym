import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:npng/screens/timer/set_screen.dart';
import 'package:provider/provider.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/models/set_rest.dart';
import 'package:npng/generated/l10n.dart';
import 'dart:io' show Platform;

class TrainScreen extends StatelessWidget {
  static String id = '/train';

  const TrainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController tcSets = TextEditingController(
        text: '${Provider.of<SetRestData>(context).sets}');
    TextEditingController tcRest = TextEditingController(
        text: '${Provider.of<SetRestData>(context).rest}');

    return SafeArea(
      child: MpScaffold(
        appBar: MpAppBar(title: Text(S.of(context).title)),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Text("Sets"),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 9,
                      child: RoundIconButton(
                          icon: Icons.exposure_minus_1,
                          fillColor: (!kIsWeb &&
                                  (Platform.isMacOS || Platform.isIOS))
                              ? CupertinoTheme.of(context).barBackgroundColor
                              : Theme.of(context).bottomAppBarColor,
                          onPressed: () {
                            Provider.of<SetRestData>(context, listen: false)
                                .decreaseSets();
                          }),
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: 30.0,
                        child: Text(
                          Provider.of<SetRestData>(context).sets.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: RoundIconButton(
                          icon: Icons.exposure_plus_1,
                          fillColor: (!kIsWeb &&
                                  (Platform.isMacOS || Platform.isIOS))
                              ? CupertinoTheme.of(context).barBackgroundColor
                              : Theme.of(context).bottomAppBarColor,
                          onPressed: () {
                            Provider.of<SetRestData>(context, listen: false)
                                .increseSets();
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text("Rest time (seconds)"),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 9,
                      child: RoundIconButton(
                          icon: Icons.exposure_minus_1,
                          fillColor: (!kIsWeb &&
                                  (Platform.isMacOS || Platform.isIOS))
                              ? CupertinoTheme.of(context).barBackgroundColor
                              : Theme.of(context).bottomAppBarColor,
                          onPressed: () {
                            Provider.of<SetRestData>(context, listen: false)
                                .decreaseRest();
                          }),
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: 30.0,
                        child: Text(
                          Provider.of<SetRestData>(context).rest.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: RoundIconButton(
                          icon: Icons.exposure_plus_1,
                          fillColor: (!kIsWeb &&
                                  (Platform.isMacOS || Platform.isIOS))
                              ? CupertinoTheme.of(context).barBackgroundColor
                              : Theme.of(context).bottomAppBarColor,
                          onPressed: () {
                            Provider.of<SetRestData>(context, listen: false)
                                .increseRest();
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MpButton(
                    label: "Start",
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
                      Provider.of<SetRestData>(context, listen: false)
                          .changeSets(sts);
                      Provider.of<SetRestData>(context, listen: false)
                          .changeRest(rst);
                      Provider.of<SetRestData>(context, listen: false)
                          .resetCurrentSet();
                      Navigator.pushNamed(context, SetScreen.id);
                    },
                  ),
                ),
                // Text(
                //     '${Provider.of<SetRestData>(context, listen: false).sets}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
