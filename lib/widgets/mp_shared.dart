import 'package:flutter/widgets.dart';

/// Validation message.
class MpValidationMessage extends StatelessWidget {
  final String message;
  final Color color;

  const MpValidationMessage(
      {Key? key, required this.message, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text(
            message,
            textScaleFactor: 0.8,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
