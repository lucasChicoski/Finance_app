import 'package:flutter/material.dart';
import 'package:scaffold_project/Utils/size_config.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

class OutlibedButtonCustom extends StatefulWidget {
  final String label;
  final double? size;
  final Function()? onPressed;
  OutlibedButtonCustom({
    required this.label,
    this.size,
    required this.onPressed,
    super.key,
  });

  @override
  State<OutlibedButtonCustom> createState() => _OutlibedButtonCustomState();
}

class _OutlibedButtonCustomState extends State<OutlibedButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MQueryCustom(context, type: 'w', porcent: widget.size ?? 1),
      child: OutlinedButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.label,
          style: TextStyle(color: quartaryColro, overflow: TextOverflow.ellipsis),
        ),
        style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color: quartaryColro))),
      ),
    );
  }
}
