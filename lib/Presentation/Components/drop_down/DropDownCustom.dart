import 'package:flutter/material.dart';
import 'package:scaffold_project/Utils/size_config.dart';

class DropDownCustom extends StatelessWidget {
  const DropDownCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: MQueryCustom(context, type: 'w', porcent: 0.9),
      textStyle: TextStyle(color: Colors.black),
      hintText: 'Categorias',
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.only(left: 10),
        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.5),
        isCollapsed: true,
        hintStyle: TextStyle(color:  Colors.black26)
      ),
      dropdownMenuEntries: [
        DropdownMenuEntry(value: 'teste', label: 'teste'),
      ],
    );
  }
}