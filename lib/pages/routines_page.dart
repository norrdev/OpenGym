import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/services/db.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/bottom_bar.dart';

class RoutinesPage extends StatefulWidget {
  static String id = '/';

  @override
  _RoutinesPageState createState() => _RoutinesPageState();
}

class _RoutinesPageState extends State<RoutinesPage> {
  List<Map<String, dynamic>> _results = [];

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  void _refresh() async {
    _results = await DB.rawQuery('SELECT * FROM routines');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).pageRoutinesTitle),
        trailing: MpLinkButton(
          label: "+",
          onPressed: () {},
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: ListView.builder(
            itemCount: _results.length,
            itemBuilder: (context, index) {
              final item = _results[index];
              return Material(
                type: MaterialType.transparency,
                child: Theme(
                  data: (darkModeOn) ? kMaterialDark : kMaterialLight,
                  child: ListTile(
                    title: Text(item['name']),
                    subtitle: Text(item['description']),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(initialActiveIndex: 0),
    );
  }
}
