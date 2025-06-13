import 'package:flutter/material.dart';
import 'package:scaffold_project/Domain/DTO/expense_v2.dart';
import 'package:scaffold_project/Presentation/Widgets/item_list/item_list.dart';
import 'package:scaffold_project/Utils/functions_helpers.dart';

class ListExpenseStore extends ChangeNotifier {
  List<ItensIndexed> listExpense = [];


  removeItem(String hash){
    listExpense.removeWhere((element) => element.hash == hash);
    notifyListeners();
  }

  constructList(List listaDespesasAgrupadas) {
    listExpense.clear();

    if (listaDespesasAgrupadas.isEmpty) {
      ItensIndexed itemIndexed = ItensIndexed(
          hash: '', widget: TitleList(title: DateTime.now().year.toString()));
      listExpense.add(itemIndexed);
      return;
    }

    for (var element in listaDespesasAgrupadas) {
      String year = element['ano'].toString();

      for (var month in element['meses']) {
        ItensIndexed itemIndexed = ItensIndexed(
            hash: '',
            widget: TitleList(
                title: '${Global.defineMonth(month['mes'])} de $year'));
        listExpense.add(itemIndexed);

        for (var item in month['itens']) {
          Expensev2DTO expense = Expensev2DTO.fromJSON(item);

          ItensIndexed itemIndexed = ItensIndexed(
              hash: expense.hash,
              widget: ItemListWidget(
                descriptionSpent: expense.descricao,
                valueSpent: expense.valorGasto,
                waySpent: expense.tipoDespesa,
                id: expense.id,
                hash: expense.hash,
              ));

          listExpense.add(itemIndexed);
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
    ItensIndexed item = ItensIndexed(
        hash: value.hash,
        widget: ItemListWidget(
          descriptionSpent: value.descricao,
          valueSpent: value.valorGasto,
          waySpent: value.tipoDespesa,
          id: value.id,
          hash: value.hash,
        ));

    listExpense.insert(1, item);

    notifyListeners();
  }
}

class ItensIndexed {
  late Widget widget;
  late String hash;

  ItensIndexed({required this.widget, required this.hash});
}
