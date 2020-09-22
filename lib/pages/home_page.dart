import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/widgets/mp_widgets.dart';
import 'package:npng/generated/l10n.dart';

class HomePage extends StatelessWidget {
  static String id = '/';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: mpScaffold(
        context: context,
        navigationBar: mpNavigationBar(title: Text(S.of(context).title)),
        body: Container(),
      ),
    );
  }
}
