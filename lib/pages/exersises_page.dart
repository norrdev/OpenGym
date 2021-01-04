import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'dart:io' show Platform;

class ExersisesPage extends StatelessWidget {
  static String id = 'exersises';

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text('Exersises'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: ListView(
            children: [
              MpListTile(title: Text('Abs')),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.list, title: "Train"),
          TabItem(icon: Icons.calendar_today, title: "Measure"),
          TabItem(icon: Icons.assessment, title: "Stats"),
          TabItem(icon: Icons.assessment, title: "Exercises"),
        ],
        initialActiveIndex: 3,
        // ignore: todo
        //TODO: Make settings provider.
        backgroundColor: (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
            ? CupertinoTheme.of(context).barBackgroundColor
            : Theme.of(context).backgroundColor,
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}
