import 'package:flutter/material.dart';

class Textlabel extends StatelessWidget {
  final String? text;
  const Textlabel({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'roboto'),
    );
  }
}
