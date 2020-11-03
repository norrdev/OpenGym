import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:npng/widgets/cupertino_radio_choice.dart';

// ignore: todo
//TODO: One detection of targetPlatform on start.

/// Button.
Widget mpButton({BuildContext context, String label, Function onPressed}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
    return CupertinoButton.filled(
      child: Text(label),
      onPressed: onPressed,
    );
  else
    return RaisedButton(
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
    );
}

Widget mpLinkButton({BuildContext context, String label, Function onPressed}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
    return CupertinoButton(
      padding: EdgeInsetsDirectional.zero,
      child: Text(label),
      onPressed: onPressed,
    );
  else
    return FlatButton(
      child: Text(label),
      onPressed: onPressed,
    );
}

/// FlatButton
Widget mpFlatButton({
  BuildContext context,
  EdgeInsetsGeometry padding,
  Function onPressed,
  Widget child,
}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
    return CupertinoButton(
      padding: padding,
      onPressed: onPressed,
      child: child,
    );
  else
    return FlatButton(
      padding: padding,
      onPressed: onPressed,
      child: child,
    );
}

/// Text field.
Widget mpTextField(
    {BuildContext context,
    TextEditingController controller,
    String labelText,
    List<TextInputFormatter> inputFormatters}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(labelText),
        SizedBox(
          height: 8.0,
        ),
        CupertinoTextField(
          controller: controller,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  } else {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      inputFormatters: inputFormatters,
    );
  }
}

// Text FORM field
// Widget mpTextFormField({
//   BuildContext context,
//   TextEditingController controller,
//   String labelText,
//   List<TextInputFormatter> inputFormatters,
//   String Function(String) validator,
// }) {
//   if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(labelText),
//         SizedBox(
//           height: 8.0,
//         ),
//         CupertinoTextField(
//           controller: controller,
//           inputFormatters: inputFormatters,
//         ),
//       ],
//     );
//   } else {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         labelText: labelText,
//       ),
//       inputFormatters: inputFormatters,
//       validator: validator,
//     );
//   }
// }

/// AppBar.
PreferredSizeWidget mpAppBar(
    {@required Widget title, Widget button, BuildContext context}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    return CupertinoNavigationBar(
      middle: title,
      trailing: (button != null) ? button : SizedBox(),
    );
  } else
    return AppBar(
      title: title,
      actions: [
        (button != null) ? button : SizedBox(),
      ],
    );
}

/// Switch
Widget mpSwitch(
    {BuildContext context,
    @required String title,
    @required bool value,
    @required ValueChanged<bool> onChanged,
    Function onTap}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(title),
        ),
        Expanded(
          flex: 1,
          child: CupertinoSwitch(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  } else {
    return ListTile(
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
      onTap: onTap,
    );
  }
}

/// Scaffold
Widget mpScaffold(
    {BuildContext context, PreferredSizeWidget appBar, @required Widget body}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    return CupertinoPageScaffold(
      navigationBar: appBar,
      child: body,
    );
  } else {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}

/// Page router.
PageRoute mpPageRoute({Widget Function(BuildContext) builder}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    return CupertinoPageRoute(
      builder: builder,
    );
  } else {
    return MaterialPageRoute(
      builder: builder,
    );
  }
}

/// For validation.
class MpValidationMessage extends StatelessWidget {
  final String message;

  MpValidationMessage({@required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text(
            this.message,
            textScaleFactor: 0.8,
            style: TextStyle(color: Colors.redAccent),
          ),
        ],
      ),
    );
  }
}

/// Radio selector
// ignore: todo
//TODO: Refactor to dynamic amount of radios.
Widget mpSelectFromTwo({
  BuildContext context,
  @required dynamic value1,
  @required dynamic value2,
  @required dynamic groupValue,
  @required void Function(dynamic) onChanged,
  @required String itemText1,
  @required String itemText2,
}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    return CupertinoRadioChoiceDynamic(
        choices: {value1: itemText1, value2: itemText2},
        onChange: onChanged,
        initialKeyValue: groupValue);
  } else {
    return Row(
      children: [
        Radio(
          value: value1,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(itemText1),
        Radio(
          value: value2,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(itemText2),
      ],
    );
  }
}
