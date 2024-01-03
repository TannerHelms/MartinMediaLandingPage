import 'package:flutter/material.dart';

class MMButton extends StatelessWidget {
  const MMButton({super.key, required this.onPressed, required this.text});

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed(), child: Text(text));
  }
}
