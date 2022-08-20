import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  const RadioGroup({
    super.key,
    required this.initialValue,
    required this.titles,
    this.onChanged,
  });
  final int? initialValue;
  final Function? onChanged;
  final List<String> titles;

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  int? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.titles.map((title) {
        return ListTile(
          title: Text(title),
          leading: Radio<int>(
            value: widget.titles.indexOf(title) + 1,
            groupValue: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
                widget.onChanged?.call(value);
              });
            },
          ),
        );
      }).toList(),
    );
  }
}
