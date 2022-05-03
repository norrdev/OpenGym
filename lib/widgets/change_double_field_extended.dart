import 'package:flutter/material.dart';

class ChangeDoubleFieldExtended extends StatelessWidget {
  final double? value;
  final void Function()? increaseCallback;
  final void Function()? decreaseCallback;
  final void Function()? increaseCallbackFast;
  final void Function()? decreaseCallbackFast;

  const ChangeDoubleFieldExtended({
    Key? key,
    required this.value,
    this.decreaseCallback,
    this.increaseCallback,
    this.decreaseCallbackFast,
    this.increaseCallbackFast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.fast_rewind_rounded),
                onPressed: decreaseCallbackFast,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                onPressed: decreaseCallback,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 70.0,
          child: Text(
            value.toString(),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                onPressed: increaseCallback,
              ),
              IconButton(
                icon: const Icon(Icons.fast_forward_rounded),
                onPressed: increaseCallbackFast,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
