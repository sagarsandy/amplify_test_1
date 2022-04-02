import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        letterSpacing: 1,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
