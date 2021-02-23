import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npng/config.dart';
import 'package:npng/pages/routines/days_page.dart';
import 'package:npng/services/db.dart';
import 'package:npng/widgets/multiplatform_widgets.dart';
import 'package:npng/generated/l10n.dart';
import 'package:npng/widgets/bottom_bar.dart';

Future insertModalPopup(BuildContext context,
    {@required TextEditingController name,
    @required TextEditingController description,
    @required Function insert,
    @required Function refresh}) {
  final _formKey = GlobalKey<FormState>();
  return mpModalPopup(
    context: context,
    child: Container(
      color: (isApple)
          ? CupertinoTheme.of(context).barBackgroundColor
          : Theme.of(context).appBarTheme.color,
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.0,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Material(
              type: MaterialType.transparency,
              child: Theme(
                data: (darkModeOn) ? kMaterialDark : kMaterialLight,
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: S.of(context).exName,
                    border: OutlineInputBorder(
                      //borderRadius: new BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return S.of(context).enterText;
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Material(
              type: MaterialType.transparency,
              child: Theme(
                data: (darkModeOn) ? kMaterialDark : kMaterialLight,
                child: TextFormField(
                  controller: description,
                  decoration: InputDecoration(
                    labelText: S.of(context).exDesc,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    // if (value.isEmpty) {
                    //   return S.of(context).enterText;
                    // }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            MpButton(
              label: S.of(context).save,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  insert(name: name.text, description: description.text);
                  refresh();
                  //setState(() {});
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    ),
  );
}

Future editModalPopup(BuildContext context,
    {@required int id,
    @required String name,
    @required String description,
    @required Function update,
    @required Function refresh,
    @required Function delete}) {
  TextEditingController _tcName = TextEditingController(text: name);
  TextEditingController _tcDesc = TextEditingController(text: description);
  final _formKey = GlobalKey<FormState>();
  return mpModalPopup(
    context: context,
    child: Container(
      color: (isApple)
          ? CupertinoTheme.of(context).barBackgroundColor
          : Theme.of(context).appBarTheme.color,
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.0,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(S.of(context).edit),
            SizedBox(height: 16.0),
            Material(
              type: MaterialType.transparency,
              child: Theme(
                data: (darkModeOn) ? kMaterialDark : kMaterialLight,
                child: TextFormField(
                  controller: _tcName,
                  decoration: InputDecoration(
                    labelText: S.of(context).exName,
                    border: OutlineInputBorder(
                      //borderRadius: new BorderRadius.circular(25.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return S.of(context).enterText;
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Material(
              type: MaterialType.transparency,
              child: Theme(
                data: (darkModeOn) ? kMaterialDark : kMaterialLight,
                child: TextFormField(
                  controller: _tcDesc,
                  decoration: InputDecoration(
                    labelText: S.of(context).exDesc,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    // if (value.isEmpty) {
                    //   return S.of(context).enterText;
                    // }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MpButton(
                  label: S.of(context).save,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      update(
                          id: id,
                          name: _tcName.text,
                          description: _tcDesc.text);
                      refresh();
                      //setState(() {});
                      Navigator.pop(context);
                    }
                  },
                ),
                SizedBox(width: 16.0),
                MpButton(
                  label: S.of(context).delete,
                  onPressed: () {
                    delete(id: id);
                    refresh();
                    //setState(() {});
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
