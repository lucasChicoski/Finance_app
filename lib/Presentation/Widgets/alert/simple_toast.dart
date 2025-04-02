import 'package:flutter/material.dart';

simpleToast(BuildContext context, {String item = ''}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Center(
        child: Text(item),
      ),
      duration: const Duration(seconds: 1),
    ),
  );
}