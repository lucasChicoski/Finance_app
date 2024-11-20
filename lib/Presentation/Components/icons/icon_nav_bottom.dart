import 'package:flutter/material.dart';

class IconNavBottom extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final String router;
  final Function()? function;
  const IconNavBottom(
      {super.key, required this.icon, this.color, required this.router , this.function});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: function,
        icon: Icon(
          icon,
          color: color,
        ));
  }
}
