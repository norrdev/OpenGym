import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/db.dart';
import 'package:sqflite/sqflite.dart';

/// https://stackoverflow.com/questions/54692052/display-all-images-in-a-directory-to-a-list-in-flutter

class RestoreDbPageState extends StatefulWidget {
  const RestoreDbPageState({Key? key}) : super(key: key);

  @override
  _RestoreDbPageStateState createState() => _RestoreDbPageStateState();
}

class _RestoreDbPageStateState extends State<RestoreDbPageState> {
  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(
        title: Text(S.of(context).restore),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
