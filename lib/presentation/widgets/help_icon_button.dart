import 'package:flutter/material.dart';

class HelpIconButton extends StatelessWidget {
  final String help;
  const HelpIconButton({
    super.key,
    required this.help,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        SnackBar snackBar = SnackBar(
          content: Text(help),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      icon: const Icon(Icons.help_outline),
    );
  }
}
