import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/models/musles_model.dart';
import 'dart:io' show Platform;
import 'package:npng/services/db.dart';

class ExersisesPage extends StatefulWidget {
  static String id = 'exersises';

  @override
  _ExersisesPageState createState() => _ExersisesPageState();
}

class _ExersisesPageState extends State<ExersisesPage> {
  List<MuslesItem> _musles = [];

  @override
  void initState() {
    refresh();
    super.initState();
  }

  void refresh() async {
    List<Map<String, dynamic>> _results = await DB.query(MuslesItem.table);

    _musles = _results.map((item) => MuslesItem.fromMap(item)).toList();
    print(_musles.first.name);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text('Exersises'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: ListView.builder(
            itemCount: _musles.length,
            itemBuilder: (context, index) {
              final item = _musles[index];
              return MpListTile(
                title: Text(item.name),
                onTap: () {},
              );
            },
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
