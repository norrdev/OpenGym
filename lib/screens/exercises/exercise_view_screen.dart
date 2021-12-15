import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/data/models/excercise.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';

class ExerciseViewScreen extends StatelessWidget {
  final Exercise exe;
  const ExerciseViewScreen({Key? key, required this.exe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String desc = exe.description.toString();
    double height = (isApple)
        ? const CupertinoNavigationBar().preferredSize.height
        : AppBar().preferredSize.height;
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(exe.name.toString()),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height + 8.0, //50.0,
          horizontal: 8.0,
        ),
        child: (desc.isNotEmpty)
            ? Text(exe.description.toString())
            : Center(child: Text(S.of(context).noDesc)),
      ),
    );
  }
}
