import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:scaffold_project/Utils/size_config.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

class TextInputCustom extends StatefulWidget {
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
  final Function()? onTap;
  final TextEditingController? controller;
  final double? sizeHeight;
  final String? mask; // Adicionando máscara
  final IconButton? suffixIcon;
  final bool? obscureText;
  final String? errorText;
  final bool? enable;

  const TextInputCustom(
      {super.key,
      this.errorText,
      this.obscureText,
      this.suffixIcon,
      this.onChange,
      this.mask,
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
      this.enable,
      this.onTap,
      this.textType});

  @override
  State<TextInputCustom> createState() => _TextInputCustomState();
}

class _TextInputCustomState extends State<TextInputCustom> {
  @override
  Widget build(BuildContext context) {
    final maskFormatter = widget.mask != null
        ? MaskTextInputFormatter(
            mask: widget.mask,
            filter: {"#": RegExp(r'[0-9]')},
            type: MaskAutoCompletionType.lazy,
            initialText: widget.controller?.text,
          )
        : null;
    return SizedBox(
      width: MQueryCustom(context, type: 'h', porcent: widget.size ?? 1),
      child: TextField(
        onTap: widget.onTap,
        inputFormatters: maskFormatter != null ? [maskFormatter] : null,
        controller: widget.controller,
        style: TextStyle(color: widget.digitInputUserColor ?? secundaryColor),
        keyboardType: widget.textType ?? TextInputType.text,
        onChanged: widget.onChange,
        enabled: widget.enable,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(
            errorText: widget.errorText,
            contentPadding: EdgeInsets.all(widget.sizeHeight ?? 10),
            filled: true,
            fillColor: widget.backGroundColor ?? Colors.grey.withOpacity(0.5),
            // alignLabelWithHint: true,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(style: BorderStyle.none, width: 0)),
            focusColor: Colors.black,
            prefixIcon: widget.prefix,
            suffixIcon: widget.suffixIcon,
            prefixText: widget.prefixText,
            isCollapsed: widget.isColapsed ?? false,
            label: widget.label,
            hintText: widget.hint ?? '',
            hintStyle: TextStyle(color: widget.hintColor ?? Colors.black26)),
      ),
    );
  }
}
