import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Controller/Financial/ExpensesInstallmentsApplication.dart';
import 'package:scaffold_project/Domain/DTO/ExpenseInstallmentDTO.dart';
import 'package:scaffold_project/Presentation/store/financial_store.dart';
import 'package:scaffold_project/Presentation/Widgets/table/table_windget.dart';
import 'package:scaffold_project/Utils/functions_helpers.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';

FinancialStore _financialStore = GetIt.I<FinancialStore>();
ExpensesInstallmentsApplication _expensesInstallmentsApplication =
    ExpensesInstallmentsApplication();

class FinancialDividedViewModel extends ChangeNotifier {
  //Aux Var
  int _year = Global.getDate().year;
  //Global Var
  String description = '';
  double valueSpent = 0;
  int qParcela = 0;
  double valueParcela = 0;

  List<TableRow> listExpansive = [];

  setDescription(String value) {
    description = value;
  }

  setValueSpent(String value) {
    valueSpent =
        value.isNotEmpty ? double.parse(value.replaceAll(",", ".")) : 0;
  }

  setQParcela(String value) {
    qParcela = value.isNotEmpty ? int.parse(value.replaceAll(",", ".")) : 1;
  }

  setValueParcela(String value) {
    valueParcela =
        value.isNotEmpty ? double.parse(value.replaceAll(",", ".")) : 0;
  }

  addExpense(String description, double valueSpent, int qParcela,
      BuildContext context) async {
    String hash = Global.getHash();
    _year = Global.getDate().year;
    //Validação se o valor gasto e quantidade de parcela existe

    if (this.valueSpent < 1) {
      print('É preciso adicionar um valor gasto');
      return;
    }

    valueParcela = double.parse((valueSpent / qParcela).toStringAsFixed(2));

    ExpenseInstallmentDTO response;

    //Gravar no banco
    try {
      Map<String, String> item = {
        "descricao_despesa": description,
        "valor_gasto": valueSpent.toString(),
        "prestacoes": valueParcela.toString(), //Valor das prestações
        "parcela": qParcela.toString(), // Quantidade de parcela
        "user_id": 1.toString()
      };

      response =
          await _expensesInstallmentsApplication.insertInstallments(item);
    } catch (e) {
      return;
    }

    listExpansive.add(
        RowOfTable(description, qParcela, valueParcela, valueSpent, hash)
            .row());

    for (var i = 0; i < qParcela; i++) {
      await _financialStore.addExpense(
        'Despesa parcelada',
        '$description - Parcela $i',
        valueSpent,
        context,
        popContext: false,
        isDivided: true,
        qParcela: qParcela,
        valueParcela: valueParcela,
        month: i == 0
            ? Global.getDate().month
            : getCurrentMonth(Global.getDate().month, i),
        year: _year,
        addItemList: i == 0 ? true : false,
        expenseInstallmentId: response.id,
        iteratorParcela: i
      );
    }

    this.valueSpent = 0;

    notifyListeners();

    NavigationPages.pop(context);
  }

  int getCurrentMonth(int currentMonth, int iteratorMonth) {
    int month;
    if ((currentMonth + iteratorMonth) <= 12) {
      month = currentMonth + iteratorMonth;
      return month;
    } else {
      month = ((currentMonth + iteratorMonth) - 1) % 12 + 1;
      if (month == 12 || month == 1) _year = _year + 1;
      return month;
    }
  }

  loadTable(List<ExpenseInstallmentDTO> itens) {
    for (ExpenseInstallmentDTO element in itens) {
      listExpansive.add(RowOfTable(element.descricaoDespesa, element.qParcela,
              element.prestacoes, element.valorGasto, '')
          .row());
    }

    notifyListeners();
  }
}
