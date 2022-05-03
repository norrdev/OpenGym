import 'package:flutter/material.dart';

class ChangeIntField extends StatelessWidget {
  final int? value;
  final Function? increaseCallback;
  final Function? decreaseCallback;

  const ChangeIntField({
    Key? key,
    @required this.value,
    this.decreaseCallback,
    this.increaseCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => decreaseCallback,
          ),
        ),
        SizedBox(
          width: 70.0,
          child: Text(
            value.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            onPressed: () => increaseCallback,
          ),
        ),
      ],
    );
  }
}
