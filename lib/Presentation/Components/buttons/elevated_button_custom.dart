import 'package:flutter/material.dart';
import 'package:scaffold_project/Utils/size_config.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final String label;
  final double? size;
  final Function()? onPressed;
  const ElevatedButtonCustom({super.key, required this.label, this.size, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MQueryCustom(context, type: 'w', porcent: size ?? 1),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(quartaryColro)),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: secundaryColor),
        ),
      ),
    );
  }
}
