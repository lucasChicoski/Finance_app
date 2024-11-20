import 'package:flutter/material.dart';
import 'package:scaffold_project/Presentation/Components/buttons/elevated_button_custom.dart';
import 'package:scaffold_project/Presentation/Components/text_input/text_input_custom.dart';
import 'package:scaffold_project/Utils/size_config.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

alert(BuildContext context, {String item = ''}) {
  double sizeButton = 0.3;
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: SizedBox(
        height: MQueryCustom(context, type: 'h', porcent: 0.4),
        width: MQueryCustom(context, type: 'w'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Edição de gasto',
                  style: TextStyle(
                      color: secundaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Descrição: $item',
                  style: TextStyle(
                      color: secundaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 30),
                const TextInputCustom(
                    hint: 'Valor do gasto',
                    prefix: Icon(Icons.attach_money),
                    textType: TextInputType.number),
                const SizedBox(
                  height: 10,
                ),
                const TextInputCustom(
                    textType: TextInputType.text,
                    hint: 'Descrição do gasto',
                    prefix: Icon(
                      Icons.description,
                    )),
              ],
            ),
            Wrap(
              children: [
                ElevatedButtonCustom(
                  label: 'Excluir',
                  size: sizeButton,
                  onPressed: (){},
                ),
                const SizedBox(width: 10),
                ElevatedButtonCustom(label: 'Atualizar', size: sizeButton, onPressed: (){},),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
