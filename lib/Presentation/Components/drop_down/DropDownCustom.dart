import 'package:flutter/material.dart';
import 'package:scaffold_project/Domain/Models/DropMenuItensModel.dart';
import 'package:scaffold_project/Utils/size_config.dart';

class DropDownCustom extends StatelessWidget {
  final List<DropDownItensModel> listItens;
  final Function(int? value)? onSelected;
  const DropDownCustom(
      {super.key, required this.listItens, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: MQueryCustom(context, type: 'w', porcent: 0.9),
      textStyle: const TextStyle(color: Colors.black),
      hintText: 'Categorias',
      onSelected: onSelected,
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.only(left: 10),
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.5),
          isCollapsed: true,
          hintStyle: const TextStyle(color: Colors.black26)),
      dropdownMenuEntries: [
        for (int i = 0; i < listItens.length; i++)
          DropdownMenuEntry(
              value: listItens[i].value, label: listItens[i].label)
      ],
    );
  }
}
