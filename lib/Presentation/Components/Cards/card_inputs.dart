import 'package:flutter/material.dart';
import 'package:scaffold_project/Presentation/Components/text_input/text_input_custom.dart';
import 'package:scaffold_project/Utils/size_config.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

class CardInput extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextInputType? textInputType;
  final Function(String value)? onChange;
  final TextEditingController? conttroller;
  const CardInput(
      {super.key, this.label, this.hint, this.onChange, this.conttroller, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MQueryCustom(context, type: 'w', porcent: 1),
      decoration: BoxDecoration(
          color: secundaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          SizedBox(
              width: MQueryCustom(context, type: "w", porcent: 1),
              child: Container(
                margin: const EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  style: TextStyle(fontSize: 20, color: quartaryColro),
                  label ?? "Label",
                  textAlign: TextAlign.start,
                ),
              )),
          TextInputCustom(
            controller: conttroller,
            onChange: onChange,
            digitInputUserColor: quartaryColro,
            hint: hint ?? "hint",
            backGroundColor: Colors.transparent,
            isColapsed: false,
            hintColor: quartaryColro.withOpacity(0.5),
            prefix: Icon(
              Icons.attach_money_rounded,
              color: quartaryColro,
            ),
            textType: textInputType ?? TextInputType.number,
          )
        ],
      ),
    );
  }
}
