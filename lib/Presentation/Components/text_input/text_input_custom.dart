import 'package:flutter/material.dart';
import 'package:scaffold_project/Utils/size_config.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

class TextInputCustom extends StatelessWidget {
  final double? size;
  final Widget? prefix;
  final String? prefixText;
  final Widget? label;
  final String? hint;
  final Color? backGroundColor;
  final TextInputType? textType;
  final Color? hintColor;
  final bool? isColapsed;
  final IconDataProperty? testeIcon;
  final Color? digitInputUserColor;
  final Function(String value)? onChange;
  final TextEditingController? controller;
  final double? sizeHeight;

  const TextInputCustom(
      {super.key,
      this.onChange,
      this.sizeHeight,
      this.controller,
      this.digitInputUserColor,
      this.testeIcon,
      this.isColapsed,
      this.hintColor,
      this.size,
      this.backGroundColor,
      this.prefix,
      this.label,
      this.hint,
      this.prefixText,
      this.textType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MQueryCustom(context, type: 'h', porcent: size ?? 1),
      child: TextField(
        controller: controller,
        style: TextStyle(color: digitInputUserColor ?? secundaryColor),
        keyboardType: textType ?? TextInputType.text,
        onChanged: onChange,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(sizeHeight ?? 10),
            filled: true,
            fillColor: backGroundColor ?? Colors.grey.withOpacity(0.5),
            // alignLabelWithHint: true,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(style: BorderStyle.none, width: 0)),
            focusColor: Colors.black,
            prefixIcon: prefix,
            prefixText: prefixText,
            isCollapsed: isColapsed ?? false,
            label: label,
            hintText: hint ?? '',
            hintStyle: TextStyle(color: hintColor ?? Colors.black26)),
      ),
    );
  }
}
