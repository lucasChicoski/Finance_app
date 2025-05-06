import 'package:flutter/material.dart';
import 'package:scaffold_project/Presentation/Widgets/item_list/item_list.dart';
import 'package:scaffold_project/Utils/functions_helpers.dart';

class ListExpenseStore extends ChangeNotifier {
  List<Widget> listExpense = [];

  constructList(List listaDespesasAgrupadas) {
    if (listaDespesasAgrupadas.isEmpty) {
      listExpense.add(TitleList(title: '2025'));
      return;
    }

    for (var element in listaDespesasAgrupadas) {
      String year = element.ano.toString();

      for (var month in element.month) {
        listExpense.add(TitleList(title: '${Global.defineMonth(month.mes)} de $year'));

        for (var item in month.itens) {
          listExpense.add(ItemListWidget(
            descriptionSpent: item.descricao,
            valueSpent: item.valorGasto,
            waySpent: item.tipoDespesa,
            id: '1',
          ));
        }
      }
    }

    notifyListeners();
  }
}
