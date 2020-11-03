// library cupertino_radio_choice;
// https://pub.dev/packages/cupertino_radio_choice
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoRadioChoiceDynamic extends StatefulWidget {
  CupertinoRadioChoiceDynamic(
      {@required this.choices,
      @required this.onChange,
      @required this.initialKeyValue,
      this.selectedColor = CupertinoColors.systemBlue,
      this.notSelectedColor = CupertinoColors.inactiveGray,
      this.enabled = true});

  final Function onChange;
  final dynamic initialKeyValue;
  final Map<dynamic, String> choices;
  final Color selectedColor;
  final Color notSelectedColor;
  final bool enabled;

  @override
  _CupertinoRadioChoiceDynamicState createState() =>
      new _CupertinoRadioChoiceDynamicState();
}

/// State of the widget
class _CupertinoRadioChoiceDynamicState
    extends State<CupertinoRadioChoiceDynamic> {
  dynamic _selectedKey;

  @override
  void initState() {
    super.initState();
    if (widget.choices.keys.contains(widget.initialKeyValue))
      _selectedKey = widget.initialKeyValue;
    else
      _selectedKey = widget.choices.keys.first;
  }

  Widget buildSelectionButton(dynamic key, String value,
      {bool selected = false}) {
    return Container(
        child: CupertinoButton(
            disabledColor:
                selected ? widget.selectedColor : widget.notSelectedColor,
            color: selected ? widget.selectedColor : widget.notSelectedColor,
            padding: const EdgeInsets.all(10.0),
            child: Text(value),
            onPressed: !widget.enabled || selected
                ? null
                : () {
                    setState(() {
                      _selectedKey = key;
                    });

                    widget.onChange(_selectedKey);
                  }));
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> buttonList = [];
    for (var key in widget.choices.keys) {
      buttonList.add(buildSelectionButton(key, widget.choices[key],
          selected: _selectedKey == key));
    }
    return Wrap(
      children: buttonList,
      spacing: 10.0,
      runSpacing: 5.0,
    );
  }
}
