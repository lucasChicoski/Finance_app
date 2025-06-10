import 'package:flutter/material.dart';
import 'package:scaffold_project/Domain/DTO/expense_v2.dart';
import 'package:scaffold_project/Presentation/Widgets/item_list/item_list.dart';
import 'package:scaffold_project/Utils/functions_helpers.dart';

class ListExpenseStore extends ChangeNotifier {
  List<Widget> listExpense = [];

  constructList(List listaDespesasAgrupadas) {
    listExpense.clear();
    
    if (listaDespesasAgrupadas.isEmpty) {
      listExpense.add(TitleList(title: DateTime.now().year.toString()));
      return;
    }

    for (var element in listaDespesasAgrupadas) {
      String year = element['ano'].toString();

      for (var month in element['meses']) {
        listExpense.add(
            TitleList(title: '${Global.defineMonth(month['mes'])} de $year'));

        for (var item in month['itens']) {
          listExpense.add(ItemListWidget(
            descriptionSpent: item["descricao_despesa"],
            valueSpent: (item['valor_gasto'] as num).toDouble(),
            waySpent: item["tipo_despesa"],
            id: '1',
          ));
        }
      }
    }

    notifyListeners();
  }

  claarList() {
    listExpense.clear();
    notifyListeners();
  }


  addNewItemToList(Expensev2DTO value) {
    listExpense.insert(
        1,
        ItemListWidget(
          descriptionSpent: value.descricao,
          valueSpent: value.valorGasto,
          waySpent: value.tipoDespesa,
          id: '1',
        ));

    notifyListeners();
  }
}
